// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VendorContractEntity _$VendorContractEntityFromJson(Map<String, dynamic> json) {
  return _VendorContractEntity.fromJson(json);
}

/// @nodoc
mixin _$VendorContractEntity {
  String get id => throw _privateConstructorUsedError;
  String get vendorId => throw _privateConstructorUsedError;
  String get title =>
      throw _privateConstructorUsedError; // e.g. "Lift AMC Block A"
  String get serviceType =>
      throw _privateConstructorUsedError; // e.g. "Elevator", "Security", "Plumbing"
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get expiryDate => throw _privateConstructorUsedError;
  double get monthlyCost => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  DateTime? get lastServiceDate => throw _privateConstructorUsedError;
  DateTime? get nextServiceDate => throw _privateConstructorUsedError;
  String? get contractDocumentUrl => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // active, expired, terminated, pending_renewal
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VendorContractEntityCopyWith<VendorContractEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorContractEntityCopyWith<$Res> {
  factory $VendorContractEntityCopyWith(VendorContractEntity value,
          $Res Function(VendorContractEntity) then) =
      _$VendorContractEntityCopyWithImpl<$Res, VendorContractEntity>;
  @useResult
  $Res call(
      {String id,
      String vendorId,
      String title,
      String serviceType,
      DateTime startDate,
      DateTime expiryDate,
      double monthlyCost,
      String currency,
      DateTime? lastServiceDate,
      DateTime? nextServiceDate,
      String? contractDocumentUrl,
      String? notes,
      String status,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$VendorContractEntityCopyWithImpl<$Res,
        $Val extends VendorContractEntity>
    implements $VendorContractEntityCopyWith<$Res> {
  _$VendorContractEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vendorId = null,
    Object? title = null,
    Object? serviceType = null,
    Object? startDate = null,
    Object? expiryDate = null,
    Object? monthlyCost = null,
    Object? currency = null,
    Object? lastServiceDate = freezed,
    Object? nextServiceDate = freezed,
    Object? contractDocumentUrl = freezed,
    Object? notes = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      vendorId: null == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      monthlyCost: null == monthlyCost
          ? _value.monthlyCost
          : monthlyCost // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      lastServiceDate: freezed == lastServiceDate
          ? _value.lastServiceDate
          : lastServiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextServiceDate: freezed == nextServiceDate
          ? _value.nextServiceDate
          : nextServiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      contractDocumentUrl: freezed == contractDocumentUrl
          ? _value.contractDocumentUrl
          : contractDocumentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VendorContractEntityImplCopyWith<$Res>
    implements $VendorContractEntityCopyWith<$Res> {
  factory _$$VendorContractEntityImplCopyWith(_$VendorContractEntityImpl value,
          $Res Function(_$VendorContractEntityImpl) then) =
      __$$VendorContractEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String vendorId,
      String title,
      String serviceType,
      DateTime startDate,
      DateTime expiryDate,
      double monthlyCost,
      String currency,
      DateTime? lastServiceDate,
      DateTime? nextServiceDate,
      String? contractDocumentUrl,
      String? notes,
      String status,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$VendorContractEntityImplCopyWithImpl<$Res>
    extends _$VendorContractEntityCopyWithImpl<$Res, _$VendorContractEntityImpl>
    implements _$$VendorContractEntityImplCopyWith<$Res> {
  __$$VendorContractEntityImplCopyWithImpl(_$VendorContractEntityImpl _value,
      $Res Function(_$VendorContractEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vendorId = null,
    Object? title = null,
    Object? serviceType = null,
    Object? startDate = null,
    Object? expiryDate = null,
    Object? monthlyCost = null,
    Object? currency = null,
    Object? lastServiceDate = freezed,
    Object? nextServiceDate = freezed,
    Object? contractDocumentUrl = freezed,
    Object? notes = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$VendorContractEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      vendorId: null == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      monthlyCost: null == monthlyCost
          ? _value.monthlyCost
          : monthlyCost // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      lastServiceDate: freezed == lastServiceDate
          ? _value.lastServiceDate
          : lastServiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextServiceDate: freezed == nextServiceDate
          ? _value.nextServiceDate
          : nextServiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      contractDocumentUrl: freezed == contractDocumentUrl
          ? _value.contractDocumentUrl
          : contractDocumentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorContractEntityImpl implements _VendorContractEntity {
  const _$VendorContractEntityImpl(
      {required this.id,
      required this.vendorId,
      required this.title,
      required this.serviceType,
      required this.startDate,
      required this.expiryDate,
      required this.monthlyCost,
      this.currency = 'INR',
      this.lastServiceDate,
      this.nextServiceDate,
      this.contractDocumentUrl,
      this.notes,
      this.status = 'active',
      this.createdAt,
      this.updatedAt});

  factory _$VendorContractEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorContractEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String vendorId;
  @override
  final String title;
// e.g. "Lift AMC Block A"
  @override
  final String serviceType;
// e.g. "Elevator", "Security", "Plumbing"
  @override
  final DateTime startDate;
  @override
  final DateTime expiryDate;
  @override
  final double monthlyCost;
  @override
  @JsonKey()
  final String currency;
  @override
  final DateTime? lastServiceDate;
  @override
  final DateTime? nextServiceDate;
  @override
  final String? contractDocumentUrl;
  @override
  final String? notes;
  @override
  @JsonKey()
  final String status;
// active, expired, terminated, pending_renewal
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'VendorContractEntity(id: $id, vendorId: $vendorId, title: $title, serviceType: $serviceType, startDate: $startDate, expiryDate: $expiryDate, monthlyCost: $monthlyCost, currency: $currency, lastServiceDate: $lastServiceDate, nextServiceDate: $nextServiceDate, contractDocumentUrl: $contractDocumentUrl, notes: $notes, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorContractEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.monthlyCost, monthlyCost) ||
                other.monthlyCost == monthlyCost) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.lastServiceDate, lastServiceDate) ||
                other.lastServiceDate == lastServiceDate) &&
            (identical(other.nextServiceDate, nextServiceDate) ||
                other.nextServiceDate == nextServiceDate) &&
            (identical(other.contractDocumentUrl, contractDocumentUrl) ||
                other.contractDocumentUrl == contractDocumentUrl) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      vendorId,
      title,
      serviceType,
      startDate,
      expiryDate,
      monthlyCost,
      currency,
      lastServiceDate,
      nextServiceDate,
      contractDocumentUrl,
      notes,
      status,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorContractEntityImplCopyWith<_$VendorContractEntityImpl>
      get copyWith =>
          __$$VendorContractEntityImplCopyWithImpl<_$VendorContractEntityImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorContractEntityImplToJson(
      this,
    );
  }
}

abstract class _VendorContractEntity implements VendorContractEntity {
  const factory _VendorContractEntity(
      {required final String id,
      required final String vendorId,
      required final String title,
      required final String serviceType,
      required final DateTime startDate,
      required final DateTime expiryDate,
      required final double monthlyCost,
      final String currency,
      final DateTime? lastServiceDate,
      final DateTime? nextServiceDate,
      final String? contractDocumentUrl,
      final String? notes,
      final String status,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$VendorContractEntityImpl;

  factory _VendorContractEntity.fromJson(Map<String, dynamic> json) =
      _$VendorContractEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get vendorId;
  @override
  String get title;
  @override // e.g. "Lift AMC Block A"
  String get serviceType;
  @override // e.g. "Elevator", "Security", "Plumbing"
  DateTime get startDate;
  @override
  DateTime get expiryDate;
  @override
  double get monthlyCost;
  @override
  String get currency;
  @override
  DateTime? get lastServiceDate;
  @override
  DateTime? get nextServiceDate;
  @override
  String? get contractDocumentUrl;
  @override
  String? get notes;
  @override
  String get status;
  @override // active, expired, terminated, pending_renewal
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$VendorContractEntityImplCopyWith<_$VendorContractEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VendorBillEntity _$VendorBillEntityFromJson(Map<String, dynamic> json) {
  return _VendorBillEntity.fromJson(json);
}

/// @nodoc
mixin _$VendorBillEntity {
  String get id => throw _privateConstructorUsedError;
  String get vendorId => throw _privateConstructorUsedError;
  String? get contractId => throw _privateConstructorUsedError;
  String get invoiceNumber => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  DateTime get dueDate => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // pending, paid, overdue, cancelled
  DateTime? get paidAt => throw _privateConstructorUsedError;
  String? get paymentMethod => throw _privateConstructorUsedError;
  String? get transactionId => throw _privateConstructorUsedError;
  String? get receiptUrl => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VendorBillEntityCopyWith<VendorBillEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorBillEntityCopyWith<$Res> {
  factory $VendorBillEntityCopyWith(
          VendorBillEntity value, $Res Function(VendorBillEntity) then) =
      _$VendorBillEntityCopyWithImpl<$Res, VendorBillEntity>;
  @useResult
  $Res call(
      {String id,
      String vendorId,
      String? contractId,
      String invoiceNumber,
      double amount,
      String currency,
      DateTime dueDate,
      String status,
      DateTime? paidAt,
      String? paymentMethod,
      String? transactionId,
      String? receiptUrl,
      String? notes,
      DateTime? createdAt});
}

/// @nodoc
class _$VendorBillEntityCopyWithImpl<$Res, $Val extends VendorBillEntity>
    implements $VendorBillEntityCopyWith<$Res> {
  _$VendorBillEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vendorId = null,
    Object? contractId = freezed,
    Object? invoiceNumber = null,
    Object? amount = null,
    Object? currency = null,
    Object? dueDate = null,
    Object? status = null,
    Object? paidAt = freezed,
    Object? paymentMethod = freezed,
    Object? transactionId = freezed,
    Object? receiptUrl = freezed,
    Object? notes = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      vendorId: null == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
      contractId: freezed == contractId
          ? _value.contractId
          : contractId // ignore: cast_nullable_to_non_nullable
              as String?,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptUrl: freezed == receiptUrl
          ? _value.receiptUrl
          : receiptUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VendorBillEntityImplCopyWith<$Res>
    implements $VendorBillEntityCopyWith<$Res> {
  factory _$$VendorBillEntityImplCopyWith(_$VendorBillEntityImpl value,
          $Res Function(_$VendorBillEntityImpl) then) =
      __$$VendorBillEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String vendorId,
      String? contractId,
      String invoiceNumber,
      double amount,
      String currency,
      DateTime dueDate,
      String status,
      DateTime? paidAt,
      String? paymentMethod,
      String? transactionId,
      String? receiptUrl,
      String? notes,
      DateTime? createdAt});
}

/// @nodoc
class __$$VendorBillEntityImplCopyWithImpl<$Res>
    extends _$VendorBillEntityCopyWithImpl<$Res, _$VendorBillEntityImpl>
    implements _$$VendorBillEntityImplCopyWith<$Res> {
  __$$VendorBillEntityImplCopyWithImpl(_$VendorBillEntityImpl _value,
      $Res Function(_$VendorBillEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vendorId = null,
    Object? contractId = freezed,
    Object? invoiceNumber = null,
    Object? amount = null,
    Object? currency = null,
    Object? dueDate = null,
    Object? status = null,
    Object? paidAt = freezed,
    Object? paymentMethod = freezed,
    Object? transactionId = freezed,
    Object? receiptUrl = freezed,
    Object? notes = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$VendorBillEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      vendorId: null == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
      contractId: freezed == contractId
          ? _value.contractId
          : contractId // ignore: cast_nullable_to_non_nullable
              as String?,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptUrl: freezed == receiptUrl
          ? _value.receiptUrl
          : receiptUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorBillEntityImpl implements _VendorBillEntity {
  const _$VendorBillEntityImpl(
      {required this.id,
      required this.vendorId,
      this.contractId,
      required this.invoiceNumber,
      required this.amount,
      this.currency = 'INR',
      required this.dueDate,
      required this.status,
      this.paidAt,
      this.paymentMethod,
      this.transactionId,
      this.receiptUrl,
      this.notes,
      this.createdAt});

  factory _$VendorBillEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorBillEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String vendorId;
  @override
  final String? contractId;
  @override
  final String invoiceNumber;
  @override
  final double amount;
  @override
  @JsonKey()
  final String currency;
  @override
  final DateTime dueDate;
  @override
  final String status;
// pending, paid, overdue, cancelled
  @override
  final DateTime? paidAt;
  @override
  final String? paymentMethod;
  @override
  final String? transactionId;
  @override
  final String? receiptUrl;
  @override
  final String? notes;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'VendorBillEntity(id: $id, vendorId: $vendorId, contractId: $contractId, invoiceNumber: $invoiceNumber, amount: $amount, currency: $currency, dueDate: $dueDate, status: $status, paidAt: $paidAt, paymentMethod: $paymentMethod, transactionId: $transactionId, receiptUrl: $receiptUrl, notes: $notes, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorBillEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.contractId, contractId) ||
                other.contractId == contractId) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.receiptUrl, receiptUrl) ||
                other.receiptUrl == receiptUrl) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      vendorId,
      contractId,
      invoiceNumber,
      amount,
      currency,
      dueDate,
      status,
      paidAt,
      paymentMethod,
      transactionId,
      receiptUrl,
      notes,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorBillEntityImplCopyWith<_$VendorBillEntityImpl> get copyWith =>
      __$$VendorBillEntityImplCopyWithImpl<_$VendorBillEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorBillEntityImplToJson(
      this,
    );
  }
}

abstract class _VendorBillEntity implements VendorBillEntity {
  const factory _VendorBillEntity(
      {required final String id,
      required final String vendorId,
      final String? contractId,
      required final String invoiceNumber,
      required final double amount,
      final String currency,
      required final DateTime dueDate,
      required final String status,
      final DateTime? paidAt,
      final String? paymentMethod,
      final String? transactionId,
      final String? receiptUrl,
      final String? notes,
      final DateTime? createdAt}) = _$VendorBillEntityImpl;

  factory _VendorBillEntity.fromJson(Map<String, dynamic> json) =
      _$VendorBillEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get vendorId;
  @override
  String? get contractId;
  @override
  String get invoiceNumber;
  @override
  double get amount;
  @override
  String get currency;
  @override
  DateTime get dueDate;
  @override
  String get status;
  @override // pending, paid, overdue, cancelled
  DateTime? get paidAt;
  @override
  String? get paymentMethod;
  @override
  String? get transactionId;
  @override
  String? get receiptUrl;
  @override
  String? get notes;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$VendorBillEntityImplCopyWith<_$VendorBillEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VendorPerformanceEntity _$VendorPerformanceEntityFromJson(
    Map<String, dynamic> json) {
  return _VendorPerformanceEntity.fromJson(json);
}

/// @nodoc
mixin _$VendorPerformanceEntity {
  String get id => throw _privateConstructorUsedError;
  String get vendorId => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // review, complaint, service_log
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError; // 1.0 to 5.0
  String? get loggedBy => throw _privateConstructorUsedError;
  String? get loggedByName => throw _privateConstructorUsedError;
  String? get linkedComplaintId => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VendorPerformanceEntityCopyWith<VendorPerformanceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorPerformanceEntityCopyWith<$Res> {
  factory $VendorPerformanceEntityCopyWith(VendorPerformanceEntity value,
          $Res Function(VendorPerformanceEntity) then) =
      _$VendorPerformanceEntityCopyWithImpl<$Res, VendorPerformanceEntity>;
  @useResult
  $Res call(
      {String id,
      String vendorId,
      String type,
      String title,
      String description,
      double? rating,
      String? loggedBy,
      String? loggedByName,
      String? linkedComplaintId,
      DateTime? date,
      DateTime? createdAt});
}

/// @nodoc
class _$VendorPerformanceEntityCopyWithImpl<$Res,
        $Val extends VendorPerformanceEntity>
    implements $VendorPerformanceEntityCopyWith<$Res> {
  _$VendorPerformanceEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vendorId = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? rating = freezed,
    Object? loggedBy = freezed,
    Object? loggedByName = freezed,
    Object? linkedComplaintId = freezed,
    Object? date = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      vendorId: null == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      loggedBy: freezed == loggedBy
          ? _value.loggedBy
          : loggedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      loggedByName: freezed == loggedByName
          ? _value.loggedByName
          : loggedByName // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedComplaintId: freezed == linkedComplaintId
          ? _value.linkedComplaintId
          : linkedComplaintId // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VendorPerformanceEntityImplCopyWith<$Res>
    implements $VendorPerformanceEntityCopyWith<$Res> {
  factory _$$VendorPerformanceEntityImplCopyWith(
          _$VendorPerformanceEntityImpl value,
          $Res Function(_$VendorPerformanceEntityImpl) then) =
      __$$VendorPerformanceEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String vendorId,
      String type,
      String title,
      String description,
      double? rating,
      String? loggedBy,
      String? loggedByName,
      String? linkedComplaintId,
      DateTime? date,
      DateTime? createdAt});
}

/// @nodoc
class __$$VendorPerformanceEntityImplCopyWithImpl<$Res>
    extends _$VendorPerformanceEntityCopyWithImpl<$Res,
        _$VendorPerformanceEntityImpl>
    implements _$$VendorPerformanceEntityImplCopyWith<$Res> {
  __$$VendorPerformanceEntityImplCopyWithImpl(
      _$VendorPerformanceEntityImpl _value,
      $Res Function(_$VendorPerformanceEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vendorId = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? rating = freezed,
    Object? loggedBy = freezed,
    Object? loggedByName = freezed,
    Object? linkedComplaintId = freezed,
    Object? date = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$VendorPerformanceEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      vendorId: null == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      loggedBy: freezed == loggedBy
          ? _value.loggedBy
          : loggedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      loggedByName: freezed == loggedByName
          ? _value.loggedByName
          : loggedByName // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedComplaintId: freezed == linkedComplaintId
          ? _value.linkedComplaintId
          : linkedComplaintId // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorPerformanceEntityImpl implements _VendorPerformanceEntity {
  const _$VendorPerformanceEntityImpl(
      {required this.id,
      required this.vendorId,
      required this.type,
      required this.title,
      required this.description,
      this.rating,
      this.loggedBy,
      this.loggedByName,
      this.linkedComplaintId,
      this.date,
      this.createdAt});

  factory _$VendorPerformanceEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorPerformanceEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String vendorId;
  @override
  final String type;
// review, complaint, service_log
  @override
  final String title;
  @override
  final String description;
  @override
  final double? rating;
// 1.0 to 5.0
  @override
  final String? loggedBy;
  @override
  final String? loggedByName;
  @override
  final String? linkedComplaintId;
  @override
  final DateTime? date;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'VendorPerformanceEntity(id: $id, vendorId: $vendorId, type: $type, title: $title, description: $description, rating: $rating, loggedBy: $loggedBy, loggedByName: $loggedByName, linkedComplaintId: $linkedComplaintId, date: $date, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorPerformanceEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.loggedBy, loggedBy) ||
                other.loggedBy == loggedBy) &&
            (identical(other.loggedByName, loggedByName) ||
                other.loggedByName == loggedByName) &&
            (identical(other.linkedComplaintId, linkedComplaintId) ||
                other.linkedComplaintId == linkedComplaintId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      vendorId,
      type,
      title,
      description,
      rating,
      loggedBy,
      loggedByName,
      linkedComplaintId,
      date,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorPerformanceEntityImplCopyWith<_$VendorPerformanceEntityImpl>
      get copyWith => __$$VendorPerformanceEntityImplCopyWithImpl<
          _$VendorPerformanceEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorPerformanceEntityImplToJson(
      this,
    );
  }
}

abstract class _VendorPerformanceEntity implements VendorPerformanceEntity {
  const factory _VendorPerformanceEntity(
      {required final String id,
      required final String vendorId,
      required final String type,
      required final String title,
      required final String description,
      final double? rating,
      final String? loggedBy,
      final String? loggedByName,
      final String? linkedComplaintId,
      final DateTime? date,
      final DateTime? createdAt}) = _$VendorPerformanceEntityImpl;

  factory _VendorPerformanceEntity.fromJson(Map<String, dynamic> json) =
      _$VendorPerformanceEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get vendorId;
  @override
  String get type;
  @override // review, complaint, service_log
  String get title;
  @override
  String get description;
  @override
  double? get rating;
  @override // 1.0 to 5.0
  String? get loggedBy;
  @override
  String? get loggedByName;
  @override
  String? get linkedComplaintId;
  @override
  DateTime? get date;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$VendorPerformanceEntityImplCopyWith<_$VendorPerformanceEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VendorEntity _$VendorEntityFromJson(Map<String, dynamic> json) {
  return _VendorEntity.fromJson(json);
}

/// @nodoc
mixin _$VendorEntity {
  String get id => throw _privateConstructorUsedError;
  String get societyId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError; // e.g. "XYZ Elevators"
  String get category =>
      throw _privateConstructorUsedError; // e.g. Elevator, Electrical, Plumbing, Security, Cleaning, Landscaping, General
  String get contactPerson => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get gstNumber => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // active, inactive, blacklisted
  List<VendorContractEntity> get contracts =>
      throw _privateConstructorUsedError;
  List<VendorBillEntity> get bills => throw _privateConstructorUsedError;
  List<VendorPerformanceEntity> get performanceLogs =>
      throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VendorEntityCopyWith<VendorEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorEntityCopyWith<$Res> {
  factory $VendorEntityCopyWith(
          VendorEntity value, $Res Function(VendorEntity) then) =
      _$VendorEntityCopyWithImpl<$Res, VendorEntity>;
  @useResult
  $Res call(
      {String id,
      String societyId,
      String name,
      String category,
      String contactPerson,
      String phone,
      String? email,
      String? address,
      String? gstNumber,
      double rating,
      String status,
      List<VendorContractEntity> contracts,
      List<VendorBillEntity> bills,
      List<VendorPerformanceEntity> performanceLogs,
      Map<String, dynamic>? metadata,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$VendorEntityCopyWithImpl<$Res, $Val extends VendorEntity>
    implements $VendorEntityCopyWith<$Res> {
  _$VendorEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? name = null,
    Object? category = null,
    Object? contactPerson = null,
    Object? phone = null,
    Object? email = freezed,
    Object? address = freezed,
    Object? gstNumber = freezed,
    Object? rating = null,
    Object? status = null,
    Object? contracts = null,
    Object? bills = null,
    Object? performanceLogs = null,
    Object? metadata = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      contactPerson: null == contactPerson
          ? _value.contactPerson
          : contactPerson // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      gstNumber: freezed == gstNumber
          ? _value.gstNumber
          : gstNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      contracts: null == contracts
          ? _value.contracts
          : contracts // ignore: cast_nullable_to_non_nullable
              as List<VendorContractEntity>,
      bills: null == bills
          ? _value.bills
          : bills // ignore: cast_nullable_to_non_nullable
              as List<VendorBillEntity>,
      performanceLogs: null == performanceLogs
          ? _value.performanceLogs
          : performanceLogs // ignore: cast_nullable_to_non_nullable
              as List<VendorPerformanceEntity>,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VendorEntityImplCopyWith<$Res>
    implements $VendorEntityCopyWith<$Res> {
  factory _$$VendorEntityImplCopyWith(
          _$VendorEntityImpl value, $Res Function(_$VendorEntityImpl) then) =
      __$$VendorEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String societyId,
      String name,
      String category,
      String contactPerson,
      String phone,
      String? email,
      String? address,
      String? gstNumber,
      double rating,
      String status,
      List<VendorContractEntity> contracts,
      List<VendorBillEntity> bills,
      List<VendorPerformanceEntity> performanceLogs,
      Map<String, dynamic>? metadata,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$VendorEntityImplCopyWithImpl<$Res>
    extends _$VendorEntityCopyWithImpl<$Res, _$VendorEntityImpl>
    implements _$$VendorEntityImplCopyWith<$Res> {
  __$$VendorEntityImplCopyWithImpl(
      _$VendorEntityImpl _value, $Res Function(_$VendorEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? name = null,
    Object? category = null,
    Object? contactPerson = null,
    Object? phone = null,
    Object? email = freezed,
    Object? address = freezed,
    Object? gstNumber = freezed,
    Object? rating = null,
    Object? status = null,
    Object? contracts = null,
    Object? bills = null,
    Object? performanceLogs = null,
    Object? metadata = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$VendorEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      societyId: null == societyId
          ? _value.societyId
          : societyId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      contactPerson: null == contactPerson
          ? _value.contactPerson
          : contactPerson // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      gstNumber: freezed == gstNumber
          ? _value.gstNumber
          : gstNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      contracts: null == contracts
          ? _value._contracts
          : contracts // ignore: cast_nullable_to_non_nullable
              as List<VendorContractEntity>,
      bills: null == bills
          ? _value._bills
          : bills // ignore: cast_nullable_to_non_nullable
              as List<VendorBillEntity>,
      performanceLogs: null == performanceLogs
          ? _value._performanceLogs
          : performanceLogs // ignore: cast_nullable_to_non_nullable
              as List<VendorPerformanceEntity>,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$VendorEntityImpl implements _VendorEntity {
  const _$VendorEntityImpl(
      {required this.id,
      required this.societyId,
      required this.name,
      required this.category,
      required this.contactPerson,
      required this.phone,
      this.email,
      this.address,
      this.gstNumber,
      this.rating = 5.0,
      this.status = 'active',
      final List<VendorContractEntity> contracts = const [],
      final List<VendorBillEntity> bills = const [],
      final List<VendorPerformanceEntity> performanceLogs = const [],
      final Map<String, dynamic>? metadata,
      this.createdAt,
      this.updatedAt})
      : _contracts = contracts,
        _bills = bills,
        _performanceLogs = performanceLogs,
        _metadata = metadata;

  factory _$VendorEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String societyId;
  @override
  final String name;
// e.g. "XYZ Elevators"
  @override
  final String category;
// e.g. Elevator, Electrical, Plumbing, Security, Cleaning, Landscaping, General
  @override
  final String contactPerson;
  @override
  final String phone;
  @override
  final String? email;
  @override
  final String? address;
  @override
  final String? gstNumber;
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final String status;
// active, inactive, blacklisted
  final List<VendorContractEntity> _contracts;
// active, inactive, blacklisted
  @override
  @JsonKey()
  List<VendorContractEntity> get contracts {
    if (_contracts is EqualUnmodifiableListView) return _contracts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contracts);
  }

  final List<VendorBillEntity> _bills;
  @override
  @JsonKey()
  List<VendorBillEntity> get bills {
    if (_bills is EqualUnmodifiableListView) return _bills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bills);
  }

  final List<VendorPerformanceEntity> _performanceLogs;
  @override
  @JsonKey()
  List<VendorPerformanceEntity> get performanceLogs {
    if (_performanceLogs is EqualUnmodifiableListView) return _performanceLogs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_performanceLogs);
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
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'VendorEntity(id: $id, societyId: $societyId, name: $name, category: $category, contactPerson: $contactPerson, phone: $phone, email: $email, address: $address, gstNumber: $gstNumber, rating: $rating, status: $status, contracts: $contracts, bills: $bills, performanceLogs: $performanceLogs, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.societyId, societyId) ||
                other.societyId == societyId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.contactPerson, contactPerson) ||
                other.contactPerson == contactPerson) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.gstNumber, gstNumber) ||
                other.gstNumber == gstNumber) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._contracts, _contracts) &&
            const DeepCollectionEquality().equals(other._bills, _bills) &&
            const DeepCollectionEquality()
                .equals(other._performanceLogs, _performanceLogs) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      societyId,
      name,
      category,
      contactPerson,
      phone,
      email,
      address,
      gstNumber,
      rating,
      status,
      const DeepCollectionEquality().hash(_contracts),
      const DeepCollectionEquality().hash(_bills),
      const DeepCollectionEquality().hash(_performanceLogs),
      const DeepCollectionEquality().hash(_metadata),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorEntityImplCopyWith<_$VendorEntityImpl> get copyWith =>
      __$$VendorEntityImplCopyWithImpl<_$VendorEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorEntityImplToJson(
      this,
    );
  }
}

abstract class _VendorEntity implements VendorEntity {
  const factory _VendorEntity(
      {required final String id,
      required final String societyId,
      required final String name,
      required final String category,
      required final String contactPerson,
      required final String phone,
      final String? email,
      final String? address,
      final String? gstNumber,
      final double rating,
      final String status,
      final List<VendorContractEntity> contracts,
      final List<VendorBillEntity> bills,
      final List<VendorPerformanceEntity> performanceLogs,
      final Map<String, dynamic>? metadata,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$VendorEntityImpl;

  factory _VendorEntity.fromJson(Map<String, dynamic> json) =
      _$VendorEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get societyId;
  @override
  String get name;
  @override // e.g. "XYZ Elevators"
  String get category;
  @override // e.g. Elevator, Electrical, Plumbing, Security, Cleaning, Landscaping, General
  String get contactPerson;
  @override
  String get phone;
  @override
  String? get email;
  @override
  String? get address;
  @override
  String? get gstNumber;
  @override
  double get rating;
  @override
  String get status;
  @override // active, inactive, blacklisted
  List<VendorContractEntity> get contracts;
  @override
  List<VendorBillEntity> get bills;
  @override
  List<VendorPerformanceEntity> get performanceLogs;
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$VendorEntityImplCopyWith<_$VendorEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
