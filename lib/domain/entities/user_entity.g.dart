// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      uid: json['uid'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      displayName: json['displayName'] as String?,
      photoUrl: json['photoUrl'] as String?,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      societyId: json['societyId'] as String?,
      flatId: json['flatId'] as String?,
      isEmailVerified: json['isEmailVerified'] as bool? ?? false,
      isPhoneVerified: json['isPhoneVerified'] as bool? ?? false,
      isActive: json['isActive'] as bool? ?? true,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      lastLoginAt: json['lastLoginAt'] == null
          ? null
          : DateTime.parse(json['lastLoginAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
      'role': _$UserRoleEnumMap[instance.role]!,
      'societyId': instance.societyId,
      'flatId': instance.flatId,
      'isEmailVerified': instance.isEmailVerified,
      'isPhoneVerified': instance.isPhoneVerified,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
      'metadata': instance.metadata,
    };

const _$UserRoleEnumMap = {
  UserRole.resident: 'resident',
  UserRole.security: 'security',
  UserRole.admin: 'admin',
  UserRole.vendor: 'vendor',
};

_$ResidentProfileImpl _$$ResidentProfileImplFromJson(
        Map<String, dynamic> json) =>
    _$ResidentProfileImpl(
      userId: json['userId'] as String,
      societyId: json['societyId'] as String,
      flatId: json['flatId'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      middleName: json['middleName'] as String?,
      phoneNumber: json['phoneNumber'] as String,
      alternatePhoneNumber: json['alternatePhoneNumber'] as String?,
      email: json['email'] as String?,
      photoUrl: json['photoUrl'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const ['resident'],
      isPrimaryContact: json['isPrimaryContact'] as bool? ?? false,
      familyMemberUids: (json['familyMemberUids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      vehicleNumber: json['vehicleNumber'] as String?,
      emergencyContactName: json['emergencyContactName'] as String?,
      emergencyContactPhone: json['emergencyContactPhone'] as String?,
      moveInDate: json['moveInDate'] == null
          ? null
          : DateTime.parse(json['moveInDate'] as String),
      moveOutDate: json['moveOutDate'] == null
          ? null
          : DateTime.parse(json['moveOutDate'] as String),
      canReceiveNotifications: json['canReceiveNotifications'] as bool? ?? true,
      fcmTokens: (json['fcmTokens'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      preferences: json['preferences'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ResidentProfileImplToJson(
        _$ResidentProfileImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'societyId': instance.societyId,
      'flatId': instance.flatId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'phoneNumber': instance.phoneNumber,
      'alternatePhoneNumber': instance.alternatePhoneNumber,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'roles': instance.roles,
      'isPrimaryContact': instance.isPrimaryContact,
      'familyMemberUids': instance.familyMemberUids,
      'vehicleNumber': instance.vehicleNumber,
      'emergencyContactName': instance.emergencyContactName,
      'emergencyContactPhone': instance.emergencyContactPhone,
      'moveInDate': instance.moveInDate?.toIso8601String(),
      'moveOutDate': instance.moveOutDate?.toIso8601String(),
      'canReceiveNotifications': instance.canReceiveNotifications,
      'fcmTokens': instance.fcmTokens,
      'preferences': instance.preferences,
    };

_$SecurityProfileImpl _$$SecurityProfileImplFromJson(
        Map<String, dynamic> json) =>
    _$SecurityProfileImpl(
      userId: json['userId'] as String,
      societyId: json['societyId'] as String,
      employeeId: json['employeeId'] as String,
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      photoUrl: json['photoUrl'] as String?,
      shift: json['shift'] as String?,
      gateAssignment: json['gateAssignment'] as String?,
      joinDate: json['joinDate'] == null
          ? null
          : DateTime.parse(json['joinDate'] as String),
      lastActiveAt: json['lastActiveAt'] == null
          ? null
          : DateTime.parse(json['lastActiveAt'] as String),
      isOnDuty: json['isOnDuty'] as bool? ?? true,
      assignedGates: (json['assignedGates'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      permissions: json['permissions'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$SecurityProfileImplToJson(
        _$SecurityProfileImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'societyId': instance.societyId,
      'employeeId': instance.employeeId,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'photoUrl': instance.photoUrl,
      'shift': instance.shift,
      'gateAssignment': instance.gateAssignment,
      'joinDate': instance.joinDate?.toIso8601String(),
      'lastActiveAt': instance.lastActiveAt?.toIso8601String(),
      'isOnDuty': instance.isOnDuty,
      'assignedGates': instance.assignedGates,
      'permissions': instance.permissions,
    };

_$AdminProfileImpl _$$AdminProfileImplFromJson(Map<String, dynamic> json) =>
    _$AdminProfileImpl(
      userId: json['userId'] as String,
      societyId: json['societyId'] as String,
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const ['admin'],
      designation: json['designation'] as String?,
      appointedDate: json['appointedDate'] == null
          ? null
          : DateTime.parse(json['appointedDate'] as String),
      permissions: json['permissions'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AdminProfileImplToJson(_$AdminProfileImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'societyId': instance.societyId,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'roles': instance.roles,
      'designation': instance.designation,
      'appointedDate': instance.appointedDate?.toIso8601String(),
      'permissions': instance.permissions,
    };

_$VendorProfileImpl _$$VendorProfileImplFromJson(Map<String, dynamic> json) =>
    _$VendorProfileImpl(
      userId: json['userId'] as String,
      businessName: json['businessName'] as String,
      contactPerson: json['contactPerson'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String?,
      serviceType: json['serviceType'] as String?,
      photoUrl: json['photoUrl'] as String?,
      licenseNumber: json['licenseNumber'] as String?,
      allowedSocieties: (json['allowedSocieties'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      registeredDate: json['registeredDate'] == null
          ? null
          : DateTime.parse(json['registeredDate'] as String),
      isActive: json['isActive'] as bool? ?? true,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$VendorProfileImplToJson(_$VendorProfileImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'businessName': instance.businessName,
      'contactPerson': instance.contactPerson,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'serviceType': instance.serviceType,
      'photoUrl': instance.photoUrl,
      'licenseNumber': instance.licenseNumber,
      'allowedSocieties': instance.allowedSocieties,
      'registeredDate': instance.registeredDate?.toIso8601String(),
      'isActive': instance.isActive,
      'metadata': instance.metadata,
    };
