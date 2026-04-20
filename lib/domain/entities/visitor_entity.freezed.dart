// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visitor_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VisitorEntity _$VisitorEntityFromJson(Map<String, dynamic> json) {
  return _VisitorEntity.fromJson(json);
}

/// @nodoc
mixin _$VisitorEntity {
  String get id => throw _privateConstructorUsedError;
  String get societyId => throw _privateConstructorUsedError;
  String get gateName => throw _privateConstructorUsedError;
  String get visitorName => throw _privateConstructorUsedError;
  String? get visitorPhone => throw _privateConstructorUsedError;
  String? get visitorPhotoUrl => throw _privateConstructorUsedError;
  String? get vehicleNumber => throw _privateConstructorUsedError;
  String? get licensePlatePhotoUrl => throw _privateConstructorUsedError;
  String get hostFlatId => throw _privateConstructorUsedError;
  String? get hostFlatNumber => throw _privateConstructorUsedError;
  String? get hostName => throw _privateConstructorUsedError;
  String? get hostPhone => throw _privateConstructorUsedError;
  String get purpose => throw _privateConstructorUsedError;
  VisitorType get type => throw _privateConstructorUsedError;
  VisitorStatus get status => throw _privateConstructorUsedError;
  DateTime? get expectedArrivalTime => throw _privateConstructorUsedError;
  DateTime? get actualArrivalTime => throw _privateConstructorUsedError;
  DateTime? get expectedDepartureTime => throw _privateConstructorUsedError;
  DateTime? get actualDepartureTime => throw _privateConstructorUsedError;
  String? get otp => throw _privateConstructorUsedError;
  int? get otpVerifiedBy => throw _privateConstructorUsedError;
  String? get approvedBy => throw _privateConstructorUsedError;
  DateTime? get approvedAt => throw _privateConstructorUsedError;
  String? get rejectedBy => throw _privateConstructorUsedError;
  String? get rejectionReason => throw _privateConstructorUsedError;
  DateTime? get rejectedAt => throw _privateConstructorUsedError;
  String? get checkedInBy => throw _privateConstructorUsedError;
  DateTime? get checkedInAt => throw _privateConstructorUsedError;
  String? get checkedOutBy => throw _privateConstructorUsedError;
  DateTime? get checkedOutAt => throw _privateConstructorUsedError;
  List<String>? get photos => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get updatedBy => throw _privateConstructorUsedError;
  bool get isPreApproved => throw _privateConstructorUsedError;
  String? get preApprovedBy => throw _privateConstructorUsedError;
  DateTime? get preApprovedAt => throw _privateConstructorUsedError;
  DateTime? get validUntil => throw _privateConstructorUsedError;
  bool get isRecurring => throw _privateConstructorUsedError;
  String? get recurringPattern => throw _privateConstructorUsedError;
  int? get visitCount => throw _privateConstructorUsedError;
  String? get lastVisitId =>
      throw _privateConstructorUsedError; // For delivery personnel
  String? get deliveryCompany => throw _privateConstructorUsedError;
  String? get trackingNumber => throw _privateConstructorUsedError;
  String? get packageName => throw _privateConstructorUsedError;
  bool? get packageHandedOver => throw _privateConstructorUsedError;
  String? get packageHandoverPhotoUrl => throw _privateConstructorUsedError;
  String? get handedOverTo => throw _privateConstructorUsedError;
  DateTime? get packageHandoverAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisitorEntityCopyWith<VisitorEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitorEntityCopyWith<$Res> {
  factory $VisitorEntityCopyWith(
          VisitorEntity value, $Res Function(VisitorEntity) then) =
      _$VisitorEntityCopyWithImpl<$Res, VisitorEntity>;
  @useResult
  $Res call(
      {String id,
      String societyId,
      String gateName,
      String visitorName,
      String? visitorPhone,
      String? visitorPhotoUrl,
      String? vehicleNumber,
      String? licensePlatePhotoUrl,
      String hostFlatId,
      String? hostFlatNumber,
      String? hostName,
      String? hostPhone,
      String purpose,
      VisitorType type,
      VisitorStatus status,
      DateTime? expectedArrivalTime,
      DateTime? actualArrivalTime,
      DateTime? expectedDepartureTime,
      DateTime? actualDepartureTime,
      String? otp,
      int? otpVerifiedBy,
      String? approvedBy,
      DateTime? approvedAt,
      String? rejectedBy,
      String? rejectionReason,
      DateTime? rejectedAt,
      String? checkedInBy,
      DateTime? checkedInAt,
      String? checkedOutBy,
      DateTime? checkedOutAt,
      List<String>? photos,
      Map<String, dynamic>? metadata,
      DateTime createdAt,
      String? createdBy,
      DateTime? updatedAt,
      String? updatedBy,
      bool isPreApproved,
      String? preApprovedBy,
      DateTime? preApprovedAt,
      DateTime? validUntil,
      bool isRecurring,
      String? recurringPattern,
      int? visitCount,
      String? lastVisitId,
      String? deliveryCompany,
      String? trackingNumber,
      String? packageName,
      bool? packageHandedOver,
      String? packageHandoverPhotoUrl,
      String? handedOverTo,
      DateTime? packageHandoverAt});
}

/// @nodoc
class _$VisitorEntityCopyWithImpl<$Res, $Val extends VisitorEntity>
    implements $VisitorEntityCopyWith<$Res> {
  _$VisitorEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? gateName = null,
    Object? visitorName = null,
    Object? visitorPhone = freezed,
    Object? visitorPhotoUrl = freezed,
    Object? vehicleNumber = freezed,
    Object? licensePlatePhotoUrl = freezed,
    Object? hostFlatId = null,
    Object? hostFlatNumber = freezed,
    Object? hostName = freezed,
    Object? hostPhone = freezed,
    Object? purpose = null,
    Object? type = null,
    Object? status = null,
    Object? expectedArrivalTime = freezed,
    Object? actualArrivalTime = freezed,
    Object? expectedDepartureTime = freezed,
    Object? actualDepartureTime = freezed,
    Object? otp = freezed,
    Object? otpVerifiedBy = freezed,
    Object? approvedBy = freezed,
    Object? approvedAt = freezed,
    Object? rejectedBy = freezed,
    Object? rejectionReason = freezed,
    Object? rejectedAt = freezed,
    Object? checkedInBy = freezed,
    Object? checkedInAt = freezed,
    Object? checkedOutBy = freezed,
    Object? checkedOutAt = freezed,
    Object? photos = freezed,
    Object? metadata = freezed,
    Object? createdAt = null,
    Object? createdBy = freezed,
    Object? updatedAt = freezed,
    Object? updatedBy = freezed,
    Object? isPreApproved = null,
    Object? preApprovedBy = freezed,
    Object? preApprovedAt = freezed,
    Object? validUntil = freezed,
    Object? isRecurring = null,
    Object? recurringPattern = freezed,
    Object? visitCount = freezed,
    Object? lastVisitId = freezed,
    Object? deliveryCompany = freezed,
    Object? trackingNumber = freezed,
    Object? packageName = freezed,
    Object? packageHandedOver = freezed,
    Object? packageHandoverPhotoUrl = freezed,
    Object? handedOverTo = freezed,
    Object? packageHandoverAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      societyId: null == societyId
          ? _value.societyId
          : societyId // ignore: cast_nullable_to_non_nullable
              as String,
      gateName: null == gateName
          ? _value.gateName
          : gateName // ignore: cast_nullable_to_non_nullable
              as String,
      visitorName: null == visitorName
          ? _value.visitorName
          : visitorName // ignore: cast_nullable_to_non_nullable
              as String,
      visitorPhone: freezed == visitorPhone
          ? _value.visitorPhone
          : visitorPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      visitorPhotoUrl: freezed == visitorPhotoUrl
          ? _value.visitorPhotoUrl
          : visitorPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleNumber: freezed == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      licensePlatePhotoUrl: freezed == licensePlatePhotoUrl
          ? _value.licensePlatePhotoUrl
          : licensePlatePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      hostFlatId: null == hostFlatId
          ? _value.hostFlatId
          : hostFlatId // ignore: cast_nullable_to_non_nullable
              as String,
      hostFlatNumber: freezed == hostFlatNumber
          ? _value.hostFlatNumber
          : hostFlatNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      hostName: freezed == hostName
          ? _value.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
              as String?,
      hostPhone: freezed == hostPhone
          ? _value.hostPhone
          : hostPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      purpose: null == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as VisitorType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as VisitorStatus,
      expectedArrivalTime: freezed == expectedArrivalTime
          ? _value.expectedArrivalTime
          : expectedArrivalTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualArrivalTime: freezed == actualArrivalTime
          ? _value.actualArrivalTime
          : actualArrivalTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expectedDepartureTime: freezed == expectedDepartureTime
          ? _value.expectedDepartureTime
          : expectedDepartureTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualDepartureTime: freezed == actualDepartureTime
          ? _value.actualDepartureTime
          : actualDepartureTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      otpVerifiedBy: freezed == otpVerifiedBy
          ? _value.otpVerifiedBy
          : otpVerifiedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedBy: freezed == approvedBy
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedAt: freezed == approvedAt
          ? _value.approvedAt
          : approvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rejectedBy: freezed == rejectedBy
          ? _value.rejectedBy
          : rejectedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectionReason: freezed == rejectionReason
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectedAt: freezed == rejectedAt
          ? _value.rejectedAt
          : rejectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkedInBy: freezed == checkedInBy
          ? _value.checkedInBy
          : checkedInBy // ignore: cast_nullable_to_non_nullable
              as String?,
      checkedInAt: freezed == checkedInAt
          ? _value.checkedInAt
          : checkedInAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkedOutBy: freezed == checkedOutBy
          ? _value.checkedOutBy
          : checkedOutBy // ignore: cast_nullable_to_non_nullable
              as String?,
      checkedOutAt: freezed == checkedOutAt
          ? _value.checkedOutAt
          : checkedOutAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      photos: freezed == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      isPreApproved: null == isPreApproved
          ? _value.isPreApproved
          : isPreApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      preApprovedBy: freezed == preApprovedBy
          ? _value.preApprovedBy
          : preApprovedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      preApprovedAt: freezed == preApprovedAt
          ? _value.preApprovedAt
          : preApprovedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      validUntil: freezed == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isRecurring: null == isRecurring
          ? _value.isRecurring
          : isRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      recurringPattern: freezed == recurringPattern
          ? _value.recurringPattern
          : recurringPattern // ignore: cast_nullable_to_non_nullable
              as String?,
      visitCount: freezed == visitCount
          ? _value.visitCount
          : visitCount // ignore: cast_nullable_to_non_nullable
              as int?,
      lastVisitId: freezed == lastVisitId
          ? _value.lastVisitId
          : lastVisitId // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryCompany: freezed == deliveryCompany
          ? _value.deliveryCompany
          : deliveryCompany // ignore: cast_nullable_to_non_nullable
              as String?,
      trackingNumber: freezed == trackingNumber
          ? _value.trackingNumber
          : trackingNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      packageName: freezed == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String?,
      packageHandedOver: freezed == packageHandedOver
          ? _value.packageHandedOver
          : packageHandedOver // ignore: cast_nullable_to_non_nullable
              as bool?,
      packageHandoverPhotoUrl: freezed == packageHandoverPhotoUrl
          ? _value.packageHandoverPhotoUrl
          : packageHandoverPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      handedOverTo: freezed == handedOverTo
          ? _value.handedOverTo
          : handedOverTo // ignore: cast_nullable_to_non_nullable
              as String?,
      packageHandoverAt: freezed == packageHandoverAt
          ? _value.packageHandoverAt
          : packageHandoverAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VisitorEntityImplCopyWith<$Res>
    implements $VisitorEntityCopyWith<$Res> {
  factory _$$VisitorEntityImplCopyWith(
          _$VisitorEntityImpl value, $Res Function(_$VisitorEntityImpl) then) =
      __$$VisitorEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String societyId,
      String gateName,
      String visitorName,
      String? visitorPhone,
      String? visitorPhotoUrl,
      String? vehicleNumber,
      String? licensePlatePhotoUrl,
      String hostFlatId,
      String? hostFlatNumber,
      String? hostName,
      String? hostPhone,
      String purpose,
      VisitorType type,
      VisitorStatus status,
      DateTime? expectedArrivalTime,
      DateTime? actualArrivalTime,
      DateTime? expectedDepartureTime,
      DateTime? actualDepartureTime,
      String? otp,
      int? otpVerifiedBy,
      String? approvedBy,
      DateTime? approvedAt,
      String? rejectedBy,
      String? rejectionReason,
      DateTime? rejectedAt,
      String? checkedInBy,
      DateTime? checkedInAt,
      String? checkedOutBy,
      DateTime? checkedOutAt,
      List<String>? photos,
      Map<String, dynamic>? metadata,
      DateTime createdAt,
      String? createdBy,
      DateTime? updatedAt,
      String? updatedBy,
      bool isPreApproved,
      String? preApprovedBy,
      DateTime? preApprovedAt,
      DateTime? validUntil,
      bool isRecurring,
      String? recurringPattern,
      int? visitCount,
      String? lastVisitId,
      String? deliveryCompany,
      String? trackingNumber,
      String? packageName,
      bool? packageHandedOver,
      String? packageHandoverPhotoUrl,
      String? handedOverTo,
      DateTime? packageHandoverAt});
}

