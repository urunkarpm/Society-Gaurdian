// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flat_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FlatEntity _$FlatEntityFromJson(Map<String, dynamic> json) {
  return _FlatEntity.fromJson(json);
}

/// @nodoc
mixin _$FlatEntity {
  String get id => throw _privateConstructorUsedError;
  String get societyId => throw _privateConstructorUsedError;
  String get buildingNumber => throw _privateConstructorUsedError;
  String get flatNumber => throw _privateConstructorUsedError;
  String? get floor => throw _privateConstructorUsedError;
  String? get wing => throw _privateConstructorUsedError;
  int? get bedrooms => throw _privateConstructorUsedError;
  int? get bathrooms => throw _privateConstructorUsedError;
  double? get area => throw _privateConstructorUsedError;
  String? get areaUnit => throw _privateConstructorUsedError; // sqft, sqm
  bool get isOccupied => throw _privateConstructorUsedError;
  DateTime? get occupiedSince => throw _privateConstructorUsedError;
  List<String>? get residentUids => throw _privateConstructorUsedError;
  String? get primaryContactUid => throw _privateConstructorUsedError;
  List<String>? get fcmTokens => throw _privateConstructorUsedError;
  Map<String, dynamic>? get amenities => throw _privateConstructorUsedError;
  bool? get hasParking => throw _privateConstructorUsedError;
  String? get parkingSlotNumber => throw _privateConstructorUsedError;
  int? get parkingSlots => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlatEntityCopyWith<FlatEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlatEntityCopyWith<$Res> {
  factory $FlatEntityCopyWith(
          FlatEntity value, $Res Function(FlatEntity) then) =
      _$FlatEntityCopyWithImpl<$Res, FlatEntity>;
  @useResult
  $Res call(
      {String id,
      String societyId,
      String buildingNumber,
      String flatNumber,
      String? floor,
      String? wing,
      int? bedrooms,
      int? bathrooms,
      double? area,
      String? areaUnit,
      bool isOccupied,
      DateTime? occupiedSince,
      List<String>? residentUids,
      String? primaryContactUid,
      List<String>? fcmTokens,
      Map<String, dynamic>? amenities,
      bool? hasParking,
      String? parkingSlotNumber,
      int? parkingSlots,
      Map<String, dynamic>? metadata,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$FlatEntityCopyWithImpl<$Res, $Val extends FlatEntity>
    implements $FlatEntityCopyWith<$Res> {
  _$FlatEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? buildingNumber = null,
    Object? flatNumber = null,
    Object? floor = freezed,
    Object? wing = freezed,
    Object? bedrooms = freezed,
    Object? bathrooms = freezed,
    Object? area = freezed,
    Object? areaUnit = freezed,
    Object? isOccupied = null,
    Object? occupiedSince = freezed,
    Object? residentUids = freezed,
    Object? primaryContactUid = freezed,
    Object? fcmTokens = freezed,
    Object? amenities = freezed,
    Object? hasParking = freezed,
    Object? parkingSlotNumber = freezed,
    Object? parkingSlots = freezed,
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
      buildingNumber: null == buildingNumber
          ? _value.buildingNumber
          : buildingNumber // ignore: cast_nullable_to_non_nullable
              as String,
      flatNumber: null == flatNumber
          ? _value.flatNumber
          : flatNumber // ignore: cast_nullable_to_non_nullable
              as String,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String?,
      wing: freezed == wing
          ? _value.wing
          : wing // ignore: cast_nullable_to_non_nullable
              as String?,
      bedrooms: freezed == bedrooms
          ? _value.bedrooms
          : bedrooms // ignore: cast_nullable_to_non_nullable
              as int?,
      bathrooms: freezed == bathrooms
          ? _value.bathrooms
          : bathrooms // ignore: cast_nullable_to_non_nullable
              as int?,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as double?,
      areaUnit: freezed == areaUnit
          ? _value.areaUnit
          : areaUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      isOccupied: null == isOccupied
          ? _value.isOccupied
          : isOccupied // ignore: cast_nullable_to_non_nullable
              as bool,
      occupiedSince: freezed == occupiedSince
          ? _value.occupiedSince
          : occupiedSince // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      residentUids: freezed == residentUids
          ? _value.residentUids
          : residentUids // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      primaryContactUid: freezed == primaryContactUid
          ? _value.primaryContactUid
          : primaryContactUid // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmTokens: freezed == fcmTokens
          ? _value.fcmTokens
          : fcmTokens // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      amenities: freezed == amenities
          ? _value.amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      hasParking: freezed == hasParking
          ? _value.hasParking
          : hasParking // ignore: cast_nullable_to_non_nullable
              as bool?,
      parkingSlotNumber: freezed == parkingSlotNumber
          ? _value.parkingSlotNumber
          : parkingSlotNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      parkingSlots: freezed == parkingSlots
          ? _value.parkingSlots
          : parkingSlots // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$FlatEntityImplCopyWith<$Res>
    implements $FlatEntityCopyWith<$Res> {
  factory _$$FlatEntityImplCopyWith(
          _$FlatEntityImpl value, $Res Function(_$FlatEntityImpl) then) =
      __$$FlatEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String societyId,
      String buildingNumber,
      String flatNumber,
      String? floor,
      String? wing,
      int? bedrooms,
      int? bathrooms,
      double? area,
      String? areaUnit,
      bool isOccupied,
      DateTime? occupiedSince,
      List<String>? residentUids,
      String? primaryContactUid,
      List<String>? fcmTokens,
      Map<String, dynamic>? amenities,
      bool? hasParking,
      String? parkingSlotNumber,
      int? parkingSlots,
      Map<String, dynamic>? metadata,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$FlatEntityImplCopyWithImpl<$Res>
    extends _$FlatEntityCopyWithImpl<$Res, _$FlatEntityImpl>
    implements _$$FlatEntityImplCopyWith<$Res> {
  __$$FlatEntityImplCopyWithImpl(
      _$FlatEntityImpl _value, $Res Function(_$FlatEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? buildingNumber = null,
    Object? flatNumber = null,
    Object? floor = freezed,
    Object? wing = freezed,
    Object? bedrooms = freezed,
    Object? bathrooms = freezed,
    Object? area = freezed,
    Object? areaUnit = freezed,
    Object? isOccupied = null,
    Object? occupiedSince = freezed,
    Object? residentUids = freezed,
    Object? primaryContactUid = freezed,
    Object? fcmTokens = freezed,
    Object? amenities = freezed,
    Object? hasParking = freezed,
    Object? parkingSlotNumber = freezed,
    Object? parkingSlots = freezed,
    Object? metadata = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$FlatEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      societyId: null == societyId
          ? _value.societyId
          : societyId // ignore: cast_nullable_to_non_nullable
              as String,
      buildingNumber: null == buildingNumber
          ? _value.buildingNumber
          : buildingNumber // ignore: cast_nullable_to_non_nullable
              as String,
      flatNumber: null == flatNumber
          ? _value.flatNumber
          : flatNumber // ignore: cast_nullable_to_non_nullable
              as String,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String?,
      wing: freezed == wing
          ? _value.wing
          : wing // ignore: cast_nullable_to_non_nullable
              as String?,
      bedrooms: freezed == bedrooms
          ? _value.bedrooms
          : bedrooms // ignore: cast_nullable_to_non_nullable
              as int?,
      bathrooms: freezed == bathrooms
          ? _value.bathrooms
          : bathrooms // ignore: cast_nullable_to_non_nullable
              as int?,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as double?,
      areaUnit: freezed == areaUnit
          ? _value.areaUnit
          : areaUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      isOccupied: null == isOccupied
          ? _value.isOccupied
          : isOccupied // ignore: cast_nullable_to_non_nullable
              as bool,
      occupiedSince: freezed == occupiedSince
          ? _value.occupiedSince
          : occupiedSince // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      residentUids: freezed == residentUids
          ? _value._residentUids
          : residentUids // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      primaryContactUid: freezed == primaryContactUid
          ? _value.primaryContactUid
          : primaryContactUid // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmTokens: freezed == fcmTokens
          ? _value._fcmTokens
          : fcmTokens // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      amenities: freezed == amenities
          ? _value._amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      hasParking: freezed == hasParking
          ? _value.hasParking
          : hasParking // ignore: cast_nullable_to_non_nullable
              as bool?,
      parkingSlotNumber: freezed == parkingSlotNumber
          ? _value.parkingSlotNumber
          : parkingSlotNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      parkingSlots: freezed == parkingSlots
          ? _value.parkingSlots
          : parkingSlots // ignore: cast_nullable_to_non_nullable
              as int?,
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
@JsonSerializable()
class _$FlatEntityImpl implements _FlatEntity {
  const _$FlatEntityImpl(
      {required this.id,
      required this.societyId,
      required this.buildingNumber,
      required this.flatNumber,
      this.floor,
      this.wing,
      this.bedrooms,
      this.bathrooms,
      this.area,
      this.areaUnit,
      this.isOccupied = true,
      this.occupiedSince,
      final List<String>? residentUids,
      this.primaryContactUid,
      final List<String>? fcmTokens,
      final Map<String, dynamic>? amenities,
      this.hasParking,
      this.parkingSlotNumber,
      this.parkingSlots,
      final Map<String, dynamic>? metadata,
      this.createdAt,
      this.updatedAt})
      : _residentUids = residentUids,
        _fcmTokens = fcmTokens,
        _amenities = amenities,
        _metadata = metadata;

  factory _$FlatEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlatEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String societyId;
  @override
  final String buildingNumber;
  @override
  final String flatNumber;
  @override
  final String? floor;
  @override
  final String? wing;
  @override
  final int? bedrooms;
  @override
  final int? bathrooms;
  @override
  final double? area;
  @override
  final String? areaUnit;
// sqft, sqm
  @override
  @JsonKey()
  final bool isOccupied;
  @override
  final DateTime? occupiedSince;
  final List<String>? _residentUids;
  @override
  List<String>? get residentUids {
    final value = _residentUids;
    if (value == null) return null;
    if (_residentUids is EqualUnmodifiableListView) return _residentUids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? primaryContactUid;
  final List<String>? _fcmTokens;
  @override
  List<String>? get fcmTokens {
    final value = _fcmTokens;
    if (value == null) return null;
    if (_fcmTokens is EqualUnmodifiableListView) return _fcmTokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _amenities;
  @override
  Map<String, dynamic>? get amenities {
    final value = _amenities;
    if (value == null) return null;
    if (_amenities is EqualUnmodifiableMapView) return _amenities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final bool? hasParking;
  @override
  final String? parkingSlotNumber;
  @override
  final int? parkingSlots;
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
    return 'FlatEntity(id: $id, societyId: $societyId, buildingNumber: $buildingNumber, flatNumber: $flatNumber, floor: $floor, wing: $wing, bedrooms: $bedrooms, bathrooms: $bathrooms, area: $area, areaUnit: $areaUnit, isOccupied: $isOccupied, occupiedSince: $occupiedSince, residentUids: $residentUids, primaryContactUid: $primaryContactUid, fcmTokens: $fcmTokens, amenities: $amenities, hasParking: $hasParking, parkingSlotNumber: $parkingSlotNumber, parkingSlots: $parkingSlots, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlatEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.societyId, societyId) ||
                other.societyId == societyId) &&
            (identical(other.buildingNumber, buildingNumber) ||
                other.buildingNumber == buildingNumber) &&
            (identical(other.flatNumber, flatNumber) ||
                other.flatNumber == flatNumber) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.wing, wing) || other.wing == wing) &&
            (identical(other.bedrooms, bedrooms) ||
                other.bedrooms == bedrooms) &&
            (identical(other.bathrooms, bathrooms) ||
                other.bathrooms == bathrooms) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.areaUnit, areaUnit) ||
                other.areaUnit == areaUnit) &&
            (identical(other.isOccupied, isOccupied) ||
                other.isOccupied == isOccupied) &&
            (identical(other.occupiedSince, occupiedSince) ||
                other.occupiedSince == occupiedSince) &&
            const DeepCollectionEquality()
                .equals(other._residentUids, _residentUids) &&
            (identical(other.primaryContactUid, primaryContactUid) ||
                other.primaryContactUid == primaryContactUid) &&
            const DeepCollectionEquality()
                .equals(other._fcmTokens, _fcmTokens) &&
            const DeepCollectionEquality()
                .equals(other._amenities, _amenities) &&
            (identical(other.hasParking, hasParking) ||
                other.hasParking == hasParking) &&
            (identical(other.parkingSlotNumber, parkingSlotNumber) ||
                other.parkingSlotNumber == parkingSlotNumber) &&
            (identical(other.parkingSlots, parkingSlots) ||
                other.parkingSlots == parkingSlots) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        societyId,
        buildingNumber,
        flatNumber,
        floor,
        wing,
        bedrooms,
        bathrooms,
        area,
        areaUnit,
        isOccupied,
        occupiedSince,
        const DeepCollectionEquality().hash(_residentUids),
        primaryContactUid,
        const DeepCollectionEquality().hash(_fcmTokens),
        const DeepCollectionEquality().hash(_amenities),
        hasParking,
        parkingSlotNumber,
        parkingSlots,
        const DeepCollectionEquality().hash(_metadata),
        createdAt,
        updatedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlatEntityImplCopyWith<_$FlatEntityImpl> get copyWith =>
      __$$FlatEntityImplCopyWithImpl<_$FlatEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlatEntityImplToJson(
      this,
    );
  }
}

abstract class _FlatEntity implements FlatEntity {
  const factory _FlatEntity(
      {required final String id,
      required final String societyId,
      required final String buildingNumber,
      required final String flatNumber,
      final String? floor,
      final String? wing,
      final int? bedrooms,
      final int? bathrooms,
      final double? area,
      final String? areaUnit,
      final bool isOccupied,
      final DateTime? occupiedSince,
      final List<String>? residentUids,
      final String? primaryContactUid,
      final List<String>? fcmTokens,
      final Map<String, dynamic>? amenities,
      final bool? hasParking,
      final String? parkingSlotNumber,
      final int? parkingSlots,
      final Map<String, dynamic>? metadata,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$FlatEntityImpl;

  factory _FlatEntity.fromJson(Map<String, dynamic> json) =
      _$FlatEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get societyId;
  @override
  String get buildingNumber;
  @override
  String get flatNumber;
  @override
  String? get floor;
  @override
  String? get wing;
  @override
  int? get bedrooms;
  @override
  int? get bathrooms;
  @override
  double? get area;
  @override
  String? get areaUnit;
  @override // sqft, sqm
  bool get isOccupied;
  @override
  DateTime? get occupiedSince;
  @override
  List<String>? get residentUids;
  @override
  String? get primaryContactUid;
  @override
  List<String>? get fcmTokens;
  @override
  Map<String, dynamic>? get amenities;
  @override
  bool? get hasParking;
  @override
  String? get parkingSlotNumber;
  @override
  int? get parkingSlots;
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$FlatEntityImplCopyWith<_$FlatEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SocietyEntity _$SocietyEntityFromJson(Map<String, dynamic> json) {
  return _SocietyEntity.fromJson(json);
}

/// @nodoc
mixin _$SocietyEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get shortName => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get pincode => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  GeoPoint? get location => throw _privateConstructorUsedError;
  List<String>? get buildings => throw _privateConstructorUsedError;
  int? get totalFlats => throw _privateConstructorUsedError;
  int? get occupiedFlats => throw _privateConstructorUsedError;
  List<String>? get adminUids => throw _privateConstructorUsedError;
  List<String>? get amenities => throw _privateConstructorUsedError;
  Map<String, dynamic>? get settings => throw _privateConstructorUsedError;
  Map<String, dynamic>? get rules => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;
  String? get bannerUrl => throw _privateConstructorUsedError;
  String? get contactEmail => throw _privateConstructorUsedError;
  String? get contactPhone => throw _privateConstructorUsedError;
  String? get emergencyPhone => throw _privateConstructorUsedError;
  Map<String, String>? get gateNames => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SocietyEntityCopyWith<SocietyEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocietyEntityCopyWith<$Res> {
  factory $SocietyEntityCopyWith(
          SocietyEntity value, $Res Function(SocietyEntity) then) =
      _$SocietyEntityCopyWithImpl<$Res, SocietyEntity>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? shortName,
      String? address,
      String? city,
      String? state,
      String? pincode,
      String? country,
      GeoPoint? location,
      List<String>? buildings,
      int? totalFlats,
      int? occupiedFlats,
      List<String>? adminUids,
      List<String>? amenities,
      Map<String, dynamic>? settings,
      Map<String, dynamic>? rules,
      String? logoUrl,
      String? bannerUrl,
      String? contactEmail,
      String? contactPhone,
      String? emergencyPhone,
      Map<String, String>? gateNames,
      bool isActive,
      DateTime? createdAt,
      DateTime? updatedAt});

  $GeoPointCopyWith<$Res>? get location;
}

/// @nodoc
class _$SocietyEntityCopyWithImpl<$Res, $Val extends SocietyEntity>
    implements $SocietyEntityCopyWith<$Res> {
  _$SocietyEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? shortName = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? pincode = freezed,
    Object? country = freezed,
    Object? location = freezed,
    Object? buildings = freezed,
    Object? totalFlats = freezed,
    Object? occupiedFlats = freezed,
    Object? adminUids = freezed,
    Object? amenities = freezed,
    Object? settings = freezed,
    Object? rules = freezed,
    Object? logoUrl = freezed,
    Object? bannerUrl = freezed,
    Object? contactEmail = freezed,
    Object? contactPhone = freezed,
    Object? emergencyPhone = freezed,
    Object? gateNames = freezed,
    Object? isActive = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: freezed == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      pincode: freezed == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
      buildings: freezed == buildings
          ? _value.buildings
          : buildings // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      totalFlats: freezed == totalFlats
          ? _value.totalFlats
          : totalFlats // ignore: cast_nullable_to_non_nullable
              as int?,
      occupiedFlats: freezed == occupiedFlats
          ? _value.occupiedFlats
          : occupiedFlats // ignore: cast_nullable_to_non_nullable
              as int?,
      adminUids: freezed == adminUids
          ? _value.adminUids
          : adminUids // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      amenities: freezed == amenities
          ? _value.amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      rules: freezed == rules
          ? _value.rules
          : rules // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: freezed == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      contactEmail: freezed == contactEmail
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPhone: freezed == contactPhone
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      emergencyPhone: freezed == emergencyPhone
          ? _value.emergencyPhone
          : emergencyPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      gateNames: freezed == gateNames
          ? _value.gateNames
          : gateNames // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
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
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeoPointCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $GeoPointCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SocietyEntityImplCopyWith<$Res>
    implements $SocietyEntityCopyWith<$Res> {
  factory _$$SocietyEntityImplCopyWith(
          _$SocietyEntityImpl value, $Res Function(_$SocietyEntityImpl) then) =
      __$$SocietyEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? shortName,
      String? address,
      String? city,
      String? state,
      String? pincode,
      String? country,
      GeoPoint? location,
      List<String>? buildings,
      int? totalFlats,
      int? occupiedFlats,
      List<String>? adminUids,
      List<String>? amenities,
      Map<String, dynamic>? settings,
      Map<String, dynamic>? rules,
      String? logoUrl,
      String? bannerUrl,
      String? contactEmail,
      String? contactPhone,
      String? emergencyPhone,
      Map<String, String>? gateNames,
      bool isActive,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $GeoPointCopyWith<$Res>? get location;
}

/// @nodoc
class __$$SocietyEntityImplCopyWithImpl<$Res>
    extends _$SocietyEntityCopyWithImpl<$Res, _$SocietyEntityImpl>
    implements _$$SocietyEntityImplCopyWith<$Res> {
  __$$SocietyEntityImplCopyWithImpl(
      _$SocietyEntityImpl _value, $Res Function(_$SocietyEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? shortName = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? pincode = freezed,
    Object? country = freezed,
    Object? location = freezed,
    Object? buildings = freezed,
    Object? totalFlats = freezed,
    Object? occupiedFlats = freezed,
    Object? adminUids = freezed,
    Object? amenities = freezed,
    Object? settings = freezed,
    Object? rules = freezed,
    Object? logoUrl = freezed,
    Object? bannerUrl = freezed,
    Object? contactEmail = freezed,
    Object? contactPhone = freezed,
    Object? emergencyPhone = freezed,
    Object? gateNames = freezed,
    Object? isActive = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$SocietyEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: freezed == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      pincode: freezed == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
      buildings: freezed == buildings
          ? _value._buildings
          : buildings // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      totalFlats: freezed == totalFlats
          ? _value.totalFlats
          : totalFlats // ignore: cast_nullable_to_non_nullable
              as int?,
      occupiedFlats: freezed == occupiedFlats
          ? _value.occupiedFlats
          : occupiedFlats // ignore: cast_nullable_to_non_nullable
              as int?,
      adminUids: freezed == adminUids
          ? _value._adminUids
          : adminUids // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      amenities: freezed == amenities
          ? _value._amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      settings: freezed == settings
          ? _value._settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      rules: freezed == rules
          ? _value._rules
          : rules // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: freezed == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      contactEmail: freezed == contactEmail
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPhone: freezed == contactPhone
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      emergencyPhone: freezed == emergencyPhone
          ? _value.emergencyPhone
          : emergencyPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      gateNames: freezed == gateNames
          ? _value._gateNames
          : gateNames // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SocietyEntityImpl implements _SocietyEntity {
  const _$SocietyEntityImpl(
      {required this.id,
      required this.name,
      this.shortName,
      this.address,
      this.city,
      this.state,
      this.pincode,
      this.country,
      this.location,
      final List<String>? buildings,
      this.totalFlats,
      this.occupiedFlats,
      final List<String>? adminUids,
      final List<String>? amenities,
      final Map<String, dynamic>? settings,
      final Map<String, dynamic>? rules,
      this.logoUrl,
      this.bannerUrl,
      this.contactEmail,
      this.contactPhone,
      this.emergencyPhone,
      final Map<String, String>? gateNames,
      this.isActive = true,
      this.createdAt,
      this.updatedAt})
      : _buildings = buildings,
        _adminUids = adminUids,
        _amenities = amenities,
        _settings = settings,
        _rules = rules,
        _gateNames = gateNames;

  factory _$SocietyEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocietyEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? shortName;
  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? pincode;
  @override
  final String? country;
  @override
  final GeoPoint? location;
  final List<String>? _buildings;
  @override
  List<String>? get buildings {
    final value = _buildings;
    if (value == null) return null;
    if (_buildings is EqualUnmodifiableListView) return _buildings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? totalFlats;
  @override
  final int? occupiedFlats;
  final List<String>? _adminUids;
  @override
  List<String>? get adminUids {
    final value = _adminUids;
    if (value == null) return null;
    if (_adminUids is EqualUnmodifiableListView) return _adminUids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _amenities;
  @override
  List<String>? get amenities {
    final value = _amenities;
    if (value == null) return null;
    if (_amenities is EqualUnmodifiableListView) return _amenities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _settings;
  @override
  Map<String, dynamic>? get settings {
    final value = _settings;
    if (value == null) return null;
    if (_settings is EqualUnmodifiableMapView) return _settings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _rules;
  @override
  Map<String, dynamic>? get rules {
    final value = _rules;
    if (value == null) return null;
    if (_rules is EqualUnmodifiableMapView) return _rules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? logoUrl;
  @override
  final String? bannerUrl;
  @override
  final String? contactEmail;
  @override
  final String? contactPhone;
  @override
  final String? emergencyPhone;
  final Map<String, String>? _gateNames;
  @override
  Map<String, String>? get gateNames {
    final value = _gateNames;
    if (value == null) return null;
    if (_gateNames is EqualUnmodifiableMapView) return _gateNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final bool isActive;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'SocietyEntity(id: $id, name: $name, shortName: $shortName, address: $address, city: $city, state: $state, pincode: $pincode, country: $country, location: $location, buildings: $buildings, totalFlats: $totalFlats, occupiedFlats: $occupiedFlats, adminUids: $adminUids, amenities: $amenities, settings: $settings, rules: $rules, logoUrl: $logoUrl, bannerUrl: $bannerUrl, contactEmail: $contactEmail, contactPhone: $contactPhone, emergencyPhone: $emergencyPhone, gateNames: $gateNames, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocietyEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality()
                .equals(other._buildings, _buildings) &&
            (identical(other.totalFlats, totalFlats) ||
                other.totalFlats == totalFlats) &&
            (identical(other.occupiedFlats, occupiedFlats) ||
                other.occupiedFlats == occupiedFlats) &&
            const DeepCollectionEquality()
                .equals(other._adminUids, _adminUids) &&
            const DeepCollectionEquality()
                .equals(other._amenities, _amenities) &&
            const DeepCollectionEquality().equals(other._settings, _settings) &&
            const DeepCollectionEquality().equals(other._rules, _rules) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.bannerUrl, bannerUrl) ||
                other.bannerUrl == bannerUrl) &&
            (identical(other.contactEmail, contactEmail) ||
                other.contactEmail == contactEmail) &&
            (identical(other.contactPhone, contactPhone) ||
                other.contactPhone == contactPhone) &&
            (identical(other.emergencyPhone, emergencyPhone) ||
                other.emergencyPhone == emergencyPhone) &&
            const DeepCollectionEquality()
                .equals(other._gateNames, _gateNames) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        shortName,
        address,
        city,
        state,
        pincode,
        country,
        location,
        const DeepCollectionEquality().hash(_buildings),
        totalFlats,
        occupiedFlats,
        const DeepCollectionEquality().hash(_adminUids),
        const DeepCollectionEquality().hash(_amenities),
        const DeepCollectionEquality().hash(_settings),
        const DeepCollectionEquality().hash(_rules),
        logoUrl,
        bannerUrl,
        contactEmail,
        contactPhone,
        emergencyPhone,
        const DeepCollectionEquality().hash(_gateNames),
        isActive,
        createdAt,
        updatedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SocietyEntityImplCopyWith<_$SocietyEntityImpl> get copyWith =>
      __$$SocietyEntityImplCopyWithImpl<_$SocietyEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SocietyEntityImplToJson(
      this,
    );
  }
}

abstract class _SocietyEntity implements SocietyEntity {
  const factory _SocietyEntity(
      {required final String id,
      required final String name,
      final String? shortName,
      final String? address,
      final String? city,
      final String? state,
      final String? pincode,
      final String? country,
      final GeoPoint? location,
      final List<String>? buildings,
      final int? totalFlats,
      final int? occupiedFlats,
      final List<String>? adminUids,
      final List<String>? amenities,
      final Map<String, dynamic>? settings,
      final Map<String, dynamic>? rules,
      final String? logoUrl,
      final String? bannerUrl,
      final String? contactEmail,
      final String? contactPhone,
      final String? emergencyPhone,
      final Map<String, String>? gateNames,
      final bool isActive,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$SocietyEntityImpl;

  factory _SocietyEntity.fromJson(Map<String, dynamic> json) =
      _$SocietyEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get shortName;
  @override
  String? get address;
  @override
  String? get city;
  @override
  String? get state;
  @override
  String? get pincode;
  @override
  String? get country;
  @override
  GeoPoint? get location;
  @override
  List<String>? get buildings;
  @override
  int? get totalFlats;
  @override
  int? get occupiedFlats;
  @override
  List<String>? get adminUids;
  @override
  List<String>? get amenities;
  @override
  Map<String, dynamic>? get settings;
  @override
  Map<String, dynamic>? get rules;
  @override
  String? get logoUrl;
  @override
  String? get bannerUrl;
  @override
  String? get contactEmail;
  @override
  String? get contactPhone;
  @override
  String? get emergencyPhone;
  @override
  Map<String, String>? get gateNames;
  @override
  bool get isActive;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$SocietyEntityImplCopyWith<_$SocietyEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BuildingEntity _$BuildingEntityFromJson(Map<String, dynamic> json) {
  return _BuildingEntity.fromJson(json);
}

/// @nodoc
mixin _$BuildingEntity {
  String get id => throw _privateConstructorUsedError;
  String get societyId => throw _privateConstructorUsedError;
  String get buildingNumber => throw _privateConstructorUsedError;
  String? get buildingName => throw _privateConstructorUsedError;
  int? get totalFloors => throw _privateConstructorUsedError;
  int? get flatsPerFloor => throw _privateConstructorUsedError;
  int? get totalFlats => throw _privateConstructorUsedError;
  List<String>? get wings => throw _privateConstructorUsedError;
  Map<String, dynamic>? get amenities => throw _privateConstructorUsedError;
  bool? get hasLift => throw _privateConstructorUsedError;
  bool? get hasParking => throw _privateConstructorUsedError;
  int? get totalParkingSlots => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BuildingEntityCopyWith<BuildingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuildingEntityCopyWith<$Res> {
  factory $BuildingEntityCopyWith(
          BuildingEntity value, $Res Function(BuildingEntity) then) =
      _$BuildingEntityCopyWithImpl<$Res, BuildingEntity>;
  @useResult
  $Res call(
      {String id,
      String societyId,
      String buildingNumber,
      String? buildingName,
      int? totalFloors,
      int? flatsPerFloor,
      int? totalFlats,
      List<String>? wings,
      Map<String, dynamic>? amenities,
      bool? hasLift,
      bool? hasParking,
      int? totalParkingSlots,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$BuildingEntityCopyWithImpl<$Res, $Val extends BuildingEntity>
    implements $BuildingEntityCopyWith<$Res> {
  _$BuildingEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? buildingNumber = null,
    Object? buildingName = freezed,
    Object? totalFloors = freezed,
    Object? flatsPerFloor = freezed,
    Object? totalFlats = freezed,
    Object? wings = freezed,
    Object? amenities = freezed,
    Object? hasLift = freezed,
    Object? hasParking = freezed,
    Object? totalParkingSlots = freezed,
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
      buildingNumber: null == buildingNumber
          ? _value.buildingNumber
          : buildingNumber // ignore: cast_nullable_to_non_nullable
              as String,
      buildingName: freezed == buildingName
          ? _value.buildingName
          : buildingName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalFloors: freezed == totalFloors
          ? _value.totalFloors
          : totalFloors // ignore: cast_nullable_to_non_nullable
              as int?,
      flatsPerFloor: freezed == flatsPerFloor
          ? _value.flatsPerFloor
          : flatsPerFloor // ignore: cast_nullable_to_non_nullable
              as int?,
      totalFlats: freezed == totalFlats
          ? _value.totalFlats
          : totalFlats // ignore: cast_nullable_to_non_nullable
              as int?,
      wings: freezed == wings
          ? _value.wings
          : wings // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      amenities: freezed == amenities
          ? _value.amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      hasLift: freezed == hasLift
          ? _value.hasLift
          : hasLift // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasParking: freezed == hasParking
          ? _value.hasParking
          : hasParking // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalParkingSlots: freezed == totalParkingSlots
          ? _value.totalParkingSlots
          : totalParkingSlots // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$BuildingEntityImplCopyWith<$Res>
    implements $BuildingEntityCopyWith<$Res> {
  factory _$$BuildingEntityImplCopyWith(_$BuildingEntityImpl value,
          $Res Function(_$BuildingEntityImpl) then) =
      __$$BuildingEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String societyId,
      String buildingNumber,
      String? buildingName,
      int? totalFloors,
      int? flatsPerFloor,
      int? totalFlats,
      List<String>? wings,
      Map<String, dynamic>? amenities,
      bool? hasLift,
      bool? hasParking,
      int? totalParkingSlots,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$BuildingEntityImplCopyWithImpl<$Res>
    extends _$BuildingEntityCopyWithImpl<$Res, _$BuildingEntityImpl>
    implements _$$BuildingEntityImplCopyWith<$Res> {
  __$$BuildingEntityImplCopyWithImpl(
      _$BuildingEntityImpl _value, $Res Function(_$BuildingEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? buildingNumber = null,
    Object? buildingName = freezed,
    Object? totalFloors = freezed,
    Object? flatsPerFloor = freezed,
    Object? totalFlats = freezed,
    Object? wings = freezed,
    Object? amenities = freezed,
    Object? hasLift = freezed,
    Object? hasParking = freezed,
    Object? totalParkingSlots = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$BuildingEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      societyId: null == societyId
          ? _value.societyId
          : societyId // ignore: cast_nullable_to_non_nullable
              as String,
      buildingNumber: null == buildingNumber
          ? _value.buildingNumber
          : buildingNumber // ignore: cast_nullable_to_non_nullable
              as String,
      buildingName: freezed == buildingName
          ? _value.buildingName
          : buildingName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalFloors: freezed == totalFloors
          ? _value.totalFloors
          : totalFloors // ignore: cast_nullable_to_non_nullable
              as int?,
      flatsPerFloor: freezed == flatsPerFloor
          ? _value.flatsPerFloor
          : flatsPerFloor // ignore: cast_nullable_to_non_nullable
              as int?,
      totalFlats: freezed == totalFlats
          ? _value.totalFlats
          : totalFlats // ignore: cast_nullable_to_non_nullable
              as int?,
      wings: freezed == wings
          ? _value._wings
          : wings // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      amenities: freezed == amenities
          ? _value._amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      hasLift: freezed == hasLift
          ? _value.hasLift
          : hasLift // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasParking: freezed == hasParking
          ? _value.hasParking
          : hasParking // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalParkingSlots: freezed == totalParkingSlots
          ? _value.totalParkingSlots
          : totalParkingSlots // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$BuildingEntityImpl implements _BuildingEntity {
  const _$BuildingEntityImpl(
      {required this.id,
      required this.societyId,
      required this.buildingNumber,
      this.buildingName,
      this.totalFloors,
      this.flatsPerFloor,
      this.totalFlats,
      final List<String>? wings,
      final Map<String, dynamic>? amenities,
      this.hasLift,
      this.hasParking,
      this.totalParkingSlots,
      this.createdAt,
      this.updatedAt})
      : _wings = wings,
        _amenities = amenities;

  factory _$BuildingEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$BuildingEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String societyId;
  @override
  final String buildingNumber;
  @override
  final String? buildingName;
  @override
  final int? totalFloors;
  @override
  final int? flatsPerFloor;
  @override
  final int? totalFlats;
  final List<String>? _wings;
  @override
  List<String>? get wings {
    final value = _wings;
    if (value == null) return null;
    if (_wings is EqualUnmodifiableListView) return _wings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _amenities;
  @override
  Map<String, dynamic>? get amenities {
    final value = _amenities;
    if (value == null) return null;
    if (_amenities is EqualUnmodifiableMapView) return _amenities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final bool? hasLift;
  @override
  final bool? hasParking;
  @override
  final int? totalParkingSlots;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'BuildingEntity(id: $id, societyId: $societyId, buildingNumber: $buildingNumber, buildingName: $buildingName, totalFloors: $totalFloors, flatsPerFloor: $flatsPerFloor, totalFlats: $totalFlats, wings: $wings, amenities: $amenities, hasLift: $hasLift, hasParking: $hasParking, totalParkingSlots: $totalParkingSlots, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuildingEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.societyId, societyId) ||
                other.societyId == societyId) &&
            (identical(other.buildingNumber, buildingNumber) ||
                other.buildingNumber == buildingNumber) &&
            (identical(other.buildingName, buildingName) ||
                other.buildingName == buildingName) &&
            (identical(other.totalFloors, totalFloors) ||
                other.totalFloors == totalFloors) &&
            (identical(other.flatsPerFloor, flatsPerFloor) ||
                other.flatsPerFloor == flatsPerFloor) &&
            (identical(other.totalFlats, totalFlats) ||
                other.totalFlats == totalFlats) &&
            const DeepCollectionEquality().equals(other._wings, _wings) &&
            const DeepCollectionEquality()
                .equals(other._amenities, _amenities) &&
            (identical(other.hasLift, hasLift) || other.hasLift == hasLift) &&
            (identical(other.hasParking, hasParking) ||
                other.hasParking == hasParking) &&
            (identical(other.totalParkingSlots, totalParkingSlots) ||
                other.totalParkingSlots == totalParkingSlots) &&
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
      buildingNumber,
      buildingName,
      totalFloors,
      flatsPerFloor,
      totalFlats,
      const DeepCollectionEquality().hash(_wings),
      const DeepCollectionEquality().hash(_amenities),
      hasLift,
      hasParking,
      totalParkingSlots,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BuildingEntityImplCopyWith<_$BuildingEntityImpl> get copyWith =>
      __$$BuildingEntityImplCopyWithImpl<_$BuildingEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BuildingEntityImplToJson(
      this,
    );
  }
}

abstract class _BuildingEntity implements BuildingEntity {
  const factory _BuildingEntity(
      {required final String id,
      required final String societyId,
      required final String buildingNumber,
      final String? buildingName,
      final int? totalFloors,
      final int? flatsPerFloor,
      final int? totalFlats,
      final List<String>? wings,
      final Map<String, dynamic>? amenities,
      final bool? hasLift,
      final bool? hasParking,
      final int? totalParkingSlots,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$BuildingEntityImpl;

  factory _BuildingEntity.fromJson(Map<String, dynamic> json) =
      _$BuildingEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get societyId;
  @override
  String get buildingNumber;
  @override
  String? get buildingName;
  @override
  int? get totalFloors;
  @override
  int? get flatsPerFloor;
  @override
  int? get totalFlats;
  @override
  List<String>? get wings;
  @override
  Map<String, dynamic>? get amenities;
  @override
  bool? get hasLift;
  @override
  bool? get hasParking;
  @override
  int? get totalParkingSlots;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$BuildingEntityImplCopyWith<_$BuildingEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AmenityEntity _$AmenityEntityFromJson(Map<String, dynamic> json) {
  return _AmenityEntity.fromJson(json);
}

/// @nodoc
mixin _$AmenityEntity {
  String get id => throw _privateConstructorUsedError;
  String get societyId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get type =>
      throw _privateConstructorUsedError; // clubhouse, pool, gym, tennis, etc.
  String? get imageUrl => throw _privateConstructorUsedError;
  int? get capacity => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  TimeOfDay? get openingTime => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  TimeOfDay? get closingTime => throw _privateConstructorUsedError;
  List<int>? get availableDays =>
      throw _privateConstructorUsedError; // 0=Sunday, 1=Monday, etc.
  bool? get requiresBooking => throw _privateConstructorUsedError;
  bool? get requiresDeposit => throw _privateConstructorUsedError;
  double? get depositAmount => throw _privateConstructorUsedError;
  double? get hourlyRate => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  int? get maxBookingDurationHours => throw _privateConstructorUsedError;
  int? get advanceBookingDays => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  Map<String, dynamic>? get rules => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AmenityEntityCopyWith<AmenityEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AmenityEntityCopyWith<$Res> {
  factory $AmenityEntityCopyWith(
          AmenityEntity value, $Res Function(AmenityEntity) then) =
      _$AmenityEntityCopyWithImpl<$Res, AmenityEntity>;
  @useResult
  $Res call(
      {String id,
      String societyId,
      String name,
      String? description,
      String? type,
      String? imageUrl,
      int? capacity,
      @JsonKey(includeFromJson: false, includeToJson: false)
      TimeOfDay? openingTime,
      @JsonKey(includeFromJson: false, includeToJson: false)
      TimeOfDay? closingTime,
      List<int>? availableDays,
      bool? requiresBooking,
      bool? requiresDeposit,
      double? depositAmount,
      double? hourlyRate,
      String? currency,
      int? maxBookingDurationHours,
      int? advanceBookingDays,
      bool? isActive,
      Map<String, dynamic>? rules,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$AmenityEntityCopyWithImpl<$Res, $Val extends AmenityEntity>
    implements $AmenityEntityCopyWith<$Res> {
  _$AmenityEntityCopyWithImpl(this._value, this._then);

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
    Object? description = freezed,
    Object? type = freezed,
    Object? imageUrl = freezed,
    Object? capacity = freezed,
    Object? openingTime = freezed,
    Object? closingTime = freezed,
    Object? availableDays = freezed,
    Object? requiresBooking = freezed,
    Object? requiresDeposit = freezed,
    Object? depositAmount = freezed,
    Object? hourlyRate = freezed,
    Object? currency = freezed,
    Object? maxBookingDurationHours = freezed,
    Object? advanceBookingDays = freezed,
    Object? isActive = freezed,
    Object? rules = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      openingTime: freezed == openingTime
          ? _value.openingTime
          : openingTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      closingTime: freezed == closingTime
          ? _value.closingTime
          : closingTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      availableDays: freezed == availableDays
          ? _value.availableDays
          : availableDays // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      requiresBooking: freezed == requiresBooking
          ? _value.requiresBooking
          : requiresBooking // ignore: cast_nullable_to_non_nullable
              as bool?,
      requiresDeposit: freezed == requiresDeposit
          ? _value.requiresDeposit
          : requiresDeposit // ignore: cast_nullable_to_non_nullable
              as bool?,
      depositAmount: freezed == depositAmount
          ? _value.depositAmount
          : depositAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      hourlyRate: freezed == hourlyRate
          ? _value.hourlyRate
          : hourlyRate // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      maxBookingDurationHours: freezed == maxBookingDurationHours
          ? _value.maxBookingDurationHours
          : maxBookingDurationHours // ignore: cast_nullable_to_non_nullable
              as int?,
      advanceBookingDays: freezed == advanceBookingDays
          ? _value.advanceBookingDays
          : advanceBookingDays // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      rules: freezed == rules
          ? _value.rules
          : rules // ignore: cast_nullable_to_non_nullable
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
abstract class _$$AmenityEntityImplCopyWith<$Res>
    implements $AmenityEntityCopyWith<$Res> {
  factory _$$AmenityEntityImplCopyWith(
          _$AmenityEntityImpl value, $Res Function(_$AmenityEntityImpl) then) =
      __$$AmenityEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String societyId,
      String name,
      String? description,
      String? type,
      String? imageUrl,
      int? capacity,
      @JsonKey(includeFromJson: false, includeToJson: false)
      TimeOfDay? openingTime,
      @JsonKey(includeFromJson: false, includeToJson: false)
      TimeOfDay? closingTime,
      List<int>? availableDays,
      bool? requiresBooking,
      bool? requiresDeposit,
      double? depositAmount,
      double? hourlyRate,
      String? currency,
      int? maxBookingDurationHours,
      int? advanceBookingDays,
      bool? isActive,
      Map<String, dynamic>? rules,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$AmenityEntityImplCopyWithImpl<$Res>
    extends _$AmenityEntityCopyWithImpl<$Res, _$AmenityEntityImpl>
    implements _$$AmenityEntityImplCopyWith<$Res> {
  __$$AmenityEntityImplCopyWithImpl(
      _$AmenityEntityImpl _value, $Res Function(_$AmenityEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? name = null,
    Object? description = freezed,
    Object? type = freezed,
    Object? imageUrl = freezed,
    Object? capacity = freezed,
    Object? openingTime = freezed,
    Object? closingTime = freezed,
    Object? availableDays = freezed,
    Object? requiresBooking = freezed,
    Object? requiresDeposit = freezed,
    Object? depositAmount = freezed,
    Object? hourlyRate = freezed,
    Object? currency = freezed,
    Object? maxBookingDurationHours = freezed,
    Object? advanceBookingDays = freezed,
    Object? isActive = freezed,
    Object? rules = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$AmenityEntityImpl(
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      openingTime: freezed == openingTime
          ? _value.openingTime
          : openingTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      closingTime: freezed == closingTime
          ? _value.closingTime
          : closingTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      availableDays: freezed == availableDays
          ? _value._availableDays
          : availableDays // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      requiresBooking: freezed == requiresBooking
          ? _value.requiresBooking
          : requiresBooking // ignore: cast_nullable_to_non_nullable
              as bool?,
      requiresDeposit: freezed == requiresDeposit
          ? _value.requiresDeposit
          : requiresDeposit // ignore: cast_nullable_to_non_nullable
              as bool?,
      depositAmount: freezed == depositAmount
          ? _value.depositAmount
          : depositAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      hourlyRate: freezed == hourlyRate
          ? _value.hourlyRate
          : hourlyRate // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      maxBookingDurationHours: freezed == maxBookingDurationHours
          ? _value.maxBookingDurationHours
          : maxBookingDurationHours // ignore: cast_nullable_to_non_nullable
              as int?,
      advanceBookingDays: freezed == advanceBookingDays
          ? _value.advanceBookingDays
          : advanceBookingDays // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      rules: freezed == rules
          ? _value._rules
          : rules // ignore: cast_nullable_to_non_nullable
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
@JsonSerializable()
class _$AmenityEntityImpl implements _AmenityEntity {
  const _$AmenityEntityImpl(
      {required this.id,
      required this.societyId,
      required this.name,
      this.description,
      this.type,
      this.imageUrl,
      this.capacity,
      @JsonKey(includeFromJson: false, includeToJson: false) this.openingTime,
      @JsonKey(includeFromJson: false, includeToJson: false) this.closingTime,
      final List<int>? availableDays,
      this.requiresBooking,
      this.requiresDeposit,
      this.depositAmount,
      this.hourlyRate,
      this.currency,
      this.maxBookingDurationHours,
      this.advanceBookingDays,
      this.isActive,
      final Map<String, dynamic>? rules,
      this.createdAt,
      this.updatedAt})
      : _availableDays = availableDays,
        _rules = rules;

  factory _$AmenityEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AmenityEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String societyId;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? type;
// clubhouse, pool, gym, tennis, etc.
  @override
  final String? imageUrl;
  @override
  final int? capacity;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final TimeOfDay? openingTime;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final TimeOfDay? closingTime;
  final List<int>? _availableDays;
  @override
  List<int>? get availableDays {
    final value = _availableDays;
    if (value == null) return null;
    if (_availableDays is EqualUnmodifiableListView) return _availableDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// 0=Sunday, 1=Monday, etc.
  @override
  final bool? requiresBooking;
  @override
  final bool? requiresDeposit;
  @override
  final double? depositAmount;
  @override
  final double? hourlyRate;
  @override
  final String? currency;
  @override
  final int? maxBookingDurationHours;
  @override
  final int? advanceBookingDays;
  @override
  final bool? isActive;
  final Map<String, dynamic>? _rules;
  @override
  Map<String, dynamic>? get rules {
    final value = _rules;
    if (value == null) return null;
    if (_rules is EqualUnmodifiableMapView) return _rules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'AmenityEntity(id: $id, societyId: $societyId, name: $name, description: $description, type: $type, imageUrl: $imageUrl, capacity: $capacity, openingTime: $openingTime, closingTime: $closingTime, availableDays: $availableDays, requiresBooking: $requiresBooking, requiresDeposit: $requiresDeposit, depositAmount: $depositAmount, hourlyRate: $hourlyRate, currency: $currency, maxBookingDurationHours: $maxBookingDurationHours, advanceBookingDays: $advanceBookingDays, isActive: $isActive, rules: $rules, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AmenityEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.societyId, societyId) ||
                other.societyId == societyId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.openingTime, openingTime) ||
                other.openingTime == openingTime) &&
            (identical(other.closingTime, closingTime) ||
                other.closingTime == closingTime) &&
            const DeepCollectionEquality()
                .equals(other._availableDays, _availableDays) &&
            (identical(other.requiresBooking, requiresBooking) ||
                other.requiresBooking == requiresBooking) &&
            (identical(other.requiresDeposit, requiresDeposit) ||
                other.requiresDeposit == requiresDeposit) &&
            (identical(other.depositAmount, depositAmount) ||
                other.depositAmount == depositAmount) &&
            (identical(other.hourlyRate, hourlyRate) ||
                other.hourlyRate == hourlyRate) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(
                    other.maxBookingDurationHours, maxBookingDurationHours) ||
                other.maxBookingDurationHours == maxBookingDurationHours) &&
            (identical(other.advanceBookingDays, advanceBookingDays) ||
                other.advanceBookingDays == advanceBookingDays) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other._rules, _rules) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        societyId,
        name,
        description,
        type,
        imageUrl,
        capacity,
        openingTime,
        closingTime,
        const DeepCollectionEquality().hash(_availableDays),
        requiresBooking,
        requiresDeposit,
        depositAmount,
        hourlyRate,
        currency,
        maxBookingDurationHours,
        advanceBookingDays,
        isActive,
        const DeepCollectionEquality().hash(_rules),
        createdAt,
        updatedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AmenityEntityImplCopyWith<_$AmenityEntityImpl> get copyWith =>
      __$$AmenityEntityImplCopyWithImpl<_$AmenityEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AmenityEntityImplToJson(
      this,
    );
  }
}

abstract class _AmenityEntity implements AmenityEntity {
  const factory _AmenityEntity(
      {required final String id,
      required final String societyId,
      required final String name,
      final String? description,
      final String? type,
      final String? imageUrl,
      final int? capacity,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final TimeOfDay? openingTime,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final TimeOfDay? closingTime,
      final List<int>? availableDays,
      final bool? requiresBooking,
      final bool? requiresDeposit,
      final double? depositAmount,
      final double? hourlyRate,
      final String? currency,
      final int? maxBookingDurationHours,
      final int? advanceBookingDays,
      final bool? isActive,
      final Map<String, dynamic>? rules,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$AmenityEntityImpl;

  factory _AmenityEntity.fromJson(Map<String, dynamic> json) =
      _$AmenityEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get societyId;
  @override
  String get name;
  @override
  String? get description;
  @override
  String? get type;
  @override // clubhouse, pool, gym, tennis, etc.
  String? get imageUrl;
  @override
  int? get capacity;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  TimeOfDay? get openingTime;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  TimeOfDay? get closingTime;
  @override
  List<int>? get availableDays;
  @override // 0=Sunday, 1=Monday, etc.
  bool? get requiresBooking;
  @override
  bool? get requiresDeposit;
  @override
  double? get depositAmount;
  @override
  double? get hourlyRate;
  @override
  String? get currency;
  @override
  int? get maxBookingDurationHours;
  @override
  int? get advanceBookingDays;
  @override
  bool? get isActive;
  @override
  Map<String, dynamic>? get rules;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$AmenityEntityImplCopyWith<_$AmenityEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookingEntity _$BookingEntityFromJson(Map<String, dynamic> json) {
  return _BookingEntity.fromJson(json);
}

/// @nodoc
mixin _$BookingEntity {
  String get id => throw _privateConstructorUsedError;
  String get societyId => throw _privateConstructorUsedError;
  String get amenityId => throw _privateConstructorUsedError;
  String get amenityName => throw _privateConstructorUsedError;
  String get flatId => throw _privateConstructorUsedError;
  String get bookedBy => throw _privateConstructorUsedError;
  String? get bookerName => throw _privateConstructorUsedError;
  String? get bookerPhone => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  String? get purpose => throw _privateConstructorUsedError;
  int? get expectedGuests => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // pending, confirmed, cancelled, completed
  bool? get depositPaid => throw _privateConstructorUsedError;
  double? get depositAmount => throw _privateConstructorUsedError;
  double? get totalAmount => throw _privateConstructorUsedError;
  String? get paymentId => throw _privateConstructorUsedError;
  String? get cancellationReason => throw _privateConstructorUsedError;
  DateTime? get cancelledAt => throw _privateConstructorUsedError;
  String? get cancelledBy => throw _privateConstructorUsedError;
  List<String>? get attendeeUids => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingEntityCopyWith<BookingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingEntityCopyWith<$Res> {
  factory $BookingEntityCopyWith(
          BookingEntity value, $Res Function(BookingEntity) then) =
      _$BookingEntityCopyWithImpl<$Res, BookingEntity>;
  @useResult
  $Res call(
      {String id,
      String societyId,
      String amenityId,
      String amenityName,
      String flatId,
      String bookedBy,
      String? bookerName,
      String? bookerPhone,
      DateTime startTime,
      DateTime endTime,
      String? purpose,
      int? expectedGuests,
      String status,
      bool? depositPaid,
      double? depositAmount,
      double? totalAmount,
      String? paymentId,
      String? cancellationReason,
      DateTime? cancelledAt,
      String? cancelledBy,
      List<String>? attendeeUids,
      Map<String, dynamic>? metadata,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$BookingEntityCopyWithImpl<$Res, $Val extends BookingEntity>
    implements $BookingEntityCopyWith<$Res> {
  _$BookingEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? amenityId = null,
    Object? amenityName = null,
    Object? flatId = null,
    Object? bookedBy = null,
    Object? bookerName = freezed,
    Object? bookerPhone = freezed,
    Object? startTime = null,
    Object? endTime = null,
    Object? purpose = freezed,
    Object? expectedGuests = freezed,
    Object? status = null,
    Object? depositPaid = freezed,
    Object? depositAmount = freezed,
    Object? totalAmount = freezed,
    Object? paymentId = freezed,
    Object? cancellationReason = freezed,
    Object? cancelledAt = freezed,
    Object? cancelledBy = freezed,
    Object? attendeeUids = freezed,
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
      amenityId: null == amenityId
          ? _value.amenityId
          : amenityId // ignore: cast_nullable_to_non_nullable
              as String,
      amenityName: null == amenityName
          ? _value.amenityName
          : amenityName // ignore: cast_nullable_to_non_nullable
              as String,
      flatId: null == flatId
          ? _value.flatId
          : flatId // ignore: cast_nullable_to_non_nullable
              as String,
      bookedBy: null == bookedBy
          ? _value.bookedBy
          : bookedBy // ignore: cast_nullable_to_non_nullable
              as String,
      bookerName: freezed == bookerName
          ? _value.bookerName
          : bookerName // ignore: cast_nullable_to_non_nullable
              as String?,
      bookerPhone: freezed == bookerPhone
          ? _value.bookerPhone
          : bookerPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      purpose: freezed == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedGuests: freezed == expectedGuests
          ? _value.expectedGuests
          : expectedGuests // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      depositPaid: freezed == depositPaid
          ? _value.depositPaid
          : depositPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      depositAmount: freezed == depositAmount
          ? _value.depositAmount
          : depositAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancelledBy: freezed == cancelledBy
          ? _value.cancelledBy
          : cancelledBy // ignore: cast_nullable_to_non_nullable
              as String?,
      attendeeUids: freezed == attendeeUids
          ? _value.attendeeUids
          : attendeeUids // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
abstract class _$$BookingEntityImplCopyWith<$Res>
    implements $BookingEntityCopyWith<$Res> {
  factory _$$BookingEntityImplCopyWith(
          _$BookingEntityImpl value, $Res Function(_$BookingEntityImpl) then) =
      __$$BookingEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String societyId,
      String amenityId,
      String amenityName,
      String flatId,
      String bookedBy,
      String? bookerName,
      String? bookerPhone,
      DateTime startTime,
      DateTime endTime,
      String? purpose,
      int? expectedGuests,
      String status,
      bool? depositPaid,
      double? depositAmount,
      double? totalAmount,
      String? paymentId,
      String? cancellationReason,
      DateTime? cancelledAt,
      String? cancelledBy,
      List<String>? attendeeUids,
      Map<String, dynamic>? metadata,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$BookingEntityImplCopyWithImpl<$Res>
    extends _$BookingEntityCopyWithImpl<$Res, _$BookingEntityImpl>
    implements _$$BookingEntityImplCopyWith<$Res> {
  __$$BookingEntityImplCopyWithImpl(
      _$BookingEntityImpl _value, $Res Function(_$BookingEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? amenityId = null,
    Object? amenityName = null,
    Object? flatId = null,
    Object? bookedBy = null,
    Object? bookerName = freezed,
    Object? bookerPhone = freezed,
    Object? startTime = null,
    Object? endTime = null,
    Object? purpose = freezed,
    Object? expectedGuests = freezed,
    Object? status = null,
    Object? depositPaid = freezed,
    Object? depositAmount = freezed,
    Object? totalAmount = freezed,
    Object? paymentId = freezed,
    Object? cancellationReason = freezed,
    Object? cancelledAt = freezed,
    Object? cancelledBy = freezed,
    Object? attendeeUids = freezed,
    Object? metadata = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$BookingEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      societyId: null == societyId
          ? _value.societyId
          : societyId // ignore: cast_nullable_to_non_nullable
              as String,
      amenityId: null == amenityId
          ? _value.amenityId
          : amenityId // ignore: cast_nullable_to_non_nullable
              as String,
      amenityName: null == amenityName
          ? _value.amenityName
          : amenityName // ignore: cast_nullable_to_non_nullable
              as String,
      flatId: null == flatId
          ? _value.flatId
          : flatId // ignore: cast_nullable_to_non_nullable
              as String,
      bookedBy: null == bookedBy
          ? _value.bookedBy
          : bookedBy // ignore: cast_nullable_to_non_nullable
              as String,
      bookerName: freezed == bookerName
          ? _value.bookerName
          : bookerName // ignore: cast_nullable_to_non_nullable
              as String?,
      bookerPhone: freezed == bookerPhone
          ? _value.bookerPhone
          : bookerPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      purpose: freezed == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedGuests: freezed == expectedGuests
          ? _value.expectedGuests
          : expectedGuests // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      depositPaid: freezed == depositPaid
          ? _value.depositPaid
          : depositPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      depositAmount: freezed == depositAmount
          ? _value.depositAmount
          : depositAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancelledBy: freezed == cancelledBy
          ? _value.cancelledBy
          : cancelledBy // ignore: cast_nullable_to_non_nullable
              as String?,
      attendeeUids: freezed == attendeeUids
          ? _value._attendeeUids
          : attendeeUids // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
@JsonSerializable()
class _$BookingEntityImpl implements _BookingEntity {
  const _$BookingEntityImpl(
      {required this.id,
      required this.societyId,
      required this.amenityId,
      required this.amenityName,
      required this.flatId,
      required this.bookedBy,
      this.bookerName,
      this.bookerPhone,
      required this.startTime,
      required this.endTime,
      this.purpose,
      this.expectedGuests,
      this.status = 'pending',
      this.depositPaid,
      this.depositAmount,
      this.totalAmount,
      this.paymentId,
      this.cancellationReason,
      this.cancelledAt,
      this.cancelledBy,
      final List<String>? attendeeUids,
      final Map<String, dynamic>? metadata,
      this.createdAt,
      this.updatedAt})
      : _attendeeUids = attendeeUids,
        _metadata = metadata;

  factory _$BookingEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String societyId;
  @override
  final String amenityId;
  @override
  final String amenityName;
  @override
  final String flatId;
  @override
  final String bookedBy;
  @override
  final String? bookerName;
  @override
  final String? bookerPhone;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final String? purpose;
  @override
  final int? expectedGuests;
  @override
  @JsonKey()
  final String status;
// pending, confirmed, cancelled, completed
  @override
  final bool? depositPaid;
  @override
  final double? depositAmount;
  @override
  final double? totalAmount;
  @override
  final String? paymentId;
  @override
  final String? cancellationReason;
  @override
  final DateTime? cancelledAt;
  @override
  final String? cancelledBy;
  final List<String>? _attendeeUids;
  @override
  List<String>? get attendeeUids {
    final value = _attendeeUids;
    if (value == null) return null;
    if (_attendeeUids is EqualUnmodifiableListView) return _attendeeUids;
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
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'BookingEntity(id: $id, societyId: $societyId, amenityId: $amenityId, amenityName: $amenityName, flatId: $flatId, bookedBy: $bookedBy, bookerName: $bookerName, bookerPhone: $bookerPhone, startTime: $startTime, endTime: $endTime, purpose: $purpose, expectedGuests: $expectedGuests, status: $status, depositPaid: $depositPaid, depositAmount: $depositAmount, totalAmount: $totalAmount, paymentId: $paymentId, cancellationReason: $cancellationReason, cancelledAt: $cancelledAt, cancelledBy: $cancelledBy, attendeeUids: $attendeeUids, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.societyId, societyId) ||
                other.societyId == societyId) &&
            (identical(other.amenityId, amenityId) ||
                other.amenityId == amenityId) &&
            (identical(other.amenityName, amenityName) ||
                other.amenityName == amenityName) &&
            (identical(other.flatId, flatId) || other.flatId == flatId) &&
            (identical(other.bookedBy, bookedBy) ||
                other.bookedBy == bookedBy) &&
            (identical(other.bookerName, bookerName) ||
                other.bookerName == bookerName) &&
            (identical(other.bookerPhone, bookerPhone) ||
                other.bookerPhone == bookerPhone) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.purpose, purpose) || other.purpose == purpose) &&
            (identical(other.expectedGuests, expectedGuests) ||
                other.expectedGuests == expectedGuests) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.depositPaid, depositPaid) ||
                other.depositPaid == depositPaid) &&
            (identical(other.depositAmount, depositAmount) ||
                other.depositAmount == depositAmount) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.cancellationReason, cancellationReason) ||
                other.cancellationReason == cancellationReason) &&
            (identical(other.cancelledAt, cancelledAt) ||
                other.cancelledAt == cancelledAt) &&
            (identical(other.cancelledBy, cancelledBy) ||
                other.cancelledBy == cancelledBy) &&
            const DeepCollectionEquality()
                .equals(other._attendeeUids, _attendeeUids) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        societyId,
        amenityId,
        amenityName,
        flatId,
        bookedBy,
        bookerName,
        bookerPhone,
        startTime,
        endTime,
        purpose,
        expectedGuests,
        status,
        depositPaid,
        depositAmount,
        totalAmount,
        paymentId,
        cancellationReason,
        cancelledAt,
        cancelledBy,
        const DeepCollectionEquality().hash(_attendeeUids),
        const DeepCollectionEquality().hash(_metadata),
        createdAt,
        updatedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingEntityImplCopyWith<_$BookingEntityImpl> get copyWith =>
      __$$BookingEntityImplCopyWithImpl<_$BookingEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingEntityImplToJson(
      this,
    );
  }
}

abstract class _BookingEntity implements BookingEntity {
  const factory _BookingEntity(
      {required final String id,
      required final String societyId,
      required final String amenityId,
      required final String amenityName,
      required final String flatId,
      required final String bookedBy,
      final String? bookerName,
      final String? bookerPhone,
      required final DateTime startTime,
      required final DateTime endTime,
      final String? purpose,
      final int? expectedGuests,
      final String status,
      final bool? depositPaid,
      final double? depositAmount,
      final double? totalAmount,
      final String? paymentId,
      final String? cancellationReason,
      final DateTime? cancelledAt,
      final String? cancelledBy,
      final List<String>? attendeeUids,
      final Map<String, dynamic>? metadata,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$BookingEntityImpl;

  factory _BookingEntity.fromJson(Map<String, dynamic> json) =
      _$BookingEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get societyId;
  @override
  String get amenityId;
  @override
  String get amenityName;
  @override
  String get flatId;
  @override
  String get bookedBy;
  @override
  String? get bookerName;
  @override
  String? get bookerPhone;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  String? get purpose;
  @override
  int? get expectedGuests;
  @override
  String get status;
  @override // pending, confirmed, cancelled, completed
  bool? get depositPaid;
  @override
  double? get depositAmount;
  @override
  double? get totalAmount;
  @override
  String? get paymentId;
  @override
  String? get cancellationReason;
  @override
  DateTime? get cancelledAt;
  @override
  String? get cancelledBy;
  @override
  List<String>? get attendeeUids;
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$BookingEntityImplCopyWith<_$BookingEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GeoPoint _$GeoPointFromJson(Map<String, dynamic> json) {
  return _GeoPoint.fromJson(json);
}

/// @nodoc
mixin _$GeoPoint {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoPointCopyWith<GeoPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoPointCopyWith<$Res> {
  factory $GeoPointCopyWith(GeoPoint value, $Res Function(GeoPoint) then) =
      _$GeoPointCopyWithImpl<$Res, GeoPoint>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$GeoPointCopyWithImpl<$Res, $Val extends GeoPoint>
    implements $GeoPointCopyWith<$Res> {
  _$GeoPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeoPointImplCopyWith<$Res>
    implements $GeoPointCopyWith<$Res> {
  factory _$$GeoPointImplCopyWith(
          _$GeoPointImpl value, $Res Function(_$GeoPointImpl) then) =
      __$$GeoPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$GeoPointImplCopyWithImpl<$Res>
    extends _$GeoPointCopyWithImpl<$Res, _$GeoPointImpl>
    implements _$$GeoPointImplCopyWith<$Res> {
  __$$GeoPointImplCopyWithImpl(
      _$GeoPointImpl _value, $Res Function(_$GeoPointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$GeoPointImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeoPointImpl implements _GeoPoint {
  const _$GeoPointImpl({required this.latitude, required this.longitude});

  factory _$GeoPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeoPointImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'GeoPoint(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeoPointImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeoPointImplCopyWith<_$GeoPointImpl> get copyWith =>
      __$$GeoPointImplCopyWithImpl<_$GeoPointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeoPointImplToJson(
      this,
    );
  }
}

abstract class _GeoPoint implements GeoPoint {
  const factory _GeoPoint(
      {required final double latitude,
      required final double longitude}) = _$GeoPointImpl;

  factory _GeoPoint.fromJson(Map<String, dynamic> json) =
      _$GeoPointImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$GeoPointImplCopyWith<_$GeoPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
