// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InventoryItemEntity _$InventoryItemEntityFromJson(Map<String, dynamic> json) {
  return _InventoryItemEntity.fromJson(json);
}

/// @nodoc
mixin _$InventoryItemEntity {
  String get id => throw _privateConstructorUsedError;
  String get societyId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get category =>
      throw _privateConstructorUsedError; // e.g., "Electrical", "Tools", "Cleaning"
  InventoryItemType get type => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get unit =>
      throw _privateConstructorUsedError; // e.g., "pieces", "boxes", "sets"
  InventoryItemStatus get status => throw _privateConstructorUsedError;
  int? get minQuantity =>
      throw _privateConstructorUsedError; // Alert threshold for consumables
  String? get description => throw _privateConstructorUsedError;
  String? get location =>
      throw _privateConstructorUsedError; // Where the item is stored
  List<String>? get photos => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get updatedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryItemEntityCopyWith<InventoryItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryItemEntityCopyWith<$Res> {
  factory $InventoryItemEntityCopyWith(
          InventoryItemEntity value, $Res Function(InventoryItemEntity) then) =
      _$InventoryItemEntityCopyWithImpl<$Res, InventoryItemEntity>;
  @useResult
  $Res call(
      {String id,
      String societyId,
      String name,
      String category,
      InventoryItemType type,
      int quantity,
      String unit,
      InventoryItemStatus status,
      int? minQuantity,
      String? description,
      String? location,
      List<String>? photos,
      DateTime? createdAt,
      String? createdBy,
      DateTime? updatedAt,
      String? updatedBy});
}

/// @nodoc
class _$InventoryItemEntityCopyWithImpl<$Res, $Val extends InventoryItemEntity>
    implements $InventoryItemEntityCopyWith<$Res> {
  _$InventoryItemEntityCopyWithImpl(this._value, this._then);

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
    Object? type = null,
    Object? quantity = null,
    Object? unit = null,
    Object? status = null,
    Object? minQuantity = freezed,
    Object? description = freezed,
    Object? location = freezed,
    Object? photos = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
    Object? updatedAt = freezed,
    Object? updatedBy = freezed,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InventoryItemType,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InventoryItemStatus,
      minQuantity: freezed == minQuantity
          ? _value.minQuantity
          : minQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: freezed == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryItemEntityImplCopyWith<$Res>
    implements $InventoryItemEntityCopyWith<$Res> {
  factory _$$InventoryItemEntityImplCopyWith(_$InventoryItemEntityImpl value,
          $Res Function(_$InventoryItemEntityImpl) then) =
      __$$InventoryItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String societyId,
      String name,
      String category,
      InventoryItemType type,
      int quantity,
      String unit,
      InventoryItemStatus status,
      int? minQuantity,
      String? description,
      String? location,
      List<String>? photos,
      DateTime? createdAt,
      String? createdBy,
      DateTime? updatedAt,
      String? updatedBy});
}