/// @nodoc
class __$$VisitorEntityImplCopyWithImpl<$Res>
    extends _$VisitorEntityCopyWithImpl<$Res, _$VisitorEntityImpl>
    implements _$$VisitorEntityImplCopyWith<$Res> {
  __$$VisitorEntityImplCopyWithImpl(
      _$VisitorEntityImpl _value, $Res Function(_$VisitorEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? gateName = null,
    Object? visitorName = null,
    Object? visitorPhone = freezed,
    Object? visitorPhotoUrl = freezed,
    Object? vehicleNumber = freezed,
    Object? licensePlatePhotoUrl = freezed,
    Object? hostFlatId = null,
    Object? hostFlatNumber = freezed,
    Object? hostName = freezed,
    Object? hostPhone = freezed,
    Object? purpose = null,
    Object? type = null,
    Object? status = null,
    Object? expectedArrivalTime = freezed,
    Object? actualArrivalTime = freezed,
    Object? expectedDepartureTime = freezed,
    Object? actualDepartureTime = freezed,
    Object? otp = freezed,
    Object? otpVerifiedBy = freezed,
    Object? approvedBy = freezed,
    Object? approvedAt = freezed,
    Object? rejectedBy = freezed,
    Object? rejectionReason = freezed,
    Object? rejectedAt = freezed,
    Object? checkedInBy = freezed,
    Object? checkedInAt = freezed,
    Object? checkedOutBy = freezed,
    Object? checkedOutAt = freezed,
    Object? photos = freezed,
    Object? metadata = freezed,
    Object? createdAt = null,
    Object? createdBy = freezed,
    Object? updatedAt = freezed,
    Object? updatedBy = freezed,
    Object? isPreApproved = null,
    Object? preApprovedBy = freezed,
    Object? preApprovedAt = freezed,
    Object? validUntil = freezed,
    Object? isRecurring = null,
    Object? recurringPattern = freezed,
    Object? visitCount = freezed,
    Object? lastVisitId = freezed,
    Object? deliveryCompany = freezed,
    Object? trackingNumber = freezed,
    Object? packageName = freezed,
    Object? packageHandedOver = freezed,
    Object? packageHandoverPhotoUrl = freezed,
    Object? handedOverTo = freezed,
    Object? packageHandoverAt = freezed,
  }) {
    return _then(_$VisitorEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      societyId: null == societyId
          ? _value.societyId
          : societyId // ignore: cast_nullable_to_non_nullable
              as String,
      gateName: null == gateName
          ? _value.gateName
          : gateName // ignore: cast_nullable_to_non_nullable
              as String,
      visitorName: null == visitorName
          ? _value.visitorName
          : visitorName // ignore: cast_nullable_to_non_nullable
              as String,
      visitorPhone: freezed == visitorPhone
          ? _value.visitorPhone
          : visitorPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      visitorPhotoUrl: freezed == visitorPhotoUrl
          ? _value.visitorPhotoUrl
          : visitorPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleNumber: freezed == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      licensePlatePhotoUrl: freezed == licensePlatePhotoUrl
          ? _value.licensePlatePhotoUrl
          : licensePlatePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      hostFlatId: null == hostFlatId
          ? _value.hostFlatId
          : hostFlatId // ignore: cast_nullable_to_non_nullable
              as String,
      hostFlatNumber: freezed == hostFlatNumber
          ? _value.hostFlatNumber
          : hostFlatNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      hostName: freezed == hostName
          ? _value.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
              as String?,
      hostPhone: freezed == hostPhone
          ? _value.hostPhone
          : hostPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      purpose: null == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as VisitorType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as VisitorStatus,
      expectedArrivalTime: freezed == expectedArrivalTime
          ? _value.expectedArrivalTime
          : expectedArrivalTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualArrivalTime: freezed == actualArrivalTime
          ? _value.actualArrivalTime
          : actualArrivalTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expectedDepartureTime: freezed == expectedDepartureTime
          ? _value.expectedDepartureTime
          : expectedDepartureTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualDepartureTime: freezed == actualDepartureTime
          ? _value.actualDepartureTime
          : actualDepartureTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      otpVerifiedBy: freezed == otpVerifiedBy
          ? _value.otpVerifiedBy
          : otpVerifiedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedBy: freezed == approvedBy
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedAt: freezed == approvedAt
          ? _value.approvedAt
          : approvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rejectedBy: freezed == rejectedBy
          ? _value.rejectedBy
          : rejectedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectionReason: freezed == rejectionReason
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectedAt: freezed == rejectedAt
          ? _value.rejectedAt
          : rejectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkedInBy: freezed == checkedInBy
          ? _value.checkedInBy
          : checkedInBy // ignore: cast_nullable_to_non_nullable
              as String?,
      checkedInAt: freezed == checkedInAt
          ? _value.checkedInAt
          : checkedInAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkedOutBy: freezed == checkedOutBy
          ? _value.checkedOutBy
          : checkedOutBy // ignore: cast_nullable_to_non_nullable
              as String?,
      checkedOutAt: freezed == checkedOutAt
          ? _value.checkedOutAt
          : checkedOutAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      photos: freezed == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      isPreApproved: null == isPreApproved
          ? _value.isPreApproved
          : isPreApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      preApprovedBy: freezed == preApprovedBy
          ? _value.preApprovedBy
          : preApprovedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      preApprovedAt: freezed == preApprovedAt
          ? _value.preApprovedAt
          : preApprovedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      validUntil: freezed == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isRecurring: null == isRecurring
          ? _value.isRecurring
          : isRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      recurringPattern: freezed == recurringPattern
          ? _value.recurringPattern
          : recurringPattern // ignore: cast_nullable_to_non_nullable
              as String?,
      visitCount: freezed == visitCount
          ? _value.visitCount
          : visitCount // ignore: cast_nullable_to_non_nullable
              as int?,
      lastVisitId: freezed == lastVisitId
          ? _value.lastVisitId
          : lastVisitId // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryCompany: freezed == deliveryCompany
          ? _value.deliveryCompany
          : deliveryCompany // ignore: cast_nullable_to_non_nullable
              as String?,
      trackingNumber: freezed == trackingNumber
          ? _value.trackingNumber
          : trackingNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      packageName: freezed == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String?,
      packageHandedOver: freezed == packageHandedOver
          ? _value.packageHandedOver
          : packageHandedOver // ignore: cast_nullable_to_non_nullable
              as bool?,
      packageHandoverPhotoUrl: freezed == packageHandoverPhotoUrl
          ? _value.packageHandoverPhotoUrl
          : packageHandoverPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      handedOverTo: freezed == handedOverTo
          ? _value.handedOverTo
          : handedOverTo // ignore: cast_nullable_to_non_nullable
              as String?,
      packageHandoverAt: freezed == packageHandoverAt
          ? _value.packageHandoverAt
          : packageHandoverAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VisitorEntityImpl implements _VisitorEntity {
  const _$VisitorEntityImpl(
      {required this.id,
      required this.societyId,
      required this.gateName,
      required this.visitorName,
      this.visitorPhone,
      this.visitorPhotoUrl,
      this.vehicleNumber,
      this.licensePlatePhotoUrl,
      required this.hostFlatId,
      this.hostFlatNumber,
      this.hostName,
      this.hostPhone,
      required this.purpose,
      this.type = VisitorType.guest,
      this.status = VisitorStatus.pending,
      this.expectedArrivalTime,
      this.actualArrivalTime,
      this.expectedDepartureTime,
      this.actualDepartureTime,
      this.otp,
      this.otpVerifiedBy,
      this.approvedBy,
      this.approvedAt,
      this.rejectedBy,
      this.rejectionReason,
      this.rejectedAt,
      this.checkedInBy,
      this.checkedInAt,
      this.checkedOutBy,
      this.checkedOutAt,
      final List<String>? photos,
      final Map<String, dynamic>? metadata,
      required this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.isPreApproved = false,
      this.preApprovedBy,
      this.preApprovedAt,
      this.validUntil,
      this.isRecurring = false,
      this.recurringPattern,
      this.visitCount,
      this.lastVisitId,
      this.deliveryCompany,
      this.trackingNumber,
      this.packageName,
      this.packageHandedOver,
      this.packageHandoverPhotoUrl,
      this.handedOverTo,
      this.packageHandoverAt})
      : _photos = photos,
        _metadata = metadata;

  factory _$VisitorEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$VisitorEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String societyId;
  @override
  final String gateName;
  @override
  final String visitorName;
  @override
  final String? visitorPhone;
  @override
  final String? visitorPhotoUrl;
  @override
  final String? vehicleNumber;
  @override
  final String? licensePlatePhotoUrl;
  @override
  final String hostFlatId;
  @override
  final String? hostFlatNumber;
  @override
  final String? hostName;
  @override
  final String? hostPhone;
  @override
  final String purpose;
  @override
  @JsonKey()
  final VisitorType type;
  @override
  @JsonKey()
  final VisitorStatus status;
  @override
  final DateTime? expectedArrivalTime;
  @override
  final DateTime? actualArrivalTime;
  @override
  final DateTime? expectedDepartureTime;
  @override
  final DateTime? actualDepartureTime;
  @override
  final String? otp;
  @override
  final int? otpVerifiedBy;
  @override
  final String? approvedBy;
  @override
  final DateTime? approvedAt;
  @override
  final String? rejectedBy;
  @override
  final String? rejectionReason;
  @override
  final DateTime? rejectedAt;
  @override
  final String? checkedInBy;
  @override
  final DateTime? checkedInAt;
  @override
  final String? checkedOutBy;
  @override
  final DateTime? checkedOutAt;
  final List<String>? _photos;
  @override
  List<String>? get photos {
    final value = _photos;
    if (value == null) return null;
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
  final DateTime createdAt;
  @override
  final String? createdBy;
  @override
  final DateTime? updatedAt;
  @override
  final String? updatedBy;
  @override
  @JsonKey()
  final bool isPreApproved;
  @override
  final String? preApprovedBy;
  @override
  final DateTime? preApprovedAt;
  @override
  final DateTime? validUntil;
  @override
  @JsonKey()
  final bool isRecurring;
  @override
  final String? recurringPattern;
  @override
  final int? visitCount;
  @override
  final String? lastVisitId;
// For delivery personnel
  @override
  final String? deliveryCompany;
  @override
  final String? trackingNumber;
  @override
  final String? packageName;
  @override
  final bool? packageHandedOver;
  @override
  final String? packageHandoverPhotoUrl;
  @override
  final String? handedOverTo;
  @override
  final DateTime? packageHandoverAt;

  @override
  String toString() {
    return 'VisitorEntity(id: $id, societyId: $societyId, gateName: $gateName, visitorName: $visitorName, visitorPhone: $visitorPhone, visitorPhotoUrl: $visitorPhotoUrl, vehicleNumber: $vehicleNumber, licensePlatePhotoUrl: $licensePlatePhotoUrl, hostFlatId: $hostFlatId, hostFlatNumber: $hostFlatNumber, hostName: $hostName, hostPhone: $hostPhone, purpose: $purpose, type: $type, status: $status, expectedArrivalTime: $expectedArrivalTime, actualArrivalTime: $actualArrivalTime, expectedDepartureTime: $expectedDepartureTime, actualDepartureTime: $actualDepartureTime, otp: $otp, otpVerifiedBy: $otpVerifiedBy, approvedBy: $approvedBy, approvedAt: $approvedAt, rejectedBy: $rejectedBy, rejectionReason: $rejectionReason, rejectedAt: $rejectedAt, checkedInBy: $checkedInBy, checkedInAt: $checkedInAt, checkedOutBy: $checkedOutBy, checkedOutAt: $checkedOutAt, photos: $photos, metadata: $metadata, createdAt: $createdAt, createdBy: $createdBy, updatedAt: $updatedAt, updatedBy: $updatedBy, isPreApproved: $isPreApproved, preApprovedBy: $preApprovedBy, preApprovedAt: $preApprovedAt, validUntil: $validUntil, isRecurring: $isRecurring, recurringPattern: $recurringPattern, visitCount: $visitCount, lastVisitId: $lastVisitId, deliveryCompany: $deliveryCompany, trackingNumber: $trackingNumber, packageName: $packageName, packageHandedOver: $packageHandedOver, packageHandoverPhotoUrl: $packageHandoverPhotoUrl, handedOverTo: $handedOverTo, packageHandoverAt: $packageHandoverAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitorEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.societyId, societyId) ||
                other.societyId == societyId) &&
            (identical(other.gateName, gateName) ||
                other.gateName == gateName) &&
            (identical(other.visitorName, visitorName) ||
                other.visitorName == visitorName) &&
            (identical(other.visitorPhone, visitorPhone) ||
                other.visitorPhone == visitorPhone) &&
            (identical(other.visitorPhotoUrl, visitorPhotoUrl) ||
                other.visitorPhotoUrl == visitorPhotoUrl) &&
            (identical(other.vehicleNumber, vehicleNumber) ||
                other.vehicleNumber == vehicleNumber) &&
            (identical(other.licensePlatePhotoUrl, licensePlatePhotoUrl) ||
                other.licensePlatePhotoUrl == licensePlatePhotoUrl) &&
            (identical(other.hostFlatId, hostFlatId) ||
                other.hostFlatId == hostFlatId) &&
            (identical(other.hostFlatNumber, hostFlatNumber) ||
                other.hostFlatNumber == hostFlatNumber) &&
            (identical(other.hostName, hostName) ||
                other.hostName == hostName) &&
            (identical(other.hostPhone, hostPhone) ||
                other.hostPhone == hostPhone) &&
            (identical(other.purpose, purpose) || other.purpose == purpose) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.expectedArrivalTime, expectedArrivalTime) ||
                other.expectedArrivalTime == expectedArrivalTime) &&
            (identical(other.actualArrivalTime, actualArrivalTime) ||
                other.actualArrivalTime == actualArrivalTime) &&
            (identical(other.expectedDepartureTime, expectedDepartureTime) ||
                other.expectedDepartureTime == expectedDepartureTime) &&
            (identical(other.actualDepartureTime, actualDepartureTime) ||
                other.actualDepartureTime == actualDepartureTime) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.otpVerifiedBy, otpVerifiedBy) ||
                other.otpVerifiedBy == otpVerifiedBy) &&
            (identical(other.approvedBy, approvedBy) ||
                other.approvedBy == approvedBy) &&
            (identical(other.approvedAt, approvedAt) ||
                other.approvedAt == approvedAt) &&
            (identical(other.rejectedBy, rejectedBy) ||
                other.rejectedBy == rejectedBy) &&
            (identical(other.rejectionReason, rejectionReason) ||
                other.rejectionReason == rejectionReason) &&
            (identical(other.rejectedAt, rejectedAt) ||
                other.rejectedAt == rejectedAt) &&
            (identical(other.checkedInBy, checkedInBy) ||
                other.checkedInBy == checkedInBy) &&
            (identical(other.checkedInAt, checkedInAt) ||
                other.checkedInAt == checkedInAt) &&
            (identical(other.checkedOutBy, checkedOutBy) ||
                other.checkedOutBy == checkedOutBy) &&
            (identical(other.checkedOutAt, checkedOutAt) ||
                other.checkedOutAt == checkedOutAt) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.isPreApproved, isPreApproved) ||
                other.isPreApproved == isPreApproved) &&
            (identical(other.preApprovedBy, preApprovedBy) ||
                other.preApprovedBy == preApprovedBy) &&
            (identical(other.preApprovedAt, preApprovedAt) ||
                other.preApprovedAt == preApprovedAt) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil) &&
            (identical(other.isRecurring, isRecurring) ||
                other.isRecurring == isRecurring) &&
            (identical(other.recurringPattern, recurringPattern) ||
                other.recurringPattern == recurringPattern) &&
            (identical(other.visitCount, visitCount) ||
                other.visitCount == visitCount) &&
            (identical(other.lastVisitId, lastVisitId) ||
                other.lastVisitId == lastVisitId) &&
            (identical(other.deliveryCompany, deliveryCompany) ||
                other.deliveryCompany == deliveryCompany) &&
            (identical(other.trackingNumber, trackingNumber) ||
                other.trackingNumber == trackingNumber) &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName) &&
            (identical(other.packageHandedOver, packageHandedOver) ||
                other.packageHandedOver == packageHandedOver) &&
            (identical(other.packageHandoverPhotoUrl, packageHandoverPhotoUrl) ||
                other.packageHandoverPhotoUrl == packageHandoverPhotoUrl) &&
            (identical(other.handedOverTo, handedOverTo) ||
                other.handedOverTo == handedOverTo) &&
            (identical(other.packageHandoverAt, packageHandoverAt) || other.packageHandoverAt == packageHandoverAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        societyId,
        gateName,
        visitorName,
        visitorPhone,
        visitorPhotoUrl,
        vehicleNumber,
        licensePlatePhotoUrl,
        hostFlatId,
        hostFlatNumber,
        hostName,
        hostPhone,
        purpose,
        type,
        status,
        expectedArrivalTime,
        actualArrivalTime,
        expectedDepartureTime,
        actualDepartureTime,
        otp,
        otpVerifiedBy,
        approvedBy,
        approvedAt,
        rejectedBy,
        rejectionReason,
        rejectedAt,
        checkedInBy,
        checkedInAt,
        checkedOutBy,
        checkedOutAt,
        const DeepCollectionEquality().hash(_photos),
        const DeepCollectionEquality().hash(_metadata),
        createdAt,
        createdBy,
        updatedAt,
        updatedBy,
        isPreApproved,
        preApprovedBy,
        preApprovedAt,
        validUntil,
        isRecurring,
        recurringPattern,
        visitCount,
        lastVisitId,
        deliveryCompany,
        trackingNumber,
        packageName,
        packageHandedOver,
        packageHandoverPhotoUrl,
        handedOverTo,
        packageHandoverAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VisitorEntityImplCopyWith<_$VisitorEntityImpl> get copyWith =>
      __$$VisitorEntityImplCopyWithImpl<_$VisitorEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VisitorEntityImplToJson(
      this,
    );
  }
}

