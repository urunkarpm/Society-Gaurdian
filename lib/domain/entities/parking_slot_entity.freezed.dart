// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parking_slot_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ParkingSlotEntity _$ParkingSlotEntityFromJson(Map<String, dynamic> json) {
  return _ParkingSlotEntity.fromJson(json);
}

/// @nodoc
mixin _$ParkingSlotEntity {
  String get id => throw _privateConstructorUsedError;
  String get societyId => throw _privateConstructorUsedError;
  String get slotNumber =>
      throw _privateConstructorUsedError; // e.g. B2-147 or V-32
  ParkingType get type => throw _privateConstructorUsedError;
  ParkingCategory get category => throw _privateConstructorUsedError;
  String get floorZone =>
      throw _privateConstructorUsedError; // e.g., B1, B2, Ground, Gate 1
  bool get isOccupied => throw _privateConstructorUsedError;
  String? get assignedFlatNumber =>
      throw _privateConstructorUsedError; // for resident slots (e.g. B-1204)
  String? get currentVehicleNumber =>
      throw _privateConstructorUsedError; // e.g. MH 01 AB 1234
  String? get currentVisitorId =>
      throw _privateConstructorUsedError; // link to visitor doc if occupied by visitor
  String? get currentVisitorName => throw _privateConstructorUsedError;
  String? get currentVisitorFlatNumber => throw _privateConstructorUsedError;
  DateTime? get occupiedAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParkingSlotEntityCopyWith<ParkingSlotEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParkingSlotEntityCopyWith<$Res> {
  factory $ParkingSlotEntityCopyWith(
          ParkingSlotEntity value, $Res Function(ParkingSlotEntity) then) =
      _$ParkingSlotEntityCopyWithImpl<$Res, ParkingSlotEntity>;
  @useResult
  $Res call(
      {String id,
      String societyId,
      String slotNumber,
      ParkingType type,
      ParkingCategory category,
      String floorZone,
      bool isOccupied,
      String? assignedFlatNumber,
      String? currentVehicleNumber,
      String? currentVisitorId,
      String? currentVisitorName,
      String? currentVisitorFlatNumber,
      DateTime? occupiedAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$ParkingSlotEntityCopyWithImpl<$Res, $Val extends ParkingSlotEntity>
    implements $ParkingSlotEntityCopyWith<$Res> {
  _$ParkingSlotEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? slotNumber = null,
    Object? type = null,
    Object? category = null,
    Object? floorZone = null,
    Object? isOccupied = null,
    Object? assignedFlatNumber = freezed,
    Object? currentVehicleNumber = freezed,
    Object? currentVisitorId = freezed,
    Object? currentVisitorName = freezed,
    Object? currentVisitorFlatNumber = freezed,
    Object? occupiedAt = freezed,
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
      slotNumber: null == slotNumber
          ? _value.slotNumber
          : slotNumber // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ParkingType,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ParkingCategory,
      floorZone: null == floorZone
          ? _value.floorZone
          : floorZone // ignore: cast_nullable_to_non_nullable
              as String,
      isOccupied: null == isOccupied
          ? _value.isOccupied
          : isOccupied // ignore: cast_nullable_to_non_nullable
              as bool,
      assignedFlatNumber: freezed == assignedFlatNumber
          ? _value.assignedFlatNumber
          : assignedFlatNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      currentVehicleNumber: freezed == currentVehicleNumber
          ? _value.currentVehicleNumber
          : currentVehicleNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      currentVisitorId: freezed == currentVisitorId
          ? _value.currentVisitorId
          : currentVisitorId // ignore: cast_nullable_to_non_nullable
              as String?,
      currentVisitorName: freezed == currentVisitorName
          ? _value.currentVisitorName
          : currentVisitorName // ignore: cast_nullable_to_non_nullable
              as String?,
      currentVisitorFlatNumber: freezed == currentVisitorFlatNumber
          ? _value.currentVisitorFlatNumber
          : currentVisitorFlatNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      occupiedAt: freezed == occupiedAt
          ? _value.occupiedAt
          : occupiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParkingSlotEntityImplCopyWith<$Res>
    implements $ParkingSlotEntityCopyWith<$Res> {
  factory _$$ParkingSlotEntityImplCopyWith(_$ParkingSlotEntityImpl value,
          $Res Function(_$ParkingSlotEntityImpl) then) =
      __$$ParkingSlotEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String societyId,
      String slotNumber,
      ParkingType type,
      ParkingCategory category,
      String floorZone,
      bool isOccupied,
      String? assignedFlatNumber,
      String? currentVehicleNumber,
      String? currentVisitorId,
      String? currentVisitorName,
      String? currentVisitorFlatNumber,
      DateTime? occupiedAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$ParkingSlotEntityImplCopyWithImpl<$Res>
    extends _$ParkingSlotEntityCopyWithImpl<$Res, _$ParkingSlotEntityImpl>
    implements _$$ParkingSlotEntityImplCopyWith<$Res> {
  __$$ParkingSlotEntityImplCopyWithImpl(_$ParkingSlotEntityImpl _value,
      $Res Function(_$ParkingSlotEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? slotNumber = null,
    Object? type = null,
    Object? category = null,
    Object? floorZone = null,
    Object? isOccupied = null,
    Object? assignedFlatNumber = freezed,
    Object? currentVehicleNumber = freezed,
    Object? currentVisitorId = freezed,
    Object? currentVisitorName = freezed,
    Object? currentVisitorFlatNumber = freezed,
    Object? occupiedAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ParkingSlotEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      societyId: null == societyId
          ? _value.societyId
          : societyId // ignore: cast_nullable_to_non_nullable
              as String,
      slotNumber: null == slotNumber
          ? _value.slotNumber
          : slotNumber // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ParkingType,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ParkingCategory,
      floorZone: null == floorZone
          ? _value.floorZone
          : floorZone // ignore: cast_nullable_to_non_nullable
              as String,
      isOccupied: null == isOccupied
          ? _value.isOccupied
          : isOccupied // ignore: cast_nullable_to_non_nullable
              as bool,
      assignedFlatNumber: freezed == assignedFlatNumber
          ? _value.assignedFlatNumber
          : assignedFlatNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      currentVehicleNumber: freezed == currentVehicleNumber
          ? _value.currentVehicleNumber
          : currentVehicleNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      currentVisitorId: freezed == currentVisitorId
          ? _value.currentVisitorId
          : currentVisitorId // ignore: cast_nullable_to_non_nullable
              as String?,
      currentVisitorName: freezed == currentVisitorName
          ? _value.currentVisitorName
          : currentVisitorName // ignore: cast_nullable_to_non_nullable
              as String?,
      currentVisitorFlatNumber: freezed == currentVisitorFlatNumber
          ? _value.currentVisitorFlatNumber
          : currentVisitorFlatNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      occupiedAt: freezed == occupiedAt
          ? _value.occupiedAt
          : occupiedAt // ignore: cast_nullable_to_non_nullable
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
class _$ParkingSlotEntityImpl implements _ParkingSlotEntity {
  const _$ParkingSlotEntityImpl(
      {required this.id,
      required this.societyId,
      required this.slotNumber,
      this.type = ParkingType.visitor,
      this.category = ParkingCategory.standard,
      this.floorZone = 'Ground',
      this.isOccupied = false,
      this.assignedFlatNumber,
      this.currentVehicleNumber,
      this.currentVisitorId,
      this.currentVisitorName,
      this.currentVisitorFlatNumber,
      this.occupiedAt,
      this.updatedAt});

  factory _$ParkingSlotEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParkingSlotEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String societyId;
  @override
  final String slotNumber;
// e.g. B2-147 or V-32
  @override
  @JsonKey()
  final ParkingType type;
  @override
  @JsonKey()
  final ParkingCategory category;
  @override
  @JsonKey()
  final String floorZone;
// e.g., B1, B2, Ground, Gate 1
  @override
  @JsonKey()
  final bool isOccupied;
  @override
  final String? assignedFlatNumber;
// for resident slots (e.g. B-1204)
  @override
  final String? currentVehicleNumber;
// e.g. MH 01 AB 1234
  @override
  final String? currentVisitorId;
// link to visitor doc if occupied by visitor
  @override
  final String? currentVisitorName;
  @override
  final String? currentVisitorFlatNumber;
  @override
  final DateTime? occupiedAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ParkingSlotEntity(id: $id, societyId: $societyId, slotNumber: $slotNumber, type: $type, category: $category, floorZone: $floorZone, isOccupied: $isOccupied, assignedFlatNumber: $assignedFlatNumber, currentVehicleNumber: $currentVehicleNumber, currentVisitorId: $currentVisitorId, currentVisitorName: $currentVisitorName, currentVisitorFlatNumber: $currentVisitorFlatNumber, occupiedAt: $occupiedAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParkingSlotEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.societyId, societyId) ||
                other.societyId == societyId) &&
            (identical(other.slotNumber, slotNumber) ||
                other.slotNumber == slotNumber) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.floorZone, floorZone) ||
                other.floorZone == floorZone) &&
            (identical(other.isOccupied, isOccupied) ||
                other.isOccupied == isOccupied) &&
            (identical(other.assignedFlatNumber, assignedFlatNumber) ||
                other.assignedFlatNumber == assignedFlatNumber) &&
            (identical(other.currentVehicleNumber, currentVehicleNumber) ||
                other.currentVehicleNumber == currentVehicleNumber) &&
            (identical(other.currentVisitorId, currentVisitorId) ||
                other.currentVisitorId == currentVisitorId) &&
            (identical(other.currentVisitorName, currentVisitorName) ||
                other.currentVisitorName == currentVisitorName) &&
            (identical(
                    other.currentVisitorFlatNumber, currentVisitorFlatNumber) ||
                other.currentVisitorFlatNumber == currentVisitorFlatNumber) &&
            (identical(other.occupiedAt, occupiedAt) ||
                other.occupiedAt == occupiedAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      societyId,
      slotNumber,
      type,
      category,
      floorZone,
      isOccupied,
      assignedFlatNumber,
      currentVehicleNumber,
      currentVisitorId,
      currentVisitorName,
      currentVisitorFlatNumber,
      occupiedAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParkingSlotEntityImplCopyWith<_$ParkingSlotEntityImpl> get copyWith =>
      __$$ParkingSlotEntityImplCopyWithImpl<_$ParkingSlotEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParkingSlotEntityImplToJson(
      this,
    );
  }
}

abstract class _ParkingSlotEntity implements ParkingSlotEntity {
  const factory _ParkingSlotEntity(
      {required final String id,
      required final String societyId,
      required final String slotNumber,
      final ParkingType type,
      final ParkingCategory category,
      final String floorZone,
      final bool isOccupied,
      final String? assignedFlatNumber,
      final String? currentVehicleNumber,
      final String? currentVisitorId,
      final String? currentVisitorName,
      final String? currentVisitorFlatNumber,
      final DateTime? occupiedAt,
      final DateTime? updatedAt}) = _$ParkingSlotEntityImpl;

  factory _ParkingSlotEntity.fromJson(Map<String, dynamic> json) =
      _$ParkingSlotEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get societyId;
  @override
  String get slotNumber;
  @override // e.g. B2-147 or V-32
  ParkingType get type;
  @override
  ParkingCategory get category;
  @override
  String get floorZone;
  @override // e.g., B1, B2, Ground, Gate 1
  bool get isOccupied;
  @override
  String? get assignedFlatNumber;
  @override // for resident slots (e.g. B-1204)
  String? get currentVehicleNumber;
  @override // e.g. MH 01 AB 1234
  String? get currentVisitorId;
  @override // link to visitor doc if occupied by visitor
  String? get currentVisitorName;
  @override
  String? get currentVisitorFlatNumber;
  @override
  DateTime? get occupiedAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ParkingSlotEntityImplCopyWith<_$ParkingSlotEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VehicleRegistrationEntity _$VehicleRegistrationEntityFromJson(
    Map<String, dynamic> json) {
  return _VehicleRegistrationEntity.fromJson(json);
}

/// @nodoc
mixin _$VehicleRegistrationEntity {
  String get id => throw _privateConstructorUsedError;
  String get societyId => throw _privateConstructorUsedError;
  String get flatNumber => throw _privateConstructorUsedError;
  String get vehicleNumber =>
      throw _privateConstructorUsedError; // e.g. MH 01 XX 1234
  String get ownerName => throw _privateConstructorUsedError;
  String get vehicleType =>
      throw _privateConstructorUsedError; // 2 Wheeler, 4 Wheeler, EV
  String? get slotNumber =>
      throw _privateConstructorUsedError; // assigned resident parking spot, e.g., B2-147
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleRegistrationEntityCopyWith<VehicleRegistrationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleRegistrationEntityCopyWith<$Res> {
  factory $VehicleRegistrationEntityCopyWith(VehicleRegistrationEntity value,
          $Res Function(VehicleRegistrationEntity) then) =
      _$VehicleRegistrationEntityCopyWithImpl<$Res, VehicleRegistrationEntity>;
  @useResult
  $Res call(
      {String id,
      String societyId,
      String flatNumber,
      String vehicleNumber,
      String ownerName,
      String vehicleType,
      String? slotNumber,
      DateTime? createdAt});
}

/// @nodoc
class _$VehicleRegistrationEntityCopyWithImpl<$Res,
        $Val extends VehicleRegistrationEntity>
    implements $VehicleRegistrationEntityCopyWith<$Res> {
  _$VehicleRegistrationEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? flatNumber = null,
    Object? vehicleNumber = null,
    Object? ownerName = null,
    Object? vehicleType = null,
    Object? slotNumber = freezed,
    Object? createdAt = freezed,
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
      flatNumber: null == flatNumber
          ? _value.flatNumber
          : flatNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleNumber: null == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String,
      ownerName: null == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      slotNumber: freezed == slotNumber
          ? _value.slotNumber
          : slotNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehicleRegistrationEntityImplCopyWith<$Res>
    implements $VehicleRegistrationEntityCopyWith<$Res> {
  factory _$$VehicleRegistrationEntityImplCopyWith(
          _$VehicleRegistrationEntityImpl value,
          $Res Function(_$VehicleRegistrationEntityImpl) then) =
      __$$VehicleRegistrationEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String societyId,
      String flatNumber,
      String vehicleNumber,
      String ownerName,
      String vehicleType,
      String? slotNumber,
      DateTime? createdAt});
}

/// @nodoc
class __$$VehicleRegistrationEntityImplCopyWithImpl<$Res>
    extends _$VehicleRegistrationEntityCopyWithImpl<$Res,
        _$VehicleRegistrationEntityImpl>
    implements _$$VehicleRegistrationEntityImplCopyWith<$Res> {
  __$$VehicleRegistrationEntityImplCopyWithImpl(
      _$VehicleRegistrationEntityImpl _value,
      $Res Function(_$VehicleRegistrationEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? flatNumber = null,
    Object? vehicleNumber = null,
    Object? ownerName = null,
    Object? vehicleType = null,
    Object? slotNumber = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$VehicleRegistrationEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      societyId: null == societyId
          ? _value.societyId
          : societyId // ignore: cast_nullable_to_non_nullable
              as String,
      flatNumber: null == flatNumber
          ? _value.flatNumber
          : flatNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleNumber: null == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String,
      ownerName: null == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      slotNumber: freezed == slotNumber
          ? _value.slotNumber
          : slotNumber // ignore: cast_nullable_to_non_nullable
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
class _$VehicleRegistrationEntityImpl implements _VehicleRegistrationEntity {
  const _$VehicleRegistrationEntityImpl(
      {required this.id,
      required this.societyId,
      required this.flatNumber,
      required this.vehicleNumber,
      required this.ownerName,
      this.vehicleType = '4 Wheeler',
      this.slotNumber,
      this.createdAt});

  factory _$VehicleRegistrationEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleRegistrationEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String societyId;
  @override
  final String flatNumber;
  @override
  final String vehicleNumber;
// e.g. MH 01 XX 1234
  @override
  final String ownerName;
  @override
  @JsonKey()
  final String vehicleType;
// 2 Wheeler, 4 Wheeler, EV
  @override
  final String? slotNumber;
// assigned resident parking spot, e.g., B2-147
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'VehicleRegistrationEntity(id: $id, societyId: $societyId, flatNumber: $flatNumber, vehicleNumber: $vehicleNumber, ownerName: $ownerName, vehicleType: $vehicleType, slotNumber: $slotNumber, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleRegistrationEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.societyId, societyId) ||
                other.societyId == societyId) &&
            (identical(other.flatNumber, flatNumber) ||
                other.flatNumber == flatNumber) &&
            (identical(other.vehicleNumber, vehicleNumber) ||
                other.vehicleNumber == vehicleNumber) &&
            (identical(other.ownerName, ownerName) ||
                other.ownerName == ownerName) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            (identical(other.slotNumber, slotNumber) ||
                other.slotNumber == slotNumber) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, societyId, flatNumber,
      vehicleNumber, ownerName, vehicleType, slotNumber, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleRegistrationEntityImplCopyWith<_$VehicleRegistrationEntityImpl>
      get copyWith => __$$VehicleRegistrationEntityImplCopyWithImpl<
          _$VehicleRegistrationEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleRegistrationEntityImplToJson(
      this,
    );
  }
}

abstract class _VehicleRegistrationEntity implements VehicleRegistrationEntity {
  const factory _VehicleRegistrationEntity(
      {required final String id,
      required final String societyId,
      required final String flatNumber,
      required final String vehicleNumber,
      required final String ownerName,
      final String vehicleType,
      final String? slotNumber,
      final DateTime? createdAt}) = _$VehicleRegistrationEntityImpl;

  factory _VehicleRegistrationEntity.fromJson(Map<String, dynamic> json) =
      _$VehicleRegistrationEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get societyId;
  @override
  String get flatNumber;
  @override
  String get vehicleNumber;
  @override // e.g. MH 01 XX 1234
  String get ownerName;
  @override
  String get vehicleType;
  @override // 2 Wheeler, 4 Wheeler, EV
  String? get slotNumber;
  @override // assigned resident parking spot, e.g., B2-147
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$VehicleRegistrationEntityImplCopyWith<_$VehicleRegistrationEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
