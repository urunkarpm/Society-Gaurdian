// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return _UserEntity.fromJson(json);
}

/// @nodoc
mixin _$UserEntity {
  String get uid => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  UserRole get role => throw _privateConstructorUsedError;
  String? get societyId => throw _privateConstructorUsedError;
  String? get flatId => throw _privateConstructorUsedError;
  bool get isEmailVerified => throw _privateConstructorUsedError;
  bool get isPhoneVerified => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  DateTime? get lastLoginAt => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserEntityCopyWith<UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
          UserEntity value, $Res Function(UserEntity) then) =
      _$UserEntityCopyWithImpl<$Res, UserEntity>;
  @useResult
  $Res call(
      {String uid,
      String email,
      String? phoneNumber,
      String? displayName,
      String? photoUrl,
      UserRole role,
      String? societyId,
      String? flatId,
      bool isEmailVerified,
      bool isPhoneVerified,
      bool isActive,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? lastLoginAt,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$UserEntityCopyWithImpl<$Res, $Val extends UserEntity>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? phoneNumber = freezed,
    Object? displayName = freezed,
    Object? photoUrl = freezed,
    Object? role = null,
    Object? societyId = freezed,
    Object? flatId = freezed,
    Object? isEmailVerified = null,
    Object? isPhoneVerified = null,
    Object? isActive = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? lastLoginAt = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      societyId: freezed == societyId
          ? _value.societyId
          : societyId // ignore: cast_nullable_to_non_nullable
              as String?,
      flatId: freezed == flatId
          ? _value.flatId
          : flatId // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isPhoneVerified: null == isPhoneVerified
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserEntityImplCopyWith<$Res>
    implements $UserEntityCopyWith<$Res> {
  factory _$$UserEntityImplCopyWith(
          _$UserEntityImpl value, $Res Function(_$UserEntityImpl) then) =
      __$$UserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String email,
      String? phoneNumber,
      String? displayName,
      String? photoUrl,
      UserRole role,
      String? societyId,
      String? flatId,
      bool isEmailVerified,
      bool isPhoneVerified,
      bool isActive,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? lastLoginAt,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$UserEntityImplCopyWithImpl<$Res>
    extends _$UserEntityCopyWithImpl<$Res, _$UserEntityImpl>
    implements _$$UserEntityImplCopyWith<$Res> {
  __$$UserEntityImplCopyWithImpl(
      _$UserEntityImpl _value, $Res Function(_$UserEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? phoneNumber = freezed,
    Object? displayName = freezed,
    Object? photoUrl = freezed,
    Object? role = null,
    Object? societyId = freezed,
    Object? flatId = freezed,
    Object? isEmailVerified = null,
    Object? isPhoneVerified = null,
    Object? isActive = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? lastLoginAt = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$UserEntityImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      societyId: freezed == societyId
          ? _value.societyId
          : societyId // ignore: cast_nullable_to_non_nullable
              as String?,
      flatId: freezed == flatId
          ? _value.flatId
          : flatId // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isPhoneVerified: null == isPhoneVerified
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserEntityImpl implements _UserEntity {
  const _$UserEntityImpl(
      {required this.uid,
      required this.email,
      this.phoneNumber,
      this.displayName,
      this.photoUrl,
      required this.role,
      this.societyId,
      this.flatId,
      this.isEmailVerified = false,
      this.isPhoneVerified = false,
      this.isActive = true,
      this.createdAt,
      this.updatedAt,
      this.lastLoginAt,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  factory _$UserEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserEntityImplFromJson(json);

  @override
  final String uid;
  @override
  final String email;
  @override
  final String? phoneNumber;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final UserRole role;
  @override
  final String? societyId;
  @override
  final String? flatId;
  @override
  @JsonKey()
  final bool isEmailVerified;
  @override
  @JsonKey()
  final bool isPhoneVerified;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final DateTime? lastLoginAt;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'UserEntity(uid: $uid, email: $email, phoneNumber: $phoneNumber, displayName: $displayName, photoUrl: $photoUrl, role: $role, societyId: $societyId, flatId: $flatId, isEmailVerified: $isEmailVerified, isPhoneVerified: $isPhoneVerified, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, lastLoginAt: $lastLoginAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEntityImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.societyId, societyId) ||
                other.societyId == societyId) &&
            (identical(other.flatId, flatId) || other.flatId == flatId) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                other.isEmailVerified == isEmailVerified) &&
            (identical(other.isPhoneVerified, isPhoneVerified) ||
                other.isPhoneVerified == isPhoneVerified) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                other.lastLoginAt == lastLoginAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      email,
      phoneNumber,
      displayName,
      photoUrl,
      role,
      societyId,
      flatId,
      isEmailVerified,
      isPhoneVerified,
      isActive,
      createdAt,
      updatedAt,
      lastLoginAt,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      __$$UserEntityImplCopyWithImpl<_$UserEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserEntityImplToJson(
      this,
    );
  }
}

abstract class _UserEntity implements UserEntity {
  const factory _UserEntity(
      {required final String uid,
      required final String email,
      final String? phoneNumber,
      final String? displayName,
      final String? photoUrl,
      required final UserRole role,
      final String? societyId,
      final String? flatId,
      final bool isEmailVerified,
      final bool isPhoneVerified,
      final bool isActive,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final DateTime? lastLoginAt,
      final Map<String, dynamic>? metadata}) = _$UserEntityImpl;

  factory _UserEntity.fromJson(Map<String, dynamic> json) =
      _$UserEntityImpl.fromJson;

  @override
  String get uid;
  @override
  String get email;
  @override
  String? get phoneNumber;
  @override
  String? get displayName;
  @override
  String? get photoUrl;
  @override
  UserRole get role;
  @override
  String? get societyId;
  @override
  String? get flatId;
  @override
  bool get isEmailVerified;
  @override
  bool get isPhoneVerified;
  @override
  bool get isActive;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  DateTime? get lastLoginAt;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResidentProfile _$ResidentProfileFromJson(Map<String, dynamic> json) {
  return _ResidentProfile.fromJson(json);
}

/// @nodoc
mixin _$ResidentProfile {
  String get userId => throw _privateConstructorUsedError;
  String get societyId => throw _privateConstructorUsedError;
  String get flatId => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get middleName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get alternatePhoneNumber => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  List<String> get roles => throw _privateConstructorUsedError;
  bool get isPrimaryContact => throw _privateConstructorUsedError;
  List<String>? get familyMemberUids => throw _privateConstructorUsedError;
  String? get vehicleNumber => throw _privateConstructorUsedError;
  String? get emergencyContactName => throw _privateConstructorUsedError;
  String? get emergencyContactPhone => throw _privateConstructorUsedError;
  DateTime? get moveInDate => throw _privateConstructorUsedError;
  DateTime? get moveOutDate => throw _privateConstructorUsedError;
  bool get canReceiveNotifications => throw _privateConstructorUsedError;
  List<String>? get fcmTokens => throw _privateConstructorUsedError;
  Map<String, dynamic>? get preferences => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResidentProfileCopyWith<ResidentProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResidentProfileCopyWith<$Res> {
  factory $ResidentProfileCopyWith(
          ResidentProfile value, $Res Function(ResidentProfile) then) =
      _$ResidentProfileCopyWithImpl<$Res, ResidentProfile>;
  @useResult
  $Res call(
      {String userId,
      String societyId,
      String flatId,
      String firstName,
      String lastName,
      String? middleName,
      String phoneNumber,
      String? alternatePhoneNumber,
      String? email,
      String? photoUrl,
      List<String> roles,
      bool isPrimaryContact,
      List<String>? familyMemberUids,
      String? vehicleNumber,
      String? emergencyContactName,
      String? emergencyContactPhone,
      DateTime? moveInDate,
      DateTime? moveOutDate,
      bool canReceiveNotifications,
      List<String>? fcmTokens,
      Map<String, dynamic>? preferences});
}

/// @nodoc
class _$ResidentProfileCopyWithImpl<$Res, $Val extends ResidentProfile>
    implements $ResidentProfileCopyWith<$Res> {
  _$ResidentProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? societyId = null,
    Object? flatId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? middleName = freezed,
    Object? phoneNumber = null,
    Object? alternatePhoneNumber = freezed,
    Object? email = freezed,
    Object? photoUrl = freezed,
    Object? roles = null,
    Object? isPrimaryContact = null,
    Object? familyMemberUids = freezed,
    Object? vehicleNumber = freezed,
    Object? emergencyContactName = freezed,
    Object? emergencyContactPhone = freezed,
    Object? moveInDate = freezed,
    Object? moveOutDate = freezed,
    Object? canReceiveNotifications = null,
    Object? fcmTokens = freezed,
    Object? preferences = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      societyId: null == societyId
          ? _value.societyId
          : societyId // ignore: cast_nullable_to_non_nullable
              as String,
      flatId: null == flatId
          ? _value.flatId
          : flatId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      alternatePhoneNumber: freezed == alternatePhoneNumber
          ? _value.alternatePhoneNumber
          : alternatePhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: null == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isPrimaryContact: null == isPrimaryContact
          ? _value.isPrimaryContact
          : isPrimaryContact // ignore: cast_nullable_to_non_nullable
              as bool,
      familyMemberUids: freezed == familyMemberUids
          ? _value.familyMemberUids
          : familyMemberUids // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      vehicleNumber: freezed == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      emergencyContactName: freezed == emergencyContactName
          ? _value.emergencyContactName
          : emergencyContactName // ignore: cast_nullable_to_non_nullable
              as String?,
      emergencyContactPhone: freezed == emergencyContactPhone
          ? _value.emergencyContactPhone
          : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      moveInDate: freezed == moveInDate
          ? _value.moveInDate
          : moveInDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      moveOutDate: freezed == moveOutDate
          ? _value.moveOutDate
          : moveOutDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      canReceiveNotifications: null == canReceiveNotifications
          ? _value.canReceiveNotifications
          : canReceiveNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      fcmTokens: freezed == fcmTokens
          ? _value.fcmTokens
          : fcmTokens // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      preferences: freezed == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResidentProfileImplCopyWith<$Res>
    implements $ResidentProfileCopyWith<$Res> {
  factory _$$ResidentProfileImplCopyWith(_$ResidentProfileImpl value,
          $Res Function(_$ResidentProfileImpl) then) =
      __$$ResidentProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String societyId,
      String flatId,
      String firstName,
      String lastName,
      String? middleName,
      String phoneNumber,
      String? alternatePhoneNumber,
      String? email,
      String? photoUrl,
      List<String> roles,
      bool isPrimaryContact,
      List<String>? familyMemberUids,
      String? vehicleNumber,
      String? emergencyContactName,
      String? emergencyContactPhone,
      DateTime? moveInDate,
      DateTime? moveOutDate,
      bool canReceiveNotifications,
      List<String>? fcmTokens,
      Map<String, dynamic>? preferences});
}

/// @nodoc
class __$$ResidentProfileImplCopyWithImpl<$Res>
    extends _$ResidentProfileCopyWithImpl<$Res, _$ResidentProfileImpl>
    implements _$$ResidentProfileImplCopyWith<$Res> {
  __$$ResidentProfileImplCopyWithImpl(
      _$ResidentProfileImpl _value, $Res Function(_$ResidentProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? societyId = null,
    Object? flatId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? middleName = freezed,
    Object? phoneNumber = null,
    Object? alternatePhoneNumber = freezed,
    Object? email = freezed,
    Object? photoUrl = freezed,
    Object? roles = null,
    Object? isPrimaryContact = null,
    Object? familyMemberUids = freezed,
    Object? vehicleNumber = freezed,
    Object? emergencyContactName = freezed,
    Object? emergencyContactPhone = freezed,
    Object? moveInDate = freezed,
    Object? moveOutDate = freezed,
    Object? canReceiveNotifications = null,
    Object? fcmTokens = freezed,
    Object? preferences = freezed,
  }) {
    return _then(_$ResidentProfileImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      societyId: null == societyId
          ? _value.societyId
          : societyId // ignore: cast_nullable_to_non_nullable
              as String,
      flatId: null == flatId
          ? _value.flatId
          : flatId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      alternatePhoneNumber: freezed == alternatePhoneNumber
          ? _value.alternatePhoneNumber
          : alternatePhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: null == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isPrimaryContact: null == isPrimaryContact
          ? _value.isPrimaryContact
          : isPrimaryContact // ignore: cast_nullable_to_non_nullable
              as bool,
      familyMemberUids: freezed == familyMemberUids
          ? _value._familyMemberUids
          : familyMemberUids // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      vehicleNumber: freezed == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      emergencyContactName: freezed == emergencyContactName
          ? _value.emergencyContactName
          : emergencyContactName // ignore: cast_nullable_to_non_nullable
              as String?,
      emergencyContactPhone: freezed == emergencyContactPhone
          ? _value.emergencyContactPhone
          : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      moveInDate: freezed == moveInDate
          ? _value.moveInDate
          : moveInDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      moveOutDate: freezed == moveOutDate
          ? _value.moveOutDate
          : moveOutDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      canReceiveNotifications: null == canReceiveNotifications
          ? _value.canReceiveNotifications
          : canReceiveNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      fcmTokens: freezed == fcmTokens
          ? _value._fcmTokens
          : fcmTokens // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      preferences: freezed == preferences
          ? _value._preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResidentProfileImpl implements _ResidentProfile {
  const _$ResidentProfileImpl(
      {required this.userId,
      required this.societyId,
      required this.flatId,
      required this.firstName,
      required this.lastName,
      this.middleName,
      required this.phoneNumber,
      this.alternatePhoneNumber,
      this.email,
      this.photoUrl,
      final List<String> roles = const ['resident'],
      this.isPrimaryContact = false,
      final List<String>? familyMemberUids,
      this.vehicleNumber,
      this.emergencyContactName,
      this.emergencyContactPhone,
      this.moveInDate,
      this.moveOutDate,
      this.canReceiveNotifications = true,
      final List<String>? fcmTokens,
      final Map<String, dynamic>? preferences})
      : _roles = roles,
        _familyMemberUids = familyMemberUids,
        _fcmTokens = fcmTokens,
        _preferences = preferences;

  factory _$ResidentProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResidentProfileImplFromJson(json);

  @override
  final String userId;
  @override
  final String societyId;
  @override
  final String flatId;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? middleName;
  @override
  final String phoneNumber;
  @override
  final String? alternatePhoneNumber;
  @override
  final String? email;
  @override
  final String? photoUrl;
  final List<String> _roles;
  @override
  @JsonKey()
  List<String> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  @JsonKey()
  final bool isPrimaryContact;
  final List<String>? _familyMemberUids;
  @override
  List<String>? get familyMemberUids {
    final value = _familyMemberUids;
    if (value == null) return null;
    if (_familyMemberUids is EqualUnmodifiableListView)
      return _familyMemberUids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? vehicleNumber;
  @override
  final String? emergencyContactName;
  @override
  final String? emergencyContactPhone;
  @override
  final DateTime? moveInDate;
  @override
  final DateTime? moveOutDate;
  @override
  @JsonKey()
  final bool canReceiveNotifications;
  final List<String>? _fcmTokens;
  @override
  List<String>? get fcmTokens {
    final value = _fcmTokens;
    if (value == null) return null;
    if (_fcmTokens is EqualUnmodifiableListView) return _fcmTokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _preferences;
  @override
  Map<String, dynamic>? get preferences {
    final value = _preferences;
    if (value == null) return null;
    if (_preferences is EqualUnmodifiableMapView) return _preferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ResidentProfile(userId: $userId, societyId: $societyId, flatId: $flatId, firstName: $firstName, lastName: $lastName, middleName: $middleName, phoneNumber: $phoneNumber, alternatePhoneNumber: $alternatePhoneNumber, email: $email, photoUrl: $photoUrl, roles: $roles, isPrimaryContact: $isPrimaryContact, familyMemberUids: $familyMemberUids, vehicleNumber: $vehicleNumber, emergencyContactName: $emergencyContactName, emergencyContactPhone: $emergencyContactPhone, moveInDate: $moveInDate, moveOutDate: $moveOutDate, canReceiveNotifications: $canReceiveNotifications, fcmTokens: $fcmTokens, preferences: $preferences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResidentProfileImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.societyId, societyId) ||
                other.societyId == societyId) &&
            (identical(other.flatId, flatId) || other.flatId == flatId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.alternatePhoneNumber, alternatePhoneNumber) ||
                other.alternatePhoneNumber == alternatePhoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.isPrimaryContact, isPrimaryContact) ||
                other.isPrimaryContact == isPrimaryContact) &&
            const DeepCollectionEquality()
                .equals(other._familyMemberUids, _familyMemberUids) &&
            (identical(other.vehicleNumber, vehicleNumber) ||
                other.vehicleNumber == vehicleNumber) &&
            (identical(other.emergencyContactName, emergencyContactName) ||
                other.emergencyContactName == emergencyContactName) &&
            (identical(other.emergencyContactPhone, emergencyContactPhone) ||
                other.emergencyContactPhone == emergencyContactPhone) &&
            (identical(other.moveInDate, moveInDate) ||
                other.moveInDate == moveInDate) &&
            (identical(other.moveOutDate, moveOutDate) ||
                other.moveOutDate == moveOutDate) &&
            (identical(
                    other.canReceiveNotifications, canReceiveNotifications) ||
                other.canReceiveNotifications == canReceiveNotifications) &&
            const DeepCollectionEquality()
                .equals(other._fcmTokens, _fcmTokens) &&
            const DeepCollectionEquality()
                .equals(other._preferences, _preferences));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        userId,
        societyId,
        flatId,
        firstName,
        lastName,
        middleName,
        phoneNumber,
        alternatePhoneNumber,
        email,
        photoUrl,
        const DeepCollectionEquality().hash(_roles),
        isPrimaryContact,
        const DeepCollectionEquality().hash(_familyMemberUids),
        vehicleNumber,
        emergencyContactName,
        emergencyContactPhone,
        moveInDate,
        moveOutDate,
        canReceiveNotifications,
        const DeepCollectionEquality().hash(_fcmTokens),
        const DeepCollectionEquality().hash(_preferences)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResidentProfileImplCopyWith<_$ResidentProfileImpl> get copyWith =>
      __$$ResidentProfileImplCopyWithImpl<_$ResidentProfileImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResidentProfileImplToJson(
      this,
    );
  }
}

abstract class _ResidentProfile implements ResidentProfile {
  const factory _ResidentProfile(
      {required final String userId,
      required final String societyId,
      required final String flatId,
      required final String firstName,
      required final String lastName,
      final String? middleName,
      required final String phoneNumber,
      final String? alternatePhoneNumber,
      final String? email,
      final String? photoUrl,
      final List<String> roles,
      final bool isPrimaryContact,
      final List<String>? familyMemberUids,
      final String? vehicleNumber,
      final String? emergencyContactName,
      final String? emergencyContactPhone,
      final DateTime? moveInDate,
      final DateTime? moveOutDate,
      final bool canReceiveNotifications,
      final List<String>? fcmTokens,
      final Map<String, dynamic>? preferences}) = _$ResidentProfileImpl;

  factory _ResidentProfile.fromJson(Map<String, dynamic> json) =
      _$ResidentProfileImpl.fromJson;

  @override
  String get userId;
  @override
  String get societyId;
  @override
  String get flatId;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String? get middleName;
  @override
  String get phoneNumber;
  @override
  String? get alternatePhoneNumber;
  @override
  String? get email;
  @override
  String? get photoUrl;
  @override
  List<String> get roles;
  @override
  bool get isPrimaryContact;
  @override
  List<String>? get familyMemberUids;
  @override
  String? get vehicleNumber;
  @override
  String? get emergencyContactName;
  @override
  String? get emergencyContactPhone;
  @override
  DateTime? get moveInDate;
  @override
  DateTime? get moveOutDate;
  @override
  bool get canReceiveNotifications;
  @override
  List<String>? get fcmTokens;
  @override
  Map<String, dynamic>? get preferences;
  @override
  @JsonKey(ignore: true)
  _$$ResidentProfileImplCopyWith<_$ResidentProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SecurityProfile _$SecurityProfileFromJson(Map<String, dynamic> json) {
  return _SecurityProfile.fromJson(json);
}

/// @nodoc
mixin _$SecurityProfile {
  String get userId => throw _privateConstructorUsedError;
  String get societyId => throw _privateConstructorUsedError;
  String get employeeId => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get shift => throw _privateConstructorUsedError;
  String? get gateAssignment => throw _privateConstructorUsedError;
  DateTime? get joinDate => throw _privateConstructorUsedError;
  DateTime? get lastActiveAt => throw _privateConstructorUsedError;
  bool get isOnDuty => throw _privateConstructorUsedError;
  List<String>? get assignedGates => throw _privateConstructorUsedError;
  Map<String, dynamic>? get permissions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SecurityProfileCopyWith<SecurityProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecurityProfileCopyWith<$Res> {
  factory $SecurityProfileCopyWith(
          SecurityProfile value, $Res Function(SecurityProfile) then) =
      _$SecurityProfileCopyWithImpl<$Res, SecurityProfile>;
  @useResult
  $Res call(
      {String userId,
      String societyId,
      String employeeId,
      String fullName,
      String phoneNumber,
      String? photoUrl,
      String? shift,
      String? gateAssignment,
      DateTime? joinDate,
      DateTime? lastActiveAt,
      bool isOnDuty,
      List<String>? assignedGates,
      Map<String, dynamic>? permissions});
}

/// @nodoc
class _$SecurityProfileCopyWithImpl<$Res, $Val extends SecurityProfile>
    implements $SecurityProfileCopyWith<$Res> {
  _$SecurityProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? societyId = null,
    Object? employeeId = null,
    Object? fullName = null,
    Object? phoneNumber = null,
    Object? photoUrl = freezed,
    Object? shift = freezed,
    Object? gateAssignment = freezed,
    Object? joinDate = freezed,
    Object? lastActiveAt = freezed,
    Object? isOnDuty = null,
    Object? assignedGates = freezed,
    Object? permissions = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      societyId: null == societyId
          ? _value.societyId
          : societyId // ignore: cast_nullable_to_non_nullable
              as String,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      shift: freezed == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as String?,
      gateAssignment: freezed == gateAssignment
          ? _value.gateAssignment
          : gateAssignment // ignore: cast_nullable_to_non_nullable
              as String?,
      joinDate: freezed == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastActiveAt: freezed == lastActiveAt
          ? _value.lastActiveAt
          : lastActiveAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isOnDuty: null == isOnDuty
          ? _value.isOnDuty
          : isOnDuty // ignore: cast_nullable_to_non_nullable
              as bool,
      assignedGates: freezed == assignedGates
          ? _value.assignedGates
          : assignedGates // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      permissions: freezed == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SecurityProfileImplCopyWith<$Res>
    implements $SecurityProfileCopyWith<$Res> {
  factory _$$SecurityProfileImplCopyWith(_$SecurityProfileImpl value,
          $Res Function(_$SecurityProfileImpl) then) =
      __$$SecurityProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String societyId,
      String employeeId,
      String fullName,
      String phoneNumber,
      String? photoUrl,
      String? shift,
      String? gateAssignment,
      DateTime? joinDate,
      DateTime? lastActiveAt,
      bool isOnDuty,
      List<String>? assignedGates,
      Map<String, dynamic>? permissions});
}

/// @nodoc
class __$$SecurityProfileImplCopyWithImpl<$Res>
    extends _$SecurityProfileCopyWithImpl<$Res, _$SecurityProfileImpl>
    implements _$$SecurityProfileImplCopyWith<$Res> {
  __$$SecurityProfileImplCopyWithImpl(
      _$SecurityProfileImpl _value, $Res Function(_$SecurityProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? societyId = null,
    Object? employeeId = null,
    Object? fullName = null,
    Object? phoneNumber = null,
    Object? photoUrl = freezed,
    Object? shift = freezed,
    Object? gateAssignment = freezed,
    Object? joinDate = freezed,
    Object? lastActiveAt = freezed,
    Object? isOnDuty = null,
    Object? assignedGates = freezed,
    Object? permissions = freezed,
  }) {
    return _then(_$SecurityProfileImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      societyId: null == societyId
          ? _value.societyId
          : societyId // ignore: cast_nullable_to_non_nullable
              as String,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      shift: freezed == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as String?,
      gateAssignment: freezed == gateAssignment
          ? _value.gateAssignment
          : gateAssignment // ignore: cast_nullable_to_non_nullable
              as String?,
      joinDate: freezed == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastActiveAt: freezed == lastActiveAt
          ? _value.lastActiveAt
          : lastActiveAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isOnDuty: null == isOnDuty
          ? _value.isOnDuty
          : isOnDuty // ignore: cast_nullable_to_non_nullable
              as bool,
      assignedGates: freezed == assignedGates
          ? _value._assignedGates
          : assignedGates // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      permissions: freezed == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SecurityProfileImpl implements _SecurityProfile {
  const _$SecurityProfileImpl(
      {required this.userId,
      required this.societyId,
      required this.employeeId,
      required this.fullName,
      required this.phoneNumber,
      this.photoUrl,
      this.shift,
      this.gateAssignment,
      this.joinDate,
      this.lastActiveAt,
      this.isOnDuty = true,
      final List<String>? assignedGates,
      final Map<String, dynamic>? permissions})
      : _assignedGates = assignedGates,
        _permissions = permissions;

  factory _$SecurityProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$SecurityProfileImplFromJson(json);

  @override
  final String userId;
  @override
  final String societyId;
  @override
  final String employeeId;
  @override
  final String fullName;
  @override
  final String phoneNumber;
  @override
  final String? photoUrl;
  @override
  final String? shift;
  @override
  final String? gateAssignment;
  @override
  final DateTime? joinDate;
  @override
  final DateTime? lastActiveAt;
  @override
  @JsonKey()
  final bool isOnDuty;
  final List<String>? _assignedGates;
  @override
  List<String>? get assignedGates {
    final value = _assignedGates;
    if (value == null) return null;
    if (_assignedGates is EqualUnmodifiableListView) return _assignedGates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _permissions;
  @override
  Map<String, dynamic>? get permissions {
    final value = _permissions;
    if (value == null) return null;
    if (_permissions is EqualUnmodifiableMapView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'SecurityProfile(userId: $userId, societyId: $societyId, employeeId: $employeeId, fullName: $fullName, phoneNumber: $phoneNumber, photoUrl: $photoUrl, shift: $shift, gateAssignment: $gateAssignment, joinDate: $joinDate, lastActiveAt: $lastActiveAt, isOnDuty: $isOnDuty, assignedGates: $assignedGates, permissions: $permissions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecurityProfileImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.societyId, societyId) ||
                other.societyId == societyId) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.shift, shift) || other.shift == shift) &&
            (identical(other.gateAssignment, gateAssignment) ||
                other.gateAssignment == gateAssignment) &&
            (identical(other.joinDate, joinDate) ||
                other.joinDate == joinDate) &&
            (identical(other.lastActiveAt, lastActiveAt) ||
                other.lastActiveAt == lastActiveAt) &&
            (identical(other.isOnDuty, isOnDuty) ||
                other.isOnDuty == isOnDuty) &&
            const DeepCollectionEquality()
                .equals(other._assignedGates, _assignedGates) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      societyId,
      employeeId,
      fullName,
      phoneNumber,
      photoUrl,
      shift,
      gateAssignment,
      joinDate,
      lastActiveAt,
      isOnDuty,
      const DeepCollectionEquality().hash(_assignedGates),
      const DeepCollectionEquality().hash(_permissions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SecurityProfileImplCopyWith<_$SecurityProfileImpl> get copyWith =>
      __$$SecurityProfileImplCopyWithImpl<_$SecurityProfileImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SecurityProfileImplToJson(
      this,
    );
  }
}

abstract class _SecurityProfile implements SecurityProfile {
  const factory _SecurityProfile(
      {required final String userId,
      required final String societyId,
      required final String employeeId,
      required final String fullName,
      required final String phoneNumber,
      final String? photoUrl,
      final String? shift,
      final String? gateAssignment,
      final DateTime? joinDate,
      final DateTime? lastActiveAt,
      final bool isOnDuty,
      final List<String>? assignedGates,
      final Map<String, dynamic>? permissions}) = _$SecurityProfileImpl;

  factory _SecurityProfile.fromJson(Map<String, dynamic> json) =
      _$SecurityProfileImpl.fromJson;

  @override
  String get userId;
  @override
  String get societyId;
  @override
  String get employeeId;
  @override
  String get fullName;
  @override
  String get phoneNumber;
  @override
  String? get photoUrl;
  @override
  String? get shift;
  @override
  String? get gateAssignment;
  @override
  DateTime? get joinDate;
  @override
  DateTime? get lastActiveAt;
  @override
  bool get isOnDuty;
  @override
  List<String>? get assignedGates;
  @override
  Map<String, dynamic>? get permissions;
  @override
  @JsonKey(ignore: true)
  _$$SecurityProfileImplCopyWith<_$SecurityProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AdminProfile _$AdminProfileFromJson(Map<String, dynamic> json) {
  return _AdminProfile.fromJson(json);
}

/// @nodoc
mixin _$AdminProfile {
  String get userId => throw _privateConstructorUsedError;
  String get societyId => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  List<String> get roles => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  DateTime? get appointedDate => throw _privateConstructorUsedError;
  Map<String, dynamic>? get permissions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdminProfileCopyWith<AdminProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminProfileCopyWith<$Res> {
  factory $AdminProfileCopyWith(
          AdminProfile value, $Res Function(AdminProfile) then) =
      _$AdminProfileCopyWithImpl<$Res, AdminProfile>;
  @useResult
  $Res call(
      {String userId,
      String societyId,
      String fullName,
      String phoneNumber,
      String email,
      String? photoUrl,
      List<String> roles,
      String? designation,
      DateTime? appointedDate,
      Map<String, dynamic>? permissions});
}

/// @nodoc
class _$AdminProfileCopyWithImpl<$Res, $Val extends AdminProfile>
    implements $AdminProfileCopyWith<$Res> {
  _$AdminProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? societyId = null,
    Object? fullName = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? photoUrl = freezed,
    Object? roles = null,
    Object? designation = freezed,
    Object? appointedDate = freezed,
    Object? permissions = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      societyId: null == societyId
          ? _value.societyId
          : societyId // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: null == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      appointedDate: freezed == appointedDate
          ? _value.appointedDate
          : appointedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      permissions: freezed == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminProfileImplCopyWith<$Res>
    implements $AdminProfileCopyWith<$Res> {
  factory _$$AdminProfileImplCopyWith(
          _$AdminProfileImpl value, $Res Function(_$AdminProfileImpl) then) =
      __$$AdminProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String societyId,
      String fullName,
      String phoneNumber,
      String email,
      String? photoUrl,
      List<String> roles,
      String? designation,
      DateTime? appointedDate,
      Map<String, dynamic>? permissions});
}

/// @nodoc
class __$$AdminProfileImplCopyWithImpl<$Res>
    extends _$AdminProfileCopyWithImpl<$Res, _$AdminProfileImpl>
    implements _$$AdminProfileImplCopyWith<$Res> {
  __$$AdminProfileImplCopyWithImpl(
      _$AdminProfileImpl _value, $Res Function(_$AdminProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? societyId = null,
    Object? fullName = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? photoUrl = freezed,
    Object? roles = null,
    Object? designation = freezed,
    Object? appointedDate = freezed,
    Object? permissions = freezed,
  }) {
    return _then(_$AdminProfileImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      societyId: null == societyId
          ? _value.societyId
          : societyId // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: null == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      appointedDate: freezed == appointedDate
          ? _value.appointedDate
          : appointedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      permissions: freezed == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminProfileImpl implements _AdminProfile {
  const _$AdminProfileImpl(
      {required this.userId,
      required this.societyId,
      required this.fullName,
      required this.phoneNumber,
      required this.email,
      this.photoUrl,
      final List<String> roles = const ['admin'],
      this.designation,
      this.appointedDate,
      final Map<String, dynamic>? permissions})
      : _roles = roles,
        _permissions = permissions;

  factory _$AdminProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminProfileImplFromJson(json);

  @override
  final String userId;
  @override
  final String societyId;
  @override
  final String fullName;
  @override
  final String phoneNumber;
  @override
  final String email;
  @override
  final String? photoUrl;
  final List<String> _roles;
  @override
  @JsonKey()
  List<String> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  final String? designation;
  @override
  final DateTime? appointedDate;
  final Map<String, dynamic>? _permissions;
  @override
  Map<String, dynamic>? get permissions {
    final value = _permissions;
    if (value == null) return null;
    if (_permissions is EqualUnmodifiableMapView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AdminProfile(userId: $userId, societyId: $societyId, fullName: $fullName, phoneNumber: $phoneNumber, email: $email, photoUrl: $photoUrl, roles: $roles, designation: $designation, appointedDate: $appointedDate, permissions: $permissions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminProfileImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.societyId, societyId) ||
                other.societyId == societyId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.appointedDate, appointedDate) ||
                other.appointedDate == appointedDate) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      societyId,
      fullName,
      phoneNumber,
      email,
      photoUrl,
      const DeepCollectionEquality().hash(_roles),
      designation,
      appointedDate,
      const DeepCollectionEquality().hash(_permissions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminProfileImplCopyWith<_$AdminProfileImpl> get copyWith =>
      __$$AdminProfileImplCopyWithImpl<_$AdminProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminProfileImplToJson(
      this,
    );
  }
}

abstract class _AdminProfile implements AdminProfile {
  const factory _AdminProfile(
      {required final String userId,
      required final String societyId,
      required final String fullName,
      required final String phoneNumber,
      required final String email,
      final String? photoUrl,
      final List<String> roles,
      final String? designation,
      final DateTime? appointedDate,
      final Map<String, dynamic>? permissions}) = _$AdminProfileImpl;

  factory _AdminProfile.fromJson(Map<String, dynamic> json) =
      _$AdminProfileImpl.fromJson;

  @override
  String get userId;
  @override
  String get societyId;
  @override
  String get fullName;
  @override
  String get phoneNumber;
  @override
  String get email;
  @override
  String? get photoUrl;
  @override
  List<String> get roles;
  @override
  String? get designation;
  @override
  DateTime? get appointedDate;
  @override
  Map<String, dynamic>? get permissions;
  @override
  @JsonKey(ignore: true)
  _$$AdminProfileImplCopyWith<_$AdminProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VendorProfile _$VendorProfileFromJson(Map<String, dynamic> json) {
  return _VendorProfile.fromJson(json);
}

/// @nodoc
mixin _$VendorProfile {
  String get userId => throw _privateConstructorUsedError;
  String get businessName => throw _privateConstructorUsedError;
  String get contactPerson => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get serviceType => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get licenseNumber => throw _privateConstructorUsedError;
  List<String>? get allowedSocieties => throw _privateConstructorUsedError;
  DateTime? get registeredDate => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VendorProfileCopyWith<VendorProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorProfileCopyWith<$Res> {
  factory $VendorProfileCopyWith(
          VendorProfile value, $Res Function(VendorProfile) then) =
      _$VendorProfileCopyWithImpl<$Res, VendorProfile>;
  @useResult
  $Res call(
      {String userId,
      String businessName,
      String contactPerson,
      String phoneNumber,
      String? email,
      String? serviceType,
      String? photoUrl,
      String? licenseNumber,
      List<String>? allowedSocieties,
      DateTime? registeredDate,
      bool isActive,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$VendorProfileCopyWithImpl<$Res, $Val extends VendorProfile>
    implements $VendorProfileCopyWith<$Res> {
  _$VendorProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? businessName = null,
    Object? contactPerson = null,
    Object? phoneNumber = null,
    Object? email = freezed,
    Object? serviceType = freezed,
    Object? photoUrl = freezed,
    Object? licenseNumber = freezed,
    Object? allowedSocieties = freezed,
    Object? registeredDate = freezed,
    Object? isActive = null,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      contactPerson: null == contactPerson
          ? _value.contactPerson
          : contactPerson // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceType: freezed == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseNumber: freezed == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      allowedSocieties: freezed == allowedSocieties
          ? _value.allowedSocieties
          : allowedSocieties // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      registeredDate: freezed == registeredDate
          ? _value.registeredDate
          : registeredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VendorProfileImplCopyWith<$Res>
    implements $VendorProfileCopyWith<$Res> {
  factory _$$VendorProfileImplCopyWith(
          _$VendorProfileImpl value, $Res Function(_$VendorProfileImpl) then) =
      __$$VendorProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String businessName,
      String contactPerson,
      String phoneNumber,
      String? email,
      String? serviceType,
      String? photoUrl,
      String? licenseNumber,
      List<String>? allowedSocieties,
      DateTime? registeredDate,
      bool isActive,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$VendorProfileImplCopyWithImpl<$Res>
    extends _$VendorProfileCopyWithImpl<$Res, _$VendorProfileImpl>
    implements _$$VendorProfileImplCopyWith<$Res> {
  __$$VendorProfileImplCopyWithImpl(
      _$VendorProfileImpl _value, $Res Function(_$VendorProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? businessName = null,
    Object? contactPerson = null,
    Object? phoneNumber = null,
    Object? email = freezed,
    Object? serviceType = freezed,
    Object? photoUrl = freezed,
    Object? licenseNumber = freezed,
    Object? allowedSocieties = freezed,
    Object? registeredDate = freezed,
    Object? isActive = null,
    Object? metadata = freezed,
  }) {
    return _then(_$VendorProfileImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      contactPerson: null == contactPerson
          ? _value.contactPerson
          : contactPerson // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceType: freezed == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseNumber: freezed == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      allowedSocieties: freezed == allowedSocieties
          ? _value._allowedSocieties
          : allowedSocieties // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      registeredDate: freezed == registeredDate
          ? _value.registeredDate
          : registeredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorProfileImpl implements _VendorProfile {
  const _$VendorProfileImpl(
      {required this.userId,
      required this.businessName,
      required this.contactPerson,
      required this.phoneNumber,
      this.email,
      this.serviceType,
      this.photoUrl,
      this.licenseNumber,
      final List<String>? allowedSocieties,
      this.registeredDate,
      this.isActive = true,
      final Map<String, dynamic>? metadata})
      : _allowedSocieties = allowedSocieties,
        _metadata = metadata;

  factory _$VendorProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorProfileImplFromJson(json);

  @override
  final String userId;
  @override
  final String businessName;
  @override
  final String contactPerson;
  @override
  final String phoneNumber;
  @override
  final String? email;
  @override
  final String? serviceType;
  @override
  final String? photoUrl;
  @override
  final String? licenseNumber;
  final List<String>? _allowedSocieties;
  @override
  List<String>? get allowedSocieties {
    final value = _allowedSocieties;
    if (value == null) return null;
    if (_allowedSocieties is EqualUnmodifiableListView)
      return _allowedSocieties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? registeredDate;
  @override
  @JsonKey()
  final bool isActive;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'VendorProfile(userId: $userId, businessName: $businessName, contactPerson: $contactPerson, phoneNumber: $phoneNumber, email: $email, serviceType: $serviceType, photoUrl: $photoUrl, licenseNumber: $licenseNumber, allowedSocieties: $allowedSocieties, registeredDate: $registeredDate, isActive: $isActive, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorProfileImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.contactPerson, contactPerson) ||
                other.contactPerson == contactPerson) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            const DeepCollectionEquality()
                .equals(other._allowedSocieties, _allowedSocieties) &&
            (identical(other.registeredDate, registeredDate) ||
                other.registeredDate == registeredDate) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      businessName,
      contactPerson,
      phoneNumber,
      email,
      serviceType,
      photoUrl,
      licenseNumber,
      const DeepCollectionEquality().hash(_allowedSocieties),
      registeredDate,
      isActive,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorProfileImplCopyWith<_$VendorProfileImpl> get copyWith =>
      __$$VendorProfileImplCopyWithImpl<_$VendorProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorProfileImplToJson(
      this,
    );
  }
}

abstract class _VendorProfile implements VendorProfile {
  const factory _VendorProfile(
      {required final String userId,
      required final String businessName,
      required final String contactPerson,
      required final String phoneNumber,
      final String? email,
      final String? serviceType,
      final String? photoUrl,
      final String? licenseNumber,
      final List<String>? allowedSocieties,
      final DateTime? registeredDate,
      final bool isActive,
      final Map<String, dynamic>? metadata}) = _$VendorProfileImpl;

  factory _VendorProfile.fromJson(Map<String, dynamic> json) =
      _$VendorProfileImpl.fromJson;

  @override
  String get userId;
  @override
  String get businessName;
  @override
  String get contactPerson;
  @override
  String get phoneNumber;
  @override
  String? get email;
  @override
  String? get serviceType;
  @override
  String? get photoUrl;
  @override
  String? get licenseNumber;
  @override
  List<String>? get allowedSocieties;
  @override
  DateTime? get registeredDate;
  @override
  bool get isActive;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$VendorProfileImplCopyWith<_$VendorProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
