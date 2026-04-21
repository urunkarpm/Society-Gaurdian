import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/entities/user_entity.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/logger.dart';

/// Authentication state provider
final authStateProvider = StreamProvider<UserEntity?>((ref) {
  return FirebaseAuth.instance.authStateChanges().asyncMap((user) async {
    if (user == null) return null;
    
    // Fetch user profile from Firestore
    final userDoc = await FirebaseFirestore.instance
        .collection(AppConstants.usersCollection)
        .doc(user.uid)
        .get();
    
    if (!userDoc.exists) {
      Logger.warning('User document not found', tag: 'AuthProvider');
      return null;
    }
    
    final data = userDoc.data()!;
    
    // Check if user needs to complete residence verification
    final verificationStatus = data['verificationStatus'];
    final role = data['role'];
    
    // If user has no role or is pending verification, they should be treated as unverified resident
    if (role == null || verificationStatus == 'pending') {
      // User needs to select residence or wait for approval
      return UserEntity(
        uid: user.uid,
        email: user.email ?? data['email'] ?? '',
        phoneNumber: user.phoneNumber ?? data['phoneNumber'],
        displayName: user.displayName ?? data['displayName'],
        photoUrl: user.photoURL ?? data['photoUrl'],
        role: UserRole.resident, // Temporary role for routing
        societyId: data['societyId'],
        flatId: data['flatId'],
        isEmailVerified: user.emailVerified || data['isEmailVerified'] ?? false,
        isPhoneVerified: user.phoneNumber != null || data['isPhoneVerified'] ?? false,
        isActive: data['isActive'] ?? true,
        createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
        updatedAt: (data['updatedAt'] as Timestamp?)?.toDate(),
        lastLoginAt: (data['lastLoginAt'] as Timestamp?)?.toDate(),
        metadata: {...data, 'verificationStatus': verificationStatus} as Map<String, dynamic>?,
      );
    }
    
    return UserEntity(
      uid: user.uid,
      email: user.email ?? data['email'] ?? '',
      phoneNumber: user.phoneNumber ?? data['phoneNumber'],
      displayName: user.displayName ?? data['displayName'],
      photoUrl: user.photoURL ?? data['photoUrl'],
      role: UserRole.values.firstWhere(
        (e) => e.name == data['role'],
        orElse: () => UserRole.resident,
      ),
      societyId: data['societyId'],
      flatId: data['flatId'],
      isEmailVerified: user.emailVerified || data['isEmailVerified'] ?? false,
      isPhoneVerified: user.phoneNumber != null || data['isPhoneVerified'] ?? false,
      isActive: data['isActive'] ?? true,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate(),
      lastLoginAt: (data['lastLoginAt'] as Timestamp?)?.toDate(),
      metadata: data['metadata'] as Map<String, dynamic>?,
    );
  });
});

/// Current user provider
final currentUserProvider = Provider<UserEntity?>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.value;
});

/// User role provider
final userRoleProvider = Provider<UserRole?>((ref) {
  final user = ref.watch(currentUserProvider);
  return user?.role;
});

/// Check if user is resident
final isResidentProvider = Provider<bool>((ref) {
  final role = ref.watch(userRoleProvider);
  return role == UserRole.resident;
});

/// Check if user is security
final isSecurityProvider = Provider<bool>((ref) {
  final role = ref.watch(userRoleProvider);
  return role == UserRole.security;
});

/// Check if user is admin
final isAdminProvider = Provider<bool>((ref) {
  final role = ref.watch(userRoleProvider);
  return role == UserRole.admin;
});

/// Society ID provider
final societyIdProvider = Provider<String?>((ref) {
  final user = ref.watch(currentUserProvider);
  return user?.societyId;
});

/// Flat ID provider
final flatIdProvider = Provider<String?>((ref) {
  final user = ref.watch(currentUserProvider);
  return user?.flatId;
});

/// Authentication service provider
final authServiceProviders = Provider<AuthService>((ref) {
  return AuthService();
});

