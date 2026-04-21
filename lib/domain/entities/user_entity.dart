import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

/// User role enum
enum UserRole {
  resident,
  security,
  admin,
  vendor,
  owner, // Property owner role (can toggle with admin)
}

/// User entity representing authentication and profile data
@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String uid,
    required String email,
    String? phoneNumber,
    String? displayName,
    String? photoUrl,
    required UserRole role,
    String? societyId,
    String? flatId,
    @Default(false) bool isEmailVerified,
    @Default(false) bool isPhoneVerified,
    @Default(true) bool isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastLoginAt,
    Map<String, dynamic>? metadata,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
}

/// Extended resident-specific data
@freezed
class ResidentProfile with _$ResidentProfile {
  const factory ResidentProfile({
    required String userId,
    required String societyId,
    required String flatId,
    required String firstName,
    required String lastName,
    String? middleName,
    required String phoneNumber,
    String? alternatePhoneNumber,
    String? email,
    String? photoUrl,
    @Default(['resident']) List<String> roles,
    @Default(false) bool isPrimaryContact,
    List<String>? familyMemberUids,
    String? vehicleNumber,
    String? emergencyContactName,
    String? emergencyContactPhone,
    DateTime? moveInDate,
    DateTime? moveOutDate,
    @Default(true) bool canReceiveNotifications,
    List<String>? fcmTokens,
    Map<String, dynamic>? preferences,
  }) = _ResidentProfile;

  factory ResidentProfile.fromJson(Map<String, dynamic> json) => _$ResidentProfileFromJson(json);
}

/// Security personnel profile
@freezed
class SecurityProfile with _$SecurityProfile {
  const factory SecurityProfile({
    required String userId,
    required String societyId,
    required String employeeId,
    required String fullName,
    required String phoneNumber,
    String? photoUrl,
    String? shift,
    String? gateAssignment,
    DateTime? joinDate,
    DateTime? lastActiveAt,
    @Default(true) bool isOnDuty,
    List<String>? assignedGates,
    Map<String, dynamic>? permissions,
  }) = _SecurityProfile;

  factory SecurityProfile.fromJson(Map<String, dynamic> json) => _$SecurityProfileFromJson(json);
}

/// Admin profile
@freezed
class AdminProfile with _$AdminProfile {
  const factory AdminProfile({
    required String userId,
    required String societyId,
    required String fullName,
    required String phoneNumber,
    required String email,
    String? photoUrl,
    @Default(['admin']) List<String> roles,
    String? designation,
    DateTime? appointedDate,
    Map<String, dynamic>? permissions,
    @Default(false) bool isOwner, // True if this admin is also a property owner
    String? ownerId, // Reference to owner profile if applicable
  }) = _AdminProfile;

  factory AdminProfile.fromJson(Map<String, dynamic> json) => _$AdminProfileFromJson(json);
}

/// Owner profile (property owner who can also act as admin)
@freezed
class OwnerProfile with _$OwnerProfile {
  const factory OwnerProfile({
    required String userId,
    required String societyId,
    required String fullName,
    required String phoneNumber,
    required String email,
    String? photoUrl,
    @Default(['owner']) List<String> roles,
    List<String>? ownedFlatIds, // Properties owned by this user
    DateTime? registeredDate,
    Map<String, dynamic>? permissions,
    @Default(true) bool canActAsAdmin, // Can toggle to admin mode
    @Default(false) bool isAdminMode, // Currently acting as admin
  }) = _OwnerProfile;

  factory OwnerProfile.fromJson(Map<String, dynamic> json) => _$OwnerProfileFromJson(json);
}

/// Vendor profile
@freezed
class VendorProfile with _$VendorProfile {
  const factory VendorProfile({
    required String userId,
    required String businessName,
    required String contactPerson,
    required String phoneNumber,
    String? email,
    String? serviceType,
    String? photoUrl,
    String? licenseNumber,
    List<String>? allowedSocieties,
    DateTime? registeredDate,
    @Default(true) bool isActive,
    Map<String, dynamic>? metadata,
  }) = _VendorProfile;

  factory VendorProfile.fromJson(Map<String, dynamic> json) => _$VendorProfileFromJson(json);
}