abstract class _VisitorEntity implements VisitorEntity {
  const factory _VisitorEntity(
      {required final String id,
      required final String societyId,
      required final String gateName,
      required final String visitorName,
      final String? visitorPhone,
      final String? visitorPhotoUrl,
      final String? vehicleNumber,
      final String? licensePlatePhotoUrl,
      required final String hostFlatId,
      final String? hostFlatNumber,
      final String? hostName,
      final String? hostPhone,
      required final String purpose,
      final VisitorType type,
      final VisitorStatus status,
      final DateTime? expectedArrivalTime,
      final DateTime? actualArrivalTime,
      final DateTime? expectedDepartureTime,
      final DateTime? actualDepartureTime,
      final String? otp,
      final int? otpVerifiedBy,
      final String? approvedBy,
      final DateTime? approvedAt,
      final String? rejectedBy,
      final String? rejectionReason,
      final DateTime? rejectedAt,
      final String? checkedInBy,
      final DateTime? checkedInAt,
      final String? checkedOutBy,
      final DateTime? checkedOutAt,
      final List<String>? photos,
      final Map<String, dynamic>? metadata,
      required final DateTime createdAt,
      final String? createdBy,
      final DateTime? updatedAt,
      final String? updatedBy,
      final bool isPreApproved,
      final String? preApprovedBy,
      final DateTime? preApprovedAt,
      final DateTime? validUntil,
      final bool isRecurring,
      final String? recurringPattern,
      final int? visitCount,
      final String? lastVisitId,
      final String? deliveryCompany,
      final String? trackingNumber,
      final String? packageName,
      final bool? packageHandedOver,
      final String? packageHandoverPhotoUrl,
      final String? handedOverTo,
      final DateTime? packageHandoverAt}) = _$VisitorEntityImpl;