/// Authentication Service
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  );

  User? get currentUser => _auth.currentUser;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Sign in with Google (for residents and all users)
  Future<UserCredential> signInWithGoogle() async {
    try {
      Logger.log('Signing in with Google', tag: 'AuthService');
      
      // Trigger the Google sign-in flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception('Google sign-in was cancelled');
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credentials
      final userCredential = await _auth.signInWithCredential(credential);
      
      // Update last login time
      await _updateLastLogin(userCredential.user!.uid);
      
      Logger.auth('Google sign in successful', userId: userCredential.user!.uid);
      return userCredential;
    } catch (e, stackTrace) {
      Logger.error('Google sign in failed', error: e, stackTrace: stackTrace, tag: 'AuthService');
      rethrow;
    }
  }

  /// Sign in with email and password (for security personnel)
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      Logger.log('Signing in with email', tag: 'AuthService');
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      // Update last login time
      await _updateLastLogin(credential.user!.uid);
      
      Logger.auth('Sign in successful', userId: credential.user!.uid);
      return credential;
    } catch (e, stackTrace) {
      Logger.error('Sign in failed', error: e, stackTrace: stackTrace, tag: 'AuthService');
      rethrow;
    }
  }

  /// Sign out
  Future<void> signOut() async {
    try {
      Logger.log('Signing out', tag: 'AuthService');
      await _auth.signOut();
      Logger.auth('Sign out successful');
    } catch (e, stackTrace) {
      Logger.error('Sign out failed', error: e, stackTrace: stackTrace, tag: 'AuthService');
      rethrow;
    }
  }

  /// Create user profile in Firestore
  Future<void> createUserProfile({
    required String uid,
    required String email,
    required UserRole role,
    String? phoneNumber,
    String? displayName,
    String? societyId,
    String? flatId,
  }) async {
    try {
      Logger.log('Creating user profile', tag: 'AuthService');
      final userData = {
        'uid': uid,
        'email': email,
        'phoneNumber': phoneNumber,
        'displayName': displayName,
        'role': role.name,
        'societyId': societyId,
        'flatId': flatId,
        'isEmailVerified': false,
        'isPhoneVerified': phoneNumber != null,
        'isActive': true,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      };

      await _firestore.collection(AppConstants.usersCollection).doc(uid).set(userData);
      Logger.firestore('create', AppConstants.usersCollection, docId: uid, data: userData);
    } catch (e, stackTrace) {
      Logger.error('Create user profile failed', error: e, stackTrace: stackTrace, tag: 'AuthService');
      rethrow;
    }
  }

  /// Update last login timestamp
  Future<void> _updateLastLogin(String uid) async {
    try {
      await _firestore.collection(AppConstants.usersCollection).doc(uid).update({
        'lastLoginAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e, stackTrace) {
      Logger.error('Update last login failed', error: e, stackTrace: stackTrace, tag: 'AuthService');
    }
  }

  /// Get custom claims
  Future<Map<String, dynamic>?> getCustomClaims() async {
    try {
      final user = currentUser;
      if (user == null) return null;
      
      final result = await user.getIdTokenResult(true);
      return result.claims;
    } catch (e, stackTrace) {
      Logger.error('Get custom claims failed', error: e, stackTrace: stackTrace, tag: 'AuthService');
      return null;
    }
  }

  /// Send password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      Logger.log('Sending password reset email', tag: 'AuthService');
      await _auth.sendPasswordResetEmail(email: email);
      Logger.log('Password reset email sent', tag: 'AuthService');
    } catch (e, stackTrace) {
      Logger.error('Send password reset failed', error: e, stackTrace: stackTrace, tag: 'AuthService');
      rethrow;
    }
  }

  /// Update user profile
  Future<void> updateProfile({
    String? displayName,
    String? photoUrl,
  }) async {
    try {
      final user = currentUser;
      if (user == null) throw Exception('No user logged in');

      await user.updateProfile(
        displayName: displayName,
        photoURL: photoUrl,
      );

      // Update Firestore as well
      await _firestore.collection(AppConstants.usersCollection).doc(user.uid).update({
        if (displayName != null) 'displayName': displayName,
        if (photoUrl != null) 'photoUrl': photoUrl,
        'updatedAt': FieldValue.serverTimestamp(),
      });
      
      Logger.log('Profile updated', tag: 'AuthService');
    } catch (e, stackTrace) {
      Logger.error('Update profile failed', error: e, stackTrace: stackTrace, tag: 'AuthService');
      rethrow;
    }
  }
}