/// @nodoc
class __$$InventoryItemEntityImplCopyWithImpl<$Res>
    extends _$InventoryItemEntityCopyWithImpl<$Res, _$InventoryItemEntityImpl>
    implements _$$InventoryItemEntityImplCopyWith<$Res> {
  __$$InventoryItemEntityImplCopyWithImpl(_$InventoryItemEntityImpl _value,
      $Res Function(_$InventoryItemEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? name = null,
    Object? category = null,
    Object? type = null,
    Object? quantity = null,
    Object? unit = null,
    Object? status = null,
    Object? minQuantity = freezed,
    Object? description = freezed,
    Object? location = freezed,
    Object? photos = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
    Object? updatedAt = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_$InventoryItemEntityImpl(
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InventoryItemType,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InventoryItemStatus,
      minQuantity: freezed == minQuantity
          ? _value.minQuantity
          : minQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: freezed == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryItemEntityImpl implements _InventoryItemEntity {
  const _$InventoryItemEntityImpl(
      {required this.id,
      required this.societyId,
      required this.name,
      required this.category,
      required this.type,
      required this.quantity,
      required this.unit,
      required this.status,
      this.minQuantity,
      this.description,
      this.location,
      final List<String>? photos,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy})
      : _photos = photos;

  factory _$InventoryItemEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryItemEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String societyId;
  @override
  final String name;
  @override
  final String category;
// e.g., "Electrical", "Tools", "Cleaning"
  @override
  final InventoryItemType type;
  @override
  final int quantity;
  @override
  final String unit;
// e.g., "pieces", "boxes", "sets"
  @override
  final InventoryItemStatus status;
  @override
  final int? minQuantity;
// Alert threshold for consumables
  @override
  final String? description;
  @override
  final String? location;
// Where the item is stored
  final List<String>? _photos;
// Where the item is stored
  @override
  List<String>? get photos {
    final value = _photos;
    if (value == null) return null;
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? createdAt;
  @override
  final String? createdBy;
  @override
  final DateTime? updatedAt;
  @override
  final String? updatedBy;

  @override
  String toString() {
    return 'InventoryItemEntity(id: $id, societyId: $societyId, name: $name, category: $category, type: $type, quantity: $quantity, unit: $unit, status: $status, minQuantity: $minQuantity, description: $description, location: $location, photos: $photos, createdAt: $createdAt, createdBy: $createdBy, updatedAt: $updatedAt, updatedBy: $updatedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryItemEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.societyId, societyId) ||
                other.societyId == societyId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.minQuantity, minQuantity) ||
                other.minQuantity == minQuantity) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      societyId,
      name,
      category,
      type,
      quantity,
      unit,
      status,
      minQuantity,
      description,
      location,
      const DeepCollectionEquality().hash(_photos),
      createdAt,
      createdBy,
      updatedAt,
      updatedBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryItemEntityImplCopyWith<_$InventoryItemEntityImpl> get copyWith =>
      __$$InventoryItemEntityImplCopyWithImpl<_$InventoryItemEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryItemEntityImplToJson(
      this,
    );
  }
}

abstract class _InventoryItemEntity implements InventoryItemEntity {
  const factory _InventoryItemEntity(
      {required final String id,
      required final String societyId,
      required final String name,
      required final String category,
      required final InventoryItemType type,
      required final int quantity,
      required final String unit,
      required final InventoryItemStatus status,
      final int? minQuantity,
      final String? description,
      final String? location,
      final List<String>? photos,
      final DateTime? createdAt,
      final String? createdBy,
      final DateTime? updatedAt,
      final String? updatedBy}) = _$InventoryItemEntityImpl;

  factory _InventoryItemEntity.fromJson(Map<String, dynamic> json) =
      _$InventoryItemEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get societyId;
  @override
  String get name;
  @override
  String get category;
  @override // e.g., "Electrical", "Tools", "Cleaning"
  InventoryItemType get type;
  @override
  int get quantity;
  @override
  String get unit;
  @override // e.g., "pieces", "boxes", "sets"
  InventoryItemStatus get status;
  @override
  int? get minQuantity;
  @override // Alert threshold for consumables
  String? get description;
  @override
  String? get location;
  @override // Where the item is stored
  List<String>? get photos;
  @override
  DateTime? get createdAt;
  @override
  String? get createdBy;
  @override
  DateTime? get updatedAt;
  @override
  String? get updatedBy;
  @override
  @JsonKey(ignore: true)
  _$$InventoryItemEntityImplCopyWith<_$InventoryItemEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InventoryTransactionEntity _$InventoryTransactionEntityFromJson(
    Map<String, dynamic> json) {
  return _InventoryTransactionEntity.fromJson(json);
}

/// @nodoc
mixin _$InventoryTransactionEntity {
  String get id => throw _privateConstructorUsedError;
  String get itemId => throw _privateConstructorUsedError;
  String get societyId => throw _privateConstructorUsedError;
  int get quantityChange =>
      throw _privateConstructorUsedError; // Positive for add, negative for use
  String get transactionType =>
      throw _privateConstructorUsedError; // "add", "use", "adjustment"
  String get reason => throw _privateConstructorUsedError;
  String? get location =>
      throw _privateConstructorUsedError; // Where the item was used/installed
  String? get description => throw _privateConstructorUsedError;
  List<String>? get evidencePhotos =>
      throw _privateConstructorUsedError; // Photos showing where item was used
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get performedBy => throw _privateConstructorUsedError;
  String? get performedByName => throw _privateConstructorUsedError;
  String? get relatedTicketId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryTransactionEntityCopyWith<InventoryTransactionEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryTransactionEntityCopyWith<$Res> {
  factory $InventoryTransactionEntityCopyWith(InventoryTransactionEntity value,
          $Res Function(InventoryTransactionEntity) then) =
      _$InventoryTransactionEntityCopyWithImpl<$Res,
          InventoryTransactionEntity>;
  @useResult
  $Res call(
      {String id,
      String itemId,
      String societyId,
      int quantityChange,
      String transactionType,
      String reason,
      String? location,
      String? description,
      List<String>? evidencePhotos,
      DateTime timestamp,
      String performedBy,
      String? performedByName,
      String? relatedTicketId});
}

/// @nodoc
class _$InventoryTransactionEntityCopyWithImpl<$Res,
        $Val extends InventoryTransactionEntity>
    implements $InventoryTransactionEntityCopyWith<$Res> {
  _$InventoryTransactionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? societyId = null,
    Object? quantityChange = null,
    Object? transactionType = null,
    Object? reason = null,
    Object? location = freezed,
    Object? description = freezed,
    Object? evidencePhotos = freezed,
    Object? timestamp = null,
    Object? performedBy = null,
    Object? performedByName = freezed,
    Object? relatedTicketId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      societyId: null == societyId
          ? _value.societyId
          : societyId // ignore: cast_nullable_to_non_nullable
              as String,
      quantityChange: null == quantityChange
          ? _value.quantityChange
          : quantityChange // ignore: cast_nullable_to_non_nullable
              as int,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      evidencePhotos: freezed == evidencePhotos
          ? _value.evidencePhotos
          : evidencePhotos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      performedBy: null == performedBy
          ? _value.performedBy
          : performedBy // ignore: cast_nullable_to_non_nullable
              as String,
      performedByName: freezed == performedByName
          ? _value.performedByName
          : performedByName // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedTicketId: freezed == relatedTicketId
          ? _value.relatedTicketId
          : relatedTicketId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryTransactionEntityImplCopyWith<$Res>
    implements $InventoryTransactionEntityCopyWith<$Res> {
  factory _$$InventoryTransactionEntityImplCopyWith(
          _$InventoryTransactionEntityImpl value,
          $Res Function(_$InventoryTransactionEntityImpl) then) =
      __$$InventoryTransactionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String itemId,
      String societyId,
      int quantityChange,
      String transactionType,
      String reason,
      String? location,
      String? description,
      List<String>? evidencePhotos,
      DateTime timestamp,
      String performedBy,
      String? performedByName,
      String? relatedTicketId});
}

/// @nodoc
class __$$InventoryTransactionEntityImplCopyWithImpl<$Res>
    extends _$InventoryTransactionEntityCopyWithImpl<$Res,
        _$InventoryTransactionEntityImpl>
    implements _$$InventoryTransactionEntityImplCopyWith<$Res> {
  __$$InventoryTransactionEntityImplCopyWithImpl(
      _$InventoryTransactionEntityImpl _value,
      $Res Function(_$InventoryTransactionEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? societyId = null,
    Object? quantityChange = null,
    Object? transactionType = null,
    Object? reason = null,
    Object? location = freezed,
    Object? description = freezed,
    Object? evidencePhotos = freezed,
    Object? timestamp = null,
    Object? performedBy = null,
    Object? performedByName = freezed,
    Object? relatedTicketId = freezed,
  }) {
    return _then(_$InventoryTransactionEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      societyId: null == societyId
          ? _value.societyId
          : societyId // ignore: cast_nullable_to_non_nullable
              as String,
      quantityChange: null == quantityChange
          ? _value.quantityChange
          : quantityChange // ignore: cast_nullable_to_non_nullable
              as int,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      evidencePhotos: freezed == evidencePhotos
          ? _value._evidencePhotos
          : evidencePhotos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      performedBy: null == performedBy
          ? _value.performedBy
          : performedBy // ignore: cast_nullable_to_non_nullable
              as String,
      performedByName: freezed == performedByName
          ? _value.performedByName
          : performedByName // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedTicketId: freezed == relatedTicketId
          ? _value.relatedTicketId
          : relatedTicketId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryTransactionEntityImpl implements _InventoryTransactionEntity {
  const _$InventoryTransactionEntityImpl(
      {required this.id,
      required this.itemId,
      required this.societyId,
      required this.quantityChange,
      required this.transactionType,
      required this.reason,
      this.location,
      this.description,
      final List<String>? evidencePhotos,
      required this.timestamp,
      required this.performedBy,
      this.performedByName,
      this.relatedTicketId})
      : _evidencePhotos = evidencePhotos;

  factory _$InventoryTransactionEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$InventoryTransactionEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String itemId;
  @override
  final String societyId;
  @override
  final int quantityChange;
// Positive for add, negative for use
  @override
  final String transactionType;
// "add", "use", "adjustment"
  @override
  final String reason;
  @override
  final String? location;
// Where the item was used/installed
  @override
  final String? description;
  final List<String>? _evidencePhotos;
  @override
  List<String>? get evidencePhotos {
    final value = _evidencePhotos;
    if (value == null) return null;
    if (_evidencePhotos is EqualUnmodifiableListView) return _evidencePhotos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// Photos showing where item was used
  @override
  final DateTime timestamp;
  @override
  final String performedBy;
  @override
  final String? performedByName;
  @override
  final String? relatedTicketId;

  @override
  String toString() {
    return 'InventoryTransactionEntity(id: $id, itemId: $itemId, societyId: $societyId, quantityChange: $quantityChange, transactionType: $transactionType, reason: $reason, location: $location, description: $description, evidencePhotos: $evidencePhotos, timestamp: $timestamp, performedBy: $performedBy, performedByName: $performedByName, relatedTicketId: $relatedTicketId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryTransactionEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.societyId, societyId) ||
                other.societyId == societyId) &&
            (identical(other.quantityChange, quantityChange) ||
                other.quantityChange == quantityChange) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._evidencePhotos, _evidencePhotos) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.performedBy, performedBy) ||
                other.performedBy == performedBy) &&
            (identical(other.performedByName, performedByName) ||
                other.performedByName == performedByName) &&
            (identical(other.relatedTicketId, relatedTicketId) ||
                other.relatedTicketId == relatedTicketId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      itemId,
      societyId,
      quantityChange,
      transactionType,
      reason,
      location,
      description,
      const DeepCollectionEquality().hash(_evidencePhotos),
      timestamp,
      performedBy,
      performedByName,
      relatedTicketId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryTransactionEntityImplCopyWith<_$InventoryTransactionEntityImpl>
      get copyWith => __$$InventoryTransactionEntityImplCopyWithImpl<
          _$InventoryTransactionEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryTransactionEntityImplToJson(
      this,
    );
  }
}

abstract class _InventoryTransactionEntity
    implements InventoryTransactionEntity {
  const factory _InventoryTransactionEntity(
      {required final String id,
      required final String itemId,
      required final String societyId,
      required final int quantityChange,
      required final String transactionType,
      required final String reason,
      final String? location,
      final String? description,
      final List<String>? evidencePhotos,
      required final DateTime timestamp,
      required final String performedBy,
      final String? performedByName,
      final String? relatedTicketId}) = _$InventoryTransactionEntityImpl;

  factory _InventoryTransactionEntity.fromJson(Map<String, dynamic> json) =
      _$InventoryTransactionEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get itemId;
  @override
  String get societyId;
  @override
  int get quantityChange;
  @override // Positive for add, negative for use
  String get transactionType;
  @override // "add", "use", "adjustment"
  String get reason;
  @override
  String? get location;
  @override // Where the item was used/installed
  String? get description;
  @override
  List<String>? get evidencePhotos;
  @override // Photos showing where item was used
  DateTime get timestamp;
  @override
  String get performedBy;
  @override
  String? get performedByName;
  @override
  String? get relatedTicketId;
  @override
  @JsonKey(ignore: true)
  _$$InventoryTransactionEntityImplCopyWith<_$InventoryTransactionEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
