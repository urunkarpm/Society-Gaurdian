import 'package:dartz/dartz.dart';
import '../entities/user_entity.dart';

/// Abstract repository interface for authentication
abstract class AuthRepositoryInterface {
  /// Get user by UID from Firestore
  Future<Either<String, UserEntity>> getUserByUid(String uid);

  /// Sign in with email and password
  Future<Either<String, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Sign in with phone OTP
  Future<Either<String, void>> signInWithPhone({
    required String verificationId,
    required String smsCode,
  });

  /// Send phone OTP for authentication
  Future<Either<String, String>> sendPhoneOTP({
    required String phoneNumber,
    required void Function(String verificationId) onCodeSent,
  });

  /// Sign out current user
  Future<void> signOut();

  /// Authenticate with biometrics
  Future<bool> authenticateWithBiometrics();
}
