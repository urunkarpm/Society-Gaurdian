import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/constants/app_constants.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository_interface.dart';

part 'auth_provider.g.dart';

/// Secure storage for tokens
const _secureStorage = FlutterSecureStorage();

/// Authentication state
enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

/// Auth state holder
class AuthState {
  final AuthStatus status;
  final UserEntity? user;
  final String? errorMessage;
  final bool isSecurityPersonnel;
  final bool isAdmin;

  const AuthState({
    this.status = AuthStatus.initial,
    this.user,
    this.errorMessage,
    this.isSecurityPersonnel = false,
    this.isAdmin = false,
  });

  AuthState copyWith({
    AuthStatus? status,
    UserEntity? user,
    String? errorMessage,
    bool? isSecurityPersonnel,
    bool? isAdmin,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
      isSecurityPersonnel: isSecurityPersonnel ?? this.isSecurityPersonnel,
      isAdmin: isAdmin ?? this.isAdmin,
    );
  }

  bool get isAuthenticated => status == AuthStatus.authenticated && user != null;
  bool get isLoading => status == AuthStatus.loading;
  bool get isError => status == AuthStatus.error;
}

/// Auth notifier provider
@riverpod
class Auth extends _$Auth {
  late final AuthRepositoryInterface _repository;

  @override
  AuthState build() {
    _repository = ref.read(authRepositoryProvider);
    
    // Listen to auth state changes
    FirebaseAuth.instance.authStateChanges().listen((firebaseUser) {
      if (firebaseUser != null) {
        _loadUserData(firebaseUser.uid);
      } else {
        state = const AuthState(status: AuthStatus.unauthenticated);
      }
    });

    return const AuthState(status: AuthStatus.initial);
  }