  factory _VisitorEntity.fromJson(Map<String, dynamic> json) =
      _$VisitorEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get societyId;
  @override
  String get gateName;
  @override
  String get visitorName;
  @override
  String? get visitorPhone;
  @override
  String? get visitorPhotoUrl;
  @override
  String? get vehicleNumber;
  @override
  String? get licensePlatePhotoUrl;
  @override
  String get hostFlatId;
  @override
  String? get hostFlatNumber;
  @override
  String? get hostName;
  @override
  String? get hostPhone;
  @override
  String get purpose;
  @override
  VisitorType get type;
  @override
  VisitorStatus get status;
  @override
  DateTime? get expectedArrivalTime;
  @override
  DateTime? get actualArrivalTime;
  @override
  DateTime? get expectedDepartureTime;
  @override
  DateTime? get actualDepartureTime;
  @override
  String? get otp;
  @override
  int? get otpVerifiedBy;
  @override
  String? get approvedBy;
  @override
  DateTime? get approvedAt;
  @override
  String? get rejectedBy;
  @override
  String? get rejectionReason;
  @override
  DateTime? get rejectedAt;
  @override
  String? get checkedInBy;
  @override
  DateTime? get checkedInAt;
  @override
  String? get checkedOutBy;
  @override
  DateTime? get checkedOutAt;
  @override
  List<String>? get photos;
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime get createdAt;
  @override
  String? get createdBy;
  @override
  DateTime? get updatedAt;
  @override
  String? get updatedBy;
  @override
  bool get isPreApproved;
  @override
  String? get preApprovedBy;
  @override
  DateTime? get preApprovedAt;
  @override
  DateTime? get validUntil;
  @override
  bool get isRecurring;
  @override
  String? get recurringPattern;
  @override
  int? get visitCount;
  @override
  String? get lastVisitId;
  @override // For delivery personnel
  String? get deliveryCompany;
  @override
  String? get trackingNumber;
  @override
  String? get packageName;
  @override
  bool? get packageHandedOver;
  @override
  String? get packageHandoverPhotoUrl;
  @override
  String? get handedOverTo;
  @override
  DateTime? get packageHandoverAt;
  @override
  @JsonKey(ignore: true)
  _$$VisitorEntityImplCopyWith<_$VisitorEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VisitorCheckInRequest _$VisitorCheckInRequestFromJson(
    Map<String, dynamic> json) {
  return _VisitorCheckInRequest.fromJson(json);
}

/// @nodoc
mixin _$VisitorCheckInRequest {
  String get visitorId => throw _privateConstructorUsedError;
  String get securityUserId => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  DateTime? get checkInTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisitorCheckInRequestCopyWith<VisitorCheckInRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitorCheckInRequestCopyWith<$Res> {
  factory $VisitorCheckInRequestCopyWith(VisitorCheckInRequest value,
          $Res Function(VisitorCheckInRequest) then) =
      _$VisitorCheckInRequestCopyWithImpl<$Res, VisitorCheckInRequest>;
  @useResult
  $Res call(
      {String visitorId,
      String securityUserId,
      String? photoUrl,
      DateTime? checkInTime});
}

/// @nodoc
class _$VisitorCheckInRequestCopyWithImpl<$Res,
        $Val extends VisitorCheckInRequest>
    implements $VisitorCheckInRequestCopyWith<$Res> {
  _$VisitorCheckInRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visitorId = null,
    Object? securityUserId = null,
    Object? photoUrl = freezed,
    Object? checkInTime = freezed,
  }) {
    return _then(_value.copyWith(
      visitorId: null == visitorId
          ? _value.visitorId
          : visitorId // ignore: cast_nullable_to_non_nullable
              as String,
      securityUserId: null == securityUserId
          ? _value.securityUserId
          : securityUserId // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      checkInTime: freezed == checkInTime
          ? _value.checkInTime
          : checkInTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VisitorCheckInRequestImplCopyWith<$Res>
    implements $VisitorCheckInRequestCopyWith<$Res> {
  factory _$$VisitorCheckInRequestImplCopyWith(
          _$VisitorCheckInRequestImpl value,
          $Res Function(_$VisitorCheckInRequestImpl) then) =
      __$$VisitorCheckInRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String visitorId,
      String securityUserId,
      String? photoUrl,
      DateTime? checkInTime});
}

/// @nodoc
class __$$VisitorCheckInRequestImplCopyWithImpl<$Res>
    extends _$VisitorCheckInRequestCopyWithImpl<$Res,
        _$VisitorCheckInRequestImpl>
    implements _$$VisitorCheckInRequestImplCopyWith<$Res> {
  __$$VisitorCheckInRequestImplCopyWithImpl(_$VisitorCheckInRequestImpl _value,
      $Res Function(_$VisitorCheckInRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visitorId = null,
    Object? securityUserId = null,
    Object? photoUrl = freezed,
    Object? checkInTime = freezed,
  }) {
    return _then(_$VisitorCheckInRequestImpl(
      visitorId: null == visitorId
          ? _value.visitorId
          : visitorId // ignore: cast_nullable_to_non_nullable
              as String,
      securityUserId: null == securityUserId
          ? _value.securityUserId
          : securityUserId // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      checkInTime: freezed == checkInTime
          ? _value.checkInTime
          : checkInTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VisitorCheckInRequestImpl implements _VisitorCheckInRequest {
  const _$VisitorCheckInRequestImpl(
      {required this.visitorId,
      required this.securityUserId,
      this.photoUrl,
      this.checkInTime});

  factory _$VisitorCheckInRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$VisitorCheckInRequestImplFromJson(json);

  @override
  final String visitorId;
  @override
  final String securityUserId;
  @override
  final String? photoUrl;
  @override
  final DateTime? checkInTime;

  @override
  String toString() {
    return 'VisitorCheckInRequest(visitorId: $visitorId, securityUserId: $securityUserId, photoUrl: $photoUrl, checkInTime: $checkInTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitorCheckInRequestImpl &&
            (identical(other.visitorId, visitorId) ||
                other.visitorId == visitorId) &&
            (identical(other.securityUserId, securityUserId) ||
                other.securityUserId == securityUserId) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.checkInTime, checkInTime) ||
                other.checkInTime == checkInTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, visitorId, securityUserId, photoUrl, checkInTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VisitorCheckInRequestImplCopyWith<_$VisitorCheckInRequestImpl>
      get copyWith => __$$VisitorCheckInRequestImplCopyWithImpl<
          _$VisitorCheckInRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VisitorCheckInRequestImplToJson(
      this,
    );
  }
}

abstract class _VisitorCheckInRequest implements VisitorCheckInRequest {
  const factory _VisitorCheckInRequest(
      {required final String visitorId,
      required final String securityUserId,
      final String? photoUrl,
      final DateTime? checkInTime}) = _$VisitorCheckInRequestImpl;

  factory _VisitorCheckInRequest.fromJson(Map<String, dynamic> json) =
      _$VisitorCheckInRequestImpl.fromJson;

  @override
  String get visitorId;
  @override
  String get securityUserId;
  @override
  String? get photoUrl;
  @override
  DateTime? get checkInTime;
  @override
  @JsonKey(ignore: true)
  _$$VisitorCheckInRequestImplCopyWith<_$VisitorCheckInRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VisitorCheckOutRequest _$VisitorCheckOutRequestFromJson(
    Map<String, dynamic> json) {
  return _VisitorCheckOutRequest.fromJson(json);
}

/// @nodoc
mixin _$VisitorCheckOutRequest {
  String get visitorId => throw _privateConstructorUsedError;
  String get securityUserId => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  DateTime? get checkOutTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisitorCheckOutRequestCopyWith<VisitorCheckOutRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitorCheckOutRequestCopyWith<$Res> {
  factory $VisitorCheckOutRequestCopyWith(VisitorCheckOutRequest value,
          $Res Function(VisitorCheckOutRequest) then) =
      _$VisitorCheckOutRequestCopyWithImpl<$Res, VisitorCheckOutRequest>;
  @useResult
  $Res call(
      {String visitorId,
      String securityUserId,
      String? reason,
      DateTime? checkOutTime});
}

/// @nodoc
class _$VisitorCheckOutRequestCopyWithImpl<$Res,
        $Val extends VisitorCheckOutRequest>
    implements $VisitorCheckOutRequestCopyWith<$Res> {
  _$VisitorCheckOutRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visitorId = null,
    Object? securityUserId = null,
    Object? reason = freezed,
    Object? checkOutTime = freezed,
  }) {
    return _then(_value.copyWith(
      visitorId: null == visitorId
          ? _value.visitorId
          : visitorId // ignore: cast_nullable_to_non_nullable
              as String,
      securityUserId: null == securityUserId
          ? _value.securityUserId
          : securityUserId // ignore: cast_nullable_to_non_nullable
              as String,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      checkOutTime: freezed == checkOutTime
          ? _value.checkOutTime
          : checkOutTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VisitorCheckOutRequestImplCopyWith<$Res>
    implements $VisitorCheckOutRequestCopyWith<$Res> {
  factory _$$VisitorCheckOutRequestImplCopyWith(
          _$VisitorCheckOutRequestImpl value,
          $Res Function(_$VisitorCheckOutRequestImpl) then) =
      __$$VisitorCheckOutRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String visitorId,
      String securityUserId,
      String? reason,
      DateTime? checkOutTime});
}

/// @nodoc
class __$$VisitorCheckOutRequestImplCopyWithImpl<$Res>
    extends _$VisitorCheckOutRequestCopyWithImpl<$Res,
        _$VisitorCheckOutRequestImpl>
    implements _$$VisitorCheckOutRequestImplCopyWith<$Res> {
  __$$VisitorCheckOutRequestImplCopyWithImpl(
      _$VisitorCheckOutRequestImpl _value,
      $Res Function(_$VisitorCheckOutRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visitorId = null,
    Object? securityUserId = null,
    Object? reason = freezed,
    Object? checkOutTime = freezed,
  }) {
    return _then(_$VisitorCheckOutRequestImpl(
      visitorId: null == visitorId
          ? _value.visitorId
          : visitorId // ignore: cast_nullable_to_non_nullable
              as String,
      securityUserId: null == securityUserId
          ? _value.securityUserId
          : securityUserId // ignore: cast_nullable_to_non_nullable
              as String,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      checkOutTime: freezed == checkOutTime
          ? _value.checkOutTime
          : checkOutTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VisitorCheckOutRequestImpl implements _VisitorCheckOutRequest {
  const _$VisitorCheckOutRequestImpl(
      {required this.visitorId,
      required this.securityUserId,
      this.reason,
      this.checkOutTime});

  factory _$VisitorCheckOutRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$VisitorCheckOutRequestImplFromJson(json);

  @override
  final String visitorId;
  @override
  final String securityUserId;
  @override
  final String? reason;
  @override
  final DateTime? checkOutTime;

  @override
  String toString() {
    return 'VisitorCheckOutRequest(visitorId: $visitorId, securityUserId: $securityUserId, reason: $reason, checkOutTime: $checkOutTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitorCheckOutRequestImpl &&
            (identical(other.visitorId, visitorId) ||
                other.visitorId == visitorId) &&
            (identical(other.securityUserId, securityUserId) ||
                other.securityUserId == securityUserId) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.checkOutTime, checkOutTime) ||
                other.checkOutTime == checkOutTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, visitorId, securityUserId, reason, checkOutTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VisitorCheckOutRequestImplCopyWith<_$VisitorCheckOutRequestImpl>
      get copyWith => __$$VisitorCheckOutRequestImplCopyWithImpl<
          _$VisitorCheckOutRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VisitorCheckOutRequestImplToJson(
      this,
    );
  }
}

abstract class _VisitorCheckOutRequest implements VisitorCheckOutRequest {
  const factory _VisitorCheckOutRequest(
      {required final String visitorId,
      required final String securityUserId,
      final String? reason,
      final DateTime? checkOutTime}) = _$VisitorCheckOutRequestImpl;

  factory _VisitorCheckOutRequest.fromJson(Map<String, dynamic> json) =
      _$VisitorCheckOutRequestImpl.fromJson;

  @override
  String get visitorId;
  @override
  String get securityUserId;
  @override
  String? get reason;
  @override
  DateTime? get checkOutTime;
  @override
  @JsonKey(ignore: true)
  _$$VisitorCheckOutRequestImplCopyWith<_$VisitorCheckOutRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PreApprovalRequest _$PreApprovalRequestFromJson(Map<String, dynamic> json) {
  return _PreApprovalRequest.fromJson(json);
}

/// @nodoc
mixin _$PreApprovalRequest {
  String get id => throw _privateConstructorUsedError;
  String get societyId => throw _privateConstructorUsedError;
  String get flatId => throw _privateConstructorUsedError;
  String get visitorName => throw _privateConstructorUsedError;
  String? get visitorPhone => throw _privateConstructorUsedError;
  String get purpose => throw _privateConstructorUsedError;
  VisitorType get type => throw _privateConstructorUsedError;
  DateTime get validFrom => throw _privateConstructorUsedError;
  DateTime get validUntil => throw _privateConstructorUsedError;
  String? get recurringPattern =>
      throw _privateConstructorUsedError; // e.g., "daily", "weekly", "weekdays"
  String get createdBy => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  int? get maxVisits => throw _privateConstructorUsedError;
  int? get currentVisitCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PreApprovalRequestCopyWith<PreApprovalRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreApprovalRequestCopyWith<$Res> {
  factory $PreApprovalRequestCopyWith(
          PreApprovalRequest value, $Res Function(PreApprovalRequest) then) =
      _$PreApprovalRequestCopyWithImpl<$Res, PreApprovalRequest>;
  @useResult
  $Res call(
      {String id,
      String societyId,
      String flatId,
      String visitorName,
      String? visitorPhone,
      String purpose,
      VisitorType type,
      DateTime validFrom,
      DateTime validUntil,
      String? recurringPattern,
      String createdBy,
      DateTime? createdAt,
      bool isActive,
      String? notes,
      int? maxVisits,
      int? currentVisitCount});
}

/// @nodoc
class _$PreApprovalRequestCopyWithImpl<$Res, $Val extends PreApprovalRequest>
    implements $PreApprovalRequestCopyWith<$Res> {
  _$PreApprovalRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? flatId = null,
    Object? visitorName = null,
    Object? visitorPhone = freezed,
    Object? purpose = null,
    Object? type = null,
    Object? validFrom = null,
    Object? validUntil = null,
    Object? recurringPattern = freezed,
    Object? createdBy = null,
    Object? createdAt = freezed,
    Object? isActive = null,
    Object? notes = freezed,
    Object? maxVisits = freezed,
    Object? currentVisitCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      societyId: null == societyId
          ? _value.societyId
          : societyId // ignore: cast_nullable_to_non_nullable
              as String,
      flatId: null == flatId
          ? _value.flatId
          : flatId // ignore: cast_nullable_to_non_nullable
              as String,
      visitorName: null == visitorName
          ? _value.visitorName
          : visitorName // ignore: cast_nullable_to_non_nullable
              as String,
      visitorPhone: freezed == visitorPhone
          ? _value.visitorPhone
          : visitorPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      purpose: null == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as VisitorType,
      validFrom: null == validFrom
          ? _value.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as DateTime,
      validUntil: null == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as DateTime,
      recurringPattern: freezed == recurringPattern
          ? _value.recurringPattern
          : recurringPattern // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      maxVisits: freezed == maxVisits
          ? _value.maxVisits
          : maxVisits // ignore: cast_nullable_to_non_nullable
              as int?,
      currentVisitCount: freezed == currentVisitCount
          ? _value.currentVisitCount
          : currentVisitCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreApprovalRequestImplCopyWith<$Res>
    implements $PreApprovalRequestCopyWith<$Res> {
  factory _$$PreApprovalRequestImplCopyWith(_$PreApprovalRequestImpl value,
          $Res Function(_$PreApprovalRequestImpl) then) =
      __$$PreApprovalRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String societyId,
      String flatId,
      String visitorName,
      String? visitorPhone,
      String purpose,
      VisitorType type,
      DateTime validFrom,
      DateTime validUntil,
      String? recurringPattern,
      String createdBy,
      DateTime? createdAt,
      bool isActive,
      String? notes,
      int? maxVisits,
      int? currentVisitCount});
}

/// @nodoc
class __$$PreApprovalRequestImplCopyWithImpl<$Res>
    extends _$PreApprovalRequestCopyWithImpl<$Res, _$PreApprovalRequestImpl>
    implements _$$PreApprovalRequestImplCopyWith<$Res> {
  __$$PreApprovalRequestImplCopyWithImpl(_$PreApprovalRequestImpl _value,
      $Res Function(_$PreApprovalRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? flatId = null,
    Object? visitorName = null,
    Object? visitorPhone = freezed,
    Object? purpose = null,
    Object? type = null,
    Object? validFrom = null,
    Object? validUntil = null,
    Object? recurringPattern = freezed,
    Object? createdBy = null,
    Object? createdAt = freezed,
    Object? isActive = null,
    Object? notes = freezed,
    Object? maxVisits = freezed,
    Object? currentVisitCount = freezed,
  }) {
    return _then(_$PreApprovalRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      societyId: null == societyId
          ? _value.societyId
          : societyId // ignore: cast_nullable_to_non_nullable
              as String,
      flatId: null == flatId
          ? _value.flatId
          : flatId // ignore: cast_nullable_to_non_nullable
              as String,
      visitorName: null == visitorName
          ? _value.visitorName
          : visitorName // ignore: cast_nullable_to_non_nullable
              as String,
      visitorPhone: freezed == visitorPhone
          ? _value.visitorPhone
          : visitorPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      purpose: null == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as VisitorType,
      validFrom: null == validFrom
          ? _value.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as DateTime,
      validUntil: null == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as DateTime,
      recurringPattern: freezed == recurringPattern
          ? _value.recurringPattern
          : recurringPattern // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      maxVisits: freezed == maxVisits
          ? _value.maxVisits
          : maxVisits // ignore: cast_nullable_to_non_nullable
              as int?,
      currentVisitCount: freezed == currentVisitCount
          ? _value.currentVisitCount
          : currentVisitCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PreApprovalRequestImpl implements _PreApprovalRequest {
  const _$PreApprovalRequestImpl(
      {required this.id,
      required this.societyId,
      required this.flatId,
      required this.visitorName,
      this.visitorPhone,
      required this.purpose,
      this.type = VisitorType.guest,
      required this.validFrom,
      required this.validUntil,
      this.recurringPattern,
      required this.createdBy,
      this.createdAt,
      this.isActive = true,
      this.notes,
      this.maxVisits,
      this.currentVisitCount});

  factory _$PreApprovalRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreApprovalRequestImplFromJson(json);

  @override
  final String id;
  @override
  final String societyId;
  @override
  final String flatId;
  @override
  final String visitorName;
  @override
  final String? visitorPhone;
  @override
  final String purpose;
  @override
  @JsonKey()
  final VisitorType type;
  @override
  final DateTime validFrom;
  @override
  final DateTime validUntil;
  @override
  final String? recurringPattern;
// e.g., "daily", "weekly", "weekdays"
  @override
  final String createdBy;
  @override
  final DateTime? createdAt;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final String? notes;
  @override
  final int? maxVisits;
  @override
  final int? currentVisitCount;

  @override
  String toString() {
    return 'PreApprovalRequest(id: $id, societyId: $societyId, flatId: $flatId, visitorName: $visitorName, visitorPhone: $visitorPhone, purpose: $purpose, type: $type, validFrom: $validFrom, validUntil: $validUntil, recurringPattern: $recurringPattern, createdBy: $createdBy, createdAt: $createdAt, isActive: $isActive, notes: $notes, maxVisits: $maxVisits, currentVisitCount: $currentVisitCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreApprovalRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.societyId, societyId) ||
                other.societyId == societyId) &&
            (identical(other.flatId, flatId) || other.flatId == flatId) &&
            (identical(other.visitorName, visitorName) ||
                other.visitorName == visitorName) &&
            (identical(other.visitorPhone, visitorPhone) ||
                other.visitorPhone == visitorPhone) &&
            (identical(other.purpose, purpose) || other.purpose == purpose) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.validFrom, validFrom) ||
                other.validFrom == validFrom) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil) &&
            (identical(other.recurringPattern, recurringPattern) ||
                other.recurringPattern == recurringPattern) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.maxVisits, maxVisits) ||
                other.maxVisits == maxVisits) &&
            (identical(other.currentVisitCount, currentVisitCount) ||
                other.currentVisitCount == currentVisitCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      societyId,
      flatId,
      visitorName,
      visitorPhone,
      purpose,
      type,
      validFrom,
      validUntil,
      recurringPattern,
      createdBy,
      createdAt,
      isActive,
      notes,
      maxVisits,
      currentVisitCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreApprovalRequestImplCopyWith<_$PreApprovalRequestImpl> get copyWith =>
      __$$PreApprovalRequestImplCopyWithImpl<_$PreApprovalRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreApprovalRequestImplToJson(
      this,
    );
  }
}

abstract class _PreApprovalRequest implements PreApprovalRequest {
  const factory _PreApprovalRequest(
      {required final String id,
      required final String societyId,
      required final String flatId,
      required final String visitorName,
      final String? visitorPhone,
      required final String purpose,
      final VisitorType type,
      required final DateTime validFrom,
      required final DateTime validUntil,
      final String? recurringPattern,
      required final String createdBy,
      final DateTime? createdAt,
      final bool isActive,
      final String? notes,
      final int? maxVisits,
      final int? currentVisitCount}) = _$PreApprovalRequestImpl;

  factory _PreApprovalRequest.fromJson(Map<String, dynamic> json) =
      _$PreApprovalRequestImpl.fromJson;

  @override
  String get id;
  @override
  String get societyId;
  @override
  String get flatId;
  @override
  String get visitorName;
  @override
  String? get visitorPhone;
  @override
  String get purpose;
  @override
  VisitorType get type;
  @override
  DateTime get validFrom;
  @override
  DateTime get validUntil;
  @override
  String? get recurringPattern;
  @override // e.g., "daily", "weekly", "weekdays"
  String get createdBy;
  @override
  DateTime? get createdAt;
  @override
  bool get isActive;
  @override
  String? get notes;
  @override
  int? get maxVisits;
  @override
  int? get currentVisitCount;
  @override
  @JsonKey(ignore: true)
  _$$PreApprovalRequestImplCopyWith<_$PreApprovalRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VisitorStats _$VisitorStatsFromJson(Map<String, dynamic> json) {
  return _VisitorStats.fromJson(json);
}

/// @nodoc
mixin _$VisitorStats {
  int get totalVisitorsToday => throw _privateConstructorUsedError;
  int get totalVisitorsThisWeek => throw _privateConstructorUsedError;
  int get totalVisitorsThisMonth => throw _privateConstructorUsedError;
  int get currentlyInside => throw _privateConstructorUsedError;
  int get pendingApprovals => throw _privateConstructorUsedError;
  int get preApprovedToday => throw _privateConstructorUsedError;
  int get deliveriesToday => throw _privateConstructorUsedError;
  int get serviceProvidersToday => throw _privateConstructorUsedError;
  Map<String, int>? get visitorsByHour => throw _privateConstructorUsedError;
  Map<String, int>? get visitorsByGate => throw _privateConstructorUsedError;
  Map<String, int>? get visitorsByType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisitorStatsCopyWith<VisitorStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitorStatsCopyWith<$Res> {
  factory $VisitorStatsCopyWith(
          VisitorStats value, $Res Function(VisitorStats) then) =
      _$VisitorStatsCopyWithImpl<$Res, VisitorStats>;
  @useResult
  $Res call(
      {int totalVisitorsToday,
      int totalVisitorsThisWeek,
      int totalVisitorsThisMonth,
      int currentlyInside,
      int pendingApprovals,
      int preApprovedToday,
      int deliveriesToday,
      int serviceProvidersToday,
      Map<String, int>? visitorsByHour,
      Map<String, int>? visitorsByGate,
      Map<String, int>? visitorsByType});
}

/// @nodoc
class _$VisitorStatsCopyWithImpl<$Res, $Val extends VisitorStats>
    implements $VisitorStatsCopyWith<$Res> {
  _$VisitorStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalVisitorsToday = null,
    Object? totalVisitorsThisWeek = null,
    Object? totalVisitorsThisMonth = null,
    Object? currentlyInside = null,
    Object? pendingApprovals = null,
    Object? preApprovedToday = null,
    Object? deliveriesToday = null,
    Object? serviceProvidersToday = null,
    Object? visitorsByHour = freezed,
    Object? visitorsByGate = freezed,
    Object? visitorsByType = freezed,
  }) {
    return _then(_value.copyWith(
      totalVisitorsToday: null == totalVisitorsToday
          ? _value.totalVisitorsToday
          : totalVisitorsToday // ignore: cast_nullable_to_non_nullable
              as int,
      totalVisitorsThisWeek: null == totalVisitorsThisWeek
          ? _value.totalVisitorsThisWeek
          : totalVisitorsThisWeek // ignore: cast_nullable_to_non_nullable
              as int,
      totalVisitorsThisMonth: null == totalVisitorsThisMonth
          ? _value.totalVisitorsThisMonth
          : totalVisitorsThisMonth // ignore: cast_nullable_to_non_nullable
              as int,
      currentlyInside: null == currentlyInside
          ? _value.currentlyInside
          : currentlyInside // ignore: cast_nullable_to_non_nullable
              as int,
      pendingApprovals: null == pendingApprovals
          ? _value.pendingApprovals
          : pendingApprovals // ignore: cast_nullable_to_non_nullable
              as int,
      preApprovedToday: null == preApprovedToday
          ? _value.preApprovedToday
          : preApprovedToday // ignore: cast_nullable_to_non_nullable
              as int,
      deliveriesToday: null == deliveriesToday
          ? _value.deliveriesToday
          : deliveriesToday // ignore: cast_nullable_to_non_nullable
              as int,
      serviceProvidersToday: null == serviceProvidersToday
          ? _value.serviceProvidersToday
          : serviceProvidersToday // ignore: cast_nullable_to_non_nullable
              as int,
      visitorsByHour: freezed == visitorsByHour
          ? _value.visitorsByHour
          : visitorsByHour // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      visitorsByGate: freezed == visitorsByGate
          ? _value.visitorsByGate
          : visitorsByGate // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      visitorsByType: freezed == visitorsByType
          ? _value.visitorsByType
          : visitorsByType // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VisitorStatsImplCopyWith<$Res>
    implements $VisitorStatsCopyWith<$Res> {
  factory _$$VisitorStatsImplCopyWith(
          _$VisitorStatsImpl value, $Res Function(_$VisitorStatsImpl) then) =
      __$$VisitorStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalVisitorsToday,
      int totalVisitorsThisWeek,
      int totalVisitorsThisMonth,
      int currentlyInside,
      int pendingApprovals,
      int preApprovedToday,
      int deliveriesToday,
      int serviceProvidersToday,
      Map<String, int>? visitorsByHour,
      Map<String, int>? visitorsByGate,
      Map<String, int>? visitorsByType});
}

/// @nodoc
class __$$VisitorStatsImplCopyWithImpl<$Res>
    extends _$VisitorStatsCopyWithImpl<$Res, _$VisitorStatsImpl>
    implements _$$VisitorStatsImplCopyWith<$Res> {
  __$$VisitorStatsImplCopyWithImpl(
      _$VisitorStatsImpl _value, $Res Function(_$VisitorStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalVisitorsToday = null,
    Object? totalVisitorsThisWeek = null,
    Object? totalVisitorsThisMonth = null,
    Object? currentlyInside = null,
    Object? pendingApprovals = null,
    Object? preApprovedToday = null,
    Object? deliveriesToday = null,
    Object? serviceProvidersToday = null,
    Object? visitorsByHour = freezed,
    Object? visitorsByGate = freezed,
    Object? visitorsByType = freezed,
  }) {
    return _then(_$VisitorStatsImpl(
      totalVisitorsToday: null == totalVisitorsToday
          ? _value.totalVisitorsToday
          : totalVisitorsToday // ignore: cast_nullable_to_non_nullable
              as int,
      totalVisitorsThisWeek: null == totalVisitorsThisWeek
          ? _value.totalVisitorsThisWeek
          : totalVisitorsThisWeek // ignore: cast_nullable_to_non_nullable
              as int,
      totalVisitorsThisMonth: null == totalVisitorsThisMonth
          ? _value.totalVisitorsThisMonth
          : totalVisitorsThisMonth // ignore: cast_nullable_to_non_nullable
              as int,
      currentlyInside: null == currentlyInside
          ? _value.currentlyInside
          : currentlyInside // ignore: cast_nullable_to_non_nullable
              as int,
      pendingApprovals: null == pendingApprovals
          ? _value.pendingApprovals
          : pendingApprovals // ignore: cast_nullable_to_non_nullable
              as int,
      preApprovedToday: null == preApprovedToday
          ? _value.preApprovedToday
          : preApprovedToday // ignore: cast_nullable_to_non_nullable
              as int,
      deliveriesToday: null == deliveriesToday
          ? _value.deliveriesToday
          : deliveriesToday // ignore: cast_nullable_to_non_nullable
              as int,
      serviceProvidersToday: null == serviceProvidersToday
          ? _value.serviceProvidersToday
          : serviceProvidersToday // ignore: cast_nullable_to_non_nullable
              as int,
      visitorsByHour: freezed == visitorsByHour
          ? _value._visitorsByHour
          : visitorsByHour // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      visitorsByGate: freezed == visitorsByGate
          ? _value._visitorsByGate
          : visitorsByGate // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      visitorsByType: freezed == visitorsByType
          ? _value._visitorsByType
          : visitorsByType // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VisitorStatsImpl implements _VisitorStats {
  const _$VisitorStatsImpl(
      {this.totalVisitorsToday = 0,
      this.totalVisitorsThisWeek = 0,
      this.totalVisitorsThisMonth = 0,
      this.currentlyInside = 0,
      this.pendingApprovals = 0,
      this.preApprovedToday = 0,
      this.deliveriesToday = 0,
      this.serviceProvidersToday = 0,
      final Map<String, int>? visitorsByHour,
      final Map<String, int>? visitorsByGate,
      final Map<String, int>? visitorsByType})
      : _visitorsByHour = visitorsByHour,
        _visitorsByGate = visitorsByGate,
        _visitorsByType = visitorsByType;

  factory _$VisitorStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$VisitorStatsImplFromJson(json);

  @override
  @JsonKey()
  final int totalVisitorsToday;
  @override
  @JsonKey()
  final int totalVisitorsThisWeek;
  @override
  @JsonKey()
  final int totalVisitorsThisMonth;
  @override
  @JsonKey()
  final int currentlyInside;
  @override
  @JsonKey()
  final int pendingApprovals;
  @override
  @JsonKey()
  final int preApprovedToday;
  @override
  @JsonKey()
  final int deliveriesToday;
  @override
  @JsonKey()
  final int serviceProvidersToday;
  final Map<String, int>? _visitorsByHour;
  @override
  Map<String, int>? get visitorsByHour {
    final value = _visitorsByHour;
    if (value == null) return null;
    if (_visitorsByHour is EqualUnmodifiableMapView) return _visitorsByHour;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, int>? _visitorsByGate;
  @override
  Map<String, int>? get visitorsByGate {
    final value = _visitorsByGate;
    if (value == null) return null;
    if (_visitorsByGate is EqualUnmodifiableMapView) return _visitorsByGate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, int>? _visitorsByType;
  @override
  Map<String, int>? get visitorsByType {
    final value = _visitorsByType;
    if (value == null) return null;
    if (_visitorsByType is EqualUnmodifiableMapView) return _visitorsByType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'VisitorStats(totalVisitorsToday: $totalVisitorsToday, totalVisitorsThisWeek: $totalVisitorsThisWeek, totalVisitorsThisMonth: $totalVisitorsThisMonth, currentlyInside: $currentlyInside, pendingApprovals: $pendingApprovals, preApprovedToday: $preApprovedToday, deliveriesToday: $deliveriesToday, serviceProvidersToday: $serviceProvidersToday, visitorsByHour: $visitorsByHour, visitorsByGate: $visitorsByGate, visitorsByType: $visitorsByType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitorStatsImpl &&
            (identical(other.totalVisitorsToday, totalVisitorsToday) ||
                other.totalVisitorsToday == totalVisitorsToday) &&
            (identical(other.totalVisitorsThisWeek, totalVisitorsThisWeek) ||
                other.totalVisitorsThisWeek == totalVisitorsThisWeek) &&
            (identical(other.totalVisitorsThisMonth, totalVisitorsThisMonth) ||
                other.totalVisitorsThisMonth == totalVisitorsThisMonth) &&
            (identical(other.currentlyInside, currentlyInside) ||
                other.currentlyInside == currentlyInside) &&
            (identical(other.pendingApprovals, pendingApprovals) ||
                other.pendingApprovals == pendingApprovals) &&
            (identical(other.preApprovedToday, preApprovedToday) ||
                other.preApprovedToday == preApprovedToday) &&
            (identical(other.deliveriesToday, deliveriesToday) ||
                other.deliveriesToday == deliveriesToday) &&
            (identical(other.serviceProvidersToday, serviceProvidersToday) ||
                other.serviceProvidersToday == serviceProvidersToday) &&
            const DeepCollectionEquality()
                .equals(other._visitorsByHour, _visitorsByHour) &&
            const DeepCollectionEquality()
                .equals(other._visitorsByGate, _visitorsByGate) &&
            const DeepCollectionEquality()
                .equals(other._visitorsByType, _visitorsByType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalVisitorsToday,
      totalVisitorsThisWeek,
      totalVisitorsThisMonth,
      currentlyInside,
      pendingApprovals,
      preApprovedToday,
      deliveriesToday,
      serviceProvidersToday,
      const DeepCollectionEquality().hash(_visitorsByHour),
      const DeepCollectionEquality().hash(_visitorsByGate),
      const DeepCollectionEquality().hash(_visitorsByType));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VisitorStatsImplCopyWith<_$VisitorStatsImpl> get copyWith =>
      __$$VisitorStatsImplCopyWithImpl<_$VisitorStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VisitorStatsImplToJson(
      this,
    );
  }
}

abstract class _VisitorStats implements VisitorStats {
  const factory _VisitorStats(
      {final int totalVisitorsToday,
      final int totalVisitorsThisWeek,
      final int totalVisitorsThisMonth,
      final int currentlyInside,
      final int pendingApprovals,
      final int preApprovedToday,
      final int deliveriesToday,
      final int serviceProvidersToday,
      final Map<String, int>? visitorsByHour,
      final Map<String, int>? visitorsByGate,
      final Map<String, int>? visitorsByType}) = _$VisitorStatsImpl;

  factory _VisitorStats.fromJson(Map<String, dynamic> json) =
      _$VisitorStatsImpl.fromJson;

  @override
  int get totalVisitorsToday;
  @override
  int get totalVisitorsThisWeek;
  @override
  int get totalVisitorsThisMonth;
  @override
  int get currentlyInside;
  @override
  int get pendingApprovals;
  @override
  int get preApprovedToday;
  @override
  int get deliveriesToday;
  @override
  int get serviceProvidersToday;
  @override
  Map<String, int>? get visitorsByHour;
  @override
  Map<String, int>? get visitorsByGate;
  @override
  Map<String, int>? get visitorsByType;
  @override
  @JsonKey(ignore: true)
  _$$VisitorStatsImplCopyWith<_$VisitorStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