  Future<void> _loadUserData(String uid) async {
    state = state.copyWith(status: AuthStatus.loading);
    
    try {
      final result = await _repository.getUserByUid(uid);
      
      result.fold(
        (failure) {
          state = state.copyWith(
            status: AuthStatus.error,
            errorMessage: 'Failed to load user data',
          );
        },
        (user) {
          state = state.copyWith(
            status: AuthStatus.authenticated,
            user: user,
            isSecurityPersonnel: user.role == AppConstants.roleSecurity,
            isAdmin: user.role == AppConstants.roleAdmin,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  /// Sign in with email and password (for security personnel)
  Future<Either<String, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(status: AuthStatus.loading);
    
    try {
      final result = await _repository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      return result.fold(
        (failure) => Left(failure),
        (user) {
          state = state.copyWith(
            status: AuthStatus.authenticated,
            user: user,
            isSecurityPersonnel: user.role == AppConstants.roleSecurity,
            isAdmin: user.role == AppConstants.roleAdmin,
          );
          return Right(user);
        },
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.toString(),
      );
      return Left(e.toString());
    }
  }

  /// Sign in with phone OTP (for residents)
  Future<Either<String, void>> signInWithPhone({
    required String phoneNumber,
    required String verificationId,
    required String smsCode,
  }) async {
    state = state.copyWith(status: AuthStatus.loading);
    
    try {
      final result = await _repository.signInWithPhone(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      
      return result.fold(
        (failure) => Left(failure),
        (_) {
          // Auth state listener will handle the rest
          return const Right(null);
        },
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.toString(),
      );
      return Left(e.toString());
    }
  }

  /// Send OTP for phone authentication
  Future<Either<String, String>> sendPhoneOTP({
    required String phoneNumber,
    required void Function(String verificationId) onCodeSent,
  }) async {
    try {
      return await _repository.sendPhoneOTP(
        phoneNumber: phoneNumber,
        onCodeSent: onCodeSent,
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  /// Sign out
  Future<void> signOut() async {
    await _repository.signOut();
    state = const AuthState(status: AuthStatus.unauthenticated);
  }

  /// Check biometric authentication
  Future<bool> authenticateWithBiometrics() async {
    return await _repository.authenticateWithBiometrics();
  }

  /// Refresh user data
  Future<void> refreshUserData() async {
    if (state.user != null) {
      await _loadUserData(state.user!.uid);
    }
  }
}

/// Auth repository provider
@riverpod
AuthRepositoryInterface authRepository(AuthRepositoryRef ref) {
  return AuthRepository(
    firestore: FirebaseFirestore.instance,
    auth: FirebaseAuth.instance,
    secureStorage: _secureStorage,
  );
}

/// Current user provider
@riverpod
UserEntity? currentUser(CurrentUserRef ref) {
  final authState = ref.watch(authProvider);
  return authState.user;
}

/// Current user role provider
@riverpod
String? currentUserRole(CurrentUserRoleRef ref) {
  final user = ref.watch(currentUserProvider);
  return user?.role;
}

/// Is security personnel provider
@riverpod
bool isSecurityPersonnel(IsSecurityPersonnelRef ref) {
  final authState = ref.watch(authProvider);
  return authState.isSecurityPersonnel;
}

/// Is admin provider
@riverpod
bool isAdmin(IsAdminRef ref) {
  final authState = ref.watch(authProvider);
  return authState.isAdmin;
}

/// Auth repository implementation
class AuthRepository implements AuthRepositoryInterface {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final FlutterSecureStorage _secureStorage;

  AuthRepository({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
    required FlutterSecureStorage secureStorage,
  })  : _firestore = firestore,
        _auth = auth,
        _secureStorage = secureStorage;

  @override
  Future<Either<String, UserEntity>> getUserByUid(String uid) async {
    try {
      final doc = await _firestore
          .collection(AppConstants.usersCollection)
          .doc(uid)
          .get();

      if (!doc.exists) {
        return const Left('User not found');
      }

      final user = UserEntity.fromJson(doc.data()!);
      return Right(user);
    } catch (e) {
      return Left('Error fetching user: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userDoc = await _firestore
          .collection(AppConstants.usersCollection)
          .doc(credential.user!.uid)
          .get();

      if (!userDoc.exists) {
        await _auth.signOut();
        return const Left('User profile not found');
      }

      final user = UserEntity.fromJson(userDoc.data()!);
      
      // Store token securely
      final idToken = await credential.user!.getIdToken();
      await _secureStorage.write(key: 'auth_token', value: idToken);

      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(_handleAuthException(e));
    } catch (e) {
      return Left('Sign in failed: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, void>> signInWithPhone({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      await _auth.signInWithCredential(credential);
      
      // User document will be loaded by auth state listener
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(_handleAuthException(e));
    } catch (e) {
      return Left('Phone sign in failed: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, String>> sendPhoneOTP({
    required String phoneNumber,
    required void Function(String verificationId) onCodeSent,
  }) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          // Handled by caller
        },
        codeSent: (verificationId, resendToken) {
          onCodeSent(verificationId);
        },
        codeAutoRetrievalTimeout: (verificationId) {
          // Auto-retrieval timed out
        },
      );

      return const Right('OTP sent successfully');
    } on FirebaseAuthException catch (e) {
      return Left(_handleAuthException(e));
    } catch (e) {
      return Left('Failed to send OTP: ${e.toString()}');
    }
  }

  @override
  Future<void> signOut() async {
    await _secureStorage.delete(key: 'auth_token');
    await _auth.signOut();
  }

  @override
  Future<bool> authenticateWithBiometrics() async {
    // Implementation in platform-specific code
    // This is a placeholder
    return false;
  }

  String _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'Invalid email address';
      case 'user-disabled':
        return 'This account has been disabled';
      case 'user-not-found':
        return 'No account found with this email';
      case 'wrong-password':
        return 'Incorrect password';
      case 'email-already-in-use':
        return 'Email already in use';
      case 'weak-password':
        return 'Password is too weak';
      case 'operation-not-allowed':
        return 'This operation is not allowed';
      case 'too-many-requests':
        return 'Too many attempts. Try again later';
      default:
        return 'Authentication failed: ${e.message}';
    }
  }
}
