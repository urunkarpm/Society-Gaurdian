// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationEntity _$NotificationEntityFromJson(Map<String, dynamic> json) {
  return _NotificationEntity.fromJson(json);
}

/// @nodoc
mixin _$NotificationEntity {
  String get id => throw _privateConstructorUsedError;
  String get societyId => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // visitor, announcement, emergency, payment, complaint, booking
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;
  String? get deepLink => throw _privateConstructorUsedError;
  List<String>? get targetUserIds => throw _privateConstructorUsedError;
  List<String>? get targetFlatIds => throw _privateConstructorUsedError;
  String? get targetRole =>
      throw _privateConstructorUsedError; // resident, security, admin, vendor
  bool? get isSocietyWide => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  String? get createdByName => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  DateTime? get readAt => throw _privateConstructorUsedError;
  String? get readBy => throw _privateConstructorUsedError;
  int get priority =>
      throw _privateConstructorUsedError; // 1=low, 2=normal, 3=high, 4=urgent
  bool get shouldSendPush => throw _privateConstructorUsedError;
  bool get shouldShowInApp => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationEntityCopyWith<NotificationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationEntityCopyWith<$Res> {
  factory $NotificationEntityCopyWith(
          NotificationEntity value, $Res Function(NotificationEntity) then) =
      _$NotificationEntityCopyWithImpl<$Res, NotificationEntity>;
  @useResult
  $Res call(
      {String id,
      String societyId,
      String type,
      String title,
      String body,
      String? imageUrl,
      Map<String, dynamic>? data,
      String? deepLink,
      List<String>? targetUserIds,
      List<String>? targetFlatIds,
      String? targetRole,
      bool? isSocietyWide,
      String? createdBy,
      String? createdByName,
      DateTime? createdAt,
      DateTime? expiresAt,
      bool isRead,
      DateTime? readAt,
      String? readBy,
      int priority,
      bool shouldSendPush,
      bool shouldShowInApp,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$NotificationEntityCopyWithImpl<$Res, $Val extends NotificationEntity>
    implements $NotificationEntityCopyWith<$Res> {
  _$NotificationEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? type = null,
    Object? title = null,
    Object? body = null,
    Object? imageUrl = freezed,
    Object? data = freezed,
    Object? deepLink = freezed,
    Object? targetUserIds = freezed,
    Object? targetFlatIds = freezed,
    Object? targetRole = freezed,
    Object? isSocietyWide = freezed,
    Object? createdBy = freezed,
    Object? createdByName = freezed,
    Object? createdAt = freezed,
    Object? expiresAt = freezed,
    Object? isRead = null,
    Object? readAt = freezed,
    Object? readBy = freezed,
    Object? priority = null,
    Object? shouldSendPush = null,
    Object? shouldShowInApp = null,
    Object? metadata = freezed,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      deepLink: freezed == deepLink
          ? _value.deepLink
          : deepLink // ignore: cast_nullable_to_non_nullable
              as String?,
      targetUserIds: freezed == targetUserIds
          ? _value.targetUserIds
          : targetUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      targetFlatIds: freezed == targetFlatIds
          ? _value.targetFlatIds
          : targetFlatIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      targetRole: freezed == targetRole
          ? _value.targetRole
          : targetRole // ignore: cast_nullable_to_non_nullable
              as String?,
      isSocietyWide: freezed == isSocietyWide
          ? _value.isSocietyWide
          : isSocietyWide // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdByName: freezed == createdByName
          ? _value.createdByName
          : createdByName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readBy: freezed == readBy
          ? _value.readBy
          : readBy // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      shouldSendPush: null == shouldSendPush
          ? _value.shouldSendPush
          : shouldSendPush // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldShowInApp: null == shouldShowInApp
          ? _value.shouldShowInApp
          : shouldShowInApp // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationEntityImplCopyWith<$Res>
    implements $NotificationEntityCopyWith<$Res> {
  factory _$$NotificationEntityImplCopyWith(_$NotificationEntityImpl value,
          $Res Function(_$NotificationEntityImpl) then) =
      __$$NotificationEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String societyId,
      String type,
      String title,
      String body,
      String? imageUrl,
      Map<String, dynamic>? data,
      String? deepLink,
      List<String>? targetUserIds,
      List<String>? targetFlatIds,
      String? targetRole,
      bool? isSocietyWide,
      String? createdBy,
      String? createdByName,
      DateTime? createdAt,
      DateTime? expiresAt,
      bool isRead,
      DateTime? readAt,
      String? readBy,
      int priority,
      bool shouldSendPush,
      bool shouldShowInApp,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$NotificationEntityImplCopyWithImpl<$Res>
    extends _$NotificationEntityCopyWithImpl<$Res, _$NotificationEntityImpl>
    implements _$$NotificationEntityImplCopyWith<$Res> {
  __$$NotificationEntityImplCopyWithImpl(_$NotificationEntityImpl _value,
      $Res Function(_$NotificationEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? type = null,
    Object? title = null,
    Object? body = null,
    Object? imageUrl = freezed,
    Object? data = freezed,
    Object? deepLink = freezed,
    Object? targetUserIds = freezed,
    Object? targetFlatIds = freezed,
    Object? targetRole = freezed,
    Object? isSocietyWide = freezed,
    Object? createdBy = freezed,
    Object? createdByName = freezed,
    Object? createdAt = freezed,
    Object? expiresAt = freezed,
    Object? isRead = null,
    Object? readAt = freezed,
    Object? readBy = freezed,
    Object? priority = null,
    Object? shouldSendPush = null,
    Object? shouldShowInApp = null,
    Object? metadata = freezed,
  }) {
    return _then(_$NotificationEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      societyId: null == societyId
          ? _value.societyId
          : societyId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      deepLink: freezed == deepLink
          ? _value.deepLink
          : deepLink // ignore: cast_nullable_to_non_nullable
              as String?,
      targetUserIds: freezed == targetUserIds
          ? _value._targetUserIds
          : targetUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      targetFlatIds: freezed == targetFlatIds
          ? _value._targetFlatIds
          : targetFlatIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      targetRole: freezed == targetRole
          ? _value.targetRole
          : targetRole // ignore: cast_nullable_to_non_nullable
              as String?,
      isSocietyWide: freezed == isSocietyWide
          ? _value.isSocietyWide
          : isSocietyWide // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdByName: freezed == createdByName
          ? _value.createdByName
          : createdByName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readBy: freezed == readBy
          ? _value.readBy
          : readBy // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      shouldSendPush: null == shouldSendPush
          ? _value.shouldSendPush
          : shouldSendPush // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldShowInApp: null == shouldShowInApp
          ? _value.shouldShowInApp
          : shouldShowInApp // ignore: cast_nullable_to_non_nullable
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
class _$NotificationEntityImpl implements _NotificationEntity {
  const _$NotificationEntityImpl(
      {required this.id,
      required this.societyId,
      required this.type,
      required this.title,
      required this.body,
      this.imageUrl,
      final Map<String, dynamic>? data,
      this.deepLink,
      final List<String>? targetUserIds,
      final List<String>? targetFlatIds,
      this.targetRole,
      this.isSocietyWide,
      this.createdBy,
      this.createdByName,
      this.createdAt,
      this.expiresAt,
      this.isRead = false,
      this.readAt,
      this.readBy,
      this.priority = 0,
      this.shouldSendPush = true,
      this.shouldShowInApp = true,
      final Map<String, dynamic>? metadata})
      : _data = data,
        _targetUserIds = targetUserIds,
        _targetFlatIds = targetFlatIds,
        _metadata = metadata;

  factory _$NotificationEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String societyId;
  @override
  final String type;
// visitor, announcement, emergency, payment, complaint, booking
  @override
  final String title;
  @override
  final String body;
  @override
  final String? imageUrl;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? deepLink;
  final List<String>? _targetUserIds;
  @override
  List<String>? get targetUserIds {
    final value = _targetUserIds;
    if (value == null) return null;
    if (_targetUserIds is EqualUnmodifiableListView) return _targetUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _targetFlatIds;
  @override
  List<String>? get targetFlatIds {
    final value = _targetFlatIds;
    if (value == null) return null;
    if (_targetFlatIds is EqualUnmodifiableListView) return _targetFlatIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? targetRole;
// resident, security, admin, vendor
  @override
  final bool? isSocietyWide;
  @override
  final String? createdBy;
  @override
  final String? createdByName;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? expiresAt;
  @override
  @JsonKey()
  final bool isRead;
  @override
  final DateTime? readAt;
  @override
  final String? readBy;
  @override
  @JsonKey()
  final int priority;
// 1=low, 2=normal, 3=high, 4=urgent
  @override
  @JsonKey()
  final bool shouldSendPush;
  @override
  @JsonKey()
  final bool shouldShowInApp;
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
    return 'NotificationEntity(id: $id, societyId: $societyId, type: $type, title: $title, body: $body, imageUrl: $imageUrl, data: $data, deepLink: $deepLink, targetUserIds: $targetUserIds, targetFlatIds: $targetFlatIds, targetRole: $targetRole, isSocietyWide: $isSocietyWide, createdBy: $createdBy, createdByName: $createdByName, createdAt: $createdAt, expiresAt: $expiresAt, isRead: $isRead, readAt: $readAt, readBy: $readBy, priority: $priority, shouldSendPush: $shouldSendPush, shouldShowInApp: $shouldShowInApp, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.societyId, societyId) ||
                other.societyId == societyId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.deepLink, deepLink) ||
                other.deepLink == deepLink) &&
            const DeepCollectionEquality()
                .equals(other._targetUserIds, _targetUserIds) &&
            const DeepCollectionEquality()
                .equals(other._targetFlatIds, _targetFlatIds) &&
            (identical(other.targetRole, targetRole) ||
                other.targetRole == targetRole) &&
            (identical(other.isSocietyWide, isSocietyWide) ||
                other.isSocietyWide == isSocietyWide) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdByName, createdByName) ||
                other.createdByName == createdByName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.readAt, readAt) || other.readAt == readAt) &&
            (identical(other.readBy, readBy) || other.readBy == readBy) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.shouldSendPush, shouldSendPush) ||
                other.shouldSendPush == shouldSendPush) &&
            (identical(other.shouldShowInApp, shouldShowInApp) ||
                other.shouldShowInApp == shouldShowInApp) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        societyId,
        type,
        title,
        body,
        imageUrl,
        const DeepCollectionEquality().hash(_data),
        deepLink,
        const DeepCollectionEquality().hash(_targetUserIds),
        const DeepCollectionEquality().hash(_targetFlatIds),
        targetRole,
        isSocietyWide,
        createdBy,
        createdByName,
        createdAt,
        expiresAt,
        isRead,
        readAt,
        readBy,
        priority,
        shouldSendPush,
        shouldShowInApp,
        const DeepCollectionEquality().hash(_metadata)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationEntityImplCopyWith<_$NotificationEntityImpl> get copyWith =>
      __$$NotificationEntityImplCopyWithImpl<_$NotificationEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationEntityImplToJson(
      this,
    );
  }
}

abstract class _NotificationEntity implements NotificationEntity {
  const factory _NotificationEntity(
      {required final String id,
      required final String societyId,
      required final String type,
      required final String title,
      required final String body,
      final String? imageUrl,
      final Map<String, dynamic>? data,
      final String? deepLink,
      final List<String>? targetUserIds,
      final List<String>? targetFlatIds,
      final String? targetRole,
      final bool? isSocietyWide,
      final String? createdBy,
      final String? createdByName,
      final DateTime? createdAt,
      final DateTime? expiresAt,
      final bool isRead,
      final DateTime? readAt,
      final String? readBy,
      final int priority,
      final bool shouldSendPush,
      final bool shouldShowInApp,
      final Map<String, dynamic>? metadata}) = _$NotificationEntityImpl;

  factory _NotificationEntity.fromJson(Map<String, dynamic> json) =
      _$NotificationEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get societyId;
  @override
  String get type;
  @override // visitor, announcement, emergency, payment, complaint, booking
  String get title;
  @override
  String get body;
  @override
  String? get imageUrl;
  @override
  Map<String, dynamic>? get data;
  @override
  String? get deepLink;
  @override
  List<String>? get targetUserIds;
  @override
  List<String>? get targetFlatIds;
  @override
  String? get targetRole;
  @override // resident, security, admin, vendor
  bool? get isSocietyWide;
  @override
  String? get createdBy;
  @override
  String? get createdByName;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get expiresAt;
  @override
  bool get isRead;
  @override
  DateTime? get readAt;
  @override
  String? get readBy;
  @override
  int get priority;
  @override // 1=low, 2=normal, 3=high, 4=urgent
  bool get shouldSendPush;
  @override
  bool get shouldShowInApp;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$NotificationEntityImplCopyWith<_$NotificationEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ComplaintEntity _$ComplaintEntityFromJson(Map<String, dynamic> json) {
  return _ComplaintEntity.fromJson(json);
}

/// @nodoc
mixin _$ComplaintEntity {
  String get id => throw _privateConstructorUsedError;
  String get societyId => throw _privateConstructorUsedError;
  String get flatId => throw _privateConstructorUsedError;
  String get raisedBy => throw _privateConstructorUsedError;
  String? get raiserName => throw _privateConstructorUsedError;
  String? get raiserPhone => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category =>
      throw _privateConstructorUsedError; // maintenance, cleaning, security, electrical, plumbing, other
  String? get subCategory => throw _privateConstructorUsedError;
  List<String>? get photos => throw _privateConstructorUsedError;
  List<String>? get videos => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get preferredDate => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  TimeOfDay? get preferredTime => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // open, in_progress, resolved, closed
  String? get assignedTo => throw _privateConstructorUsedError;
  String? get assignedToName => throw _privateConstructorUsedError;
  DateTime? get assignedAt => throw _privateConstructorUsedError;
  String? get resolution => throw _privateConstructorUsedError;
  String? get resolvedBy => throw _privateConstructorUsedError;
  DateTime? get resolvedAt => throw _privateConstructorUsedError;
  DateTime? get closedAt => throw _privateConstructorUsedError;
  double? get cost => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get paymentId => throw _privateConstructorUsedError;
  bool? get isPaid => throw _privateConstructorUsedError;
  List<ComplaintUpdate>? get updates => throw _privateConstructorUsedError;
  int? get priority =>
      throw _privateConstructorUsedError; // 1=low, 2=normal, 3=high, 4=urgent
  DateTime? get slaDeadline => throw _privateConstructorUsedError;
  bool? get isSlaBreached => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComplaintEntityCopyWith<ComplaintEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComplaintEntityCopyWith<$Res> {
  factory $ComplaintEntityCopyWith(
          ComplaintEntity value, $Res Function(ComplaintEntity) then) =
      _$ComplaintEntityCopyWithImpl<$Res, ComplaintEntity>;
  @useResult
  $Res call(
      {String id,
      String societyId,
      String flatId,
      String raisedBy,
      String? raiserName,
      String? raiserPhone,
      String title,
      String description,
      String category,
      String? subCategory,
      List<String>? photos,
      List<String>? videos,
      String? location,
      String? preferredDate,
      @JsonKey(includeFromJson: false, includeToJson: false)
      TimeOfDay? preferredTime,
      String status,
      String? assignedTo,
      String? assignedToName,
      DateTime? assignedAt,
      String? resolution,
      String? resolvedBy,
      DateTime? resolvedAt,
      DateTime? closedAt,
      double? cost,
      String? currency,
      String? paymentId,
      bool? isPaid,
      List<ComplaintUpdate>? updates,
      int? priority,
      DateTime? slaDeadline,
      bool? isSlaBreached,
      Map<String, dynamic>? metadata,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$ComplaintEntityCopyWithImpl<$Res, $Val extends ComplaintEntity>
    implements $ComplaintEntityCopyWith<$Res> {
  _$ComplaintEntityCopyWithImpl(this._value, this._then);

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
    Object? raisedBy = null,
    Object? raiserName = freezed,
    Object? raiserPhone = freezed,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? subCategory = freezed,
    Object? photos = freezed,
    Object? videos = freezed,
    Object? location = freezed,
    Object? preferredDate = freezed,
    Object? preferredTime = freezed,
    Object? status = null,
    Object? assignedTo = freezed,
    Object? assignedToName = freezed,
    Object? assignedAt = freezed,
    Object? resolution = freezed,
    Object? resolvedBy = freezed,
    Object? resolvedAt = freezed,
    Object? closedAt = freezed,
    Object? cost = freezed,
    Object? currency = freezed,
    Object? paymentId = freezed,
    Object? isPaid = freezed,
    Object? updates = freezed,
    Object? priority = freezed,
    Object? slaDeadline = freezed,
    Object? isSlaBreached = freezed,
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
      flatId: null == flatId
          ? _value.flatId
          : flatId // ignore: cast_nullable_to_non_nullable
              as String,
      raisedBy: null == raisedBy
          ? _value.raisedBy
          : raisedBy // ignore: cast_nullable_to_non_nullable
              as String,
      raiserName: freezed == raiserName
          ? _value.raiserName
          : raiserName // ignore: cast_nullable_to_non_nullable
              as String?,
      raiserPhone: freezed == raiserPhone
          ? _value.raiserPhone
          : raiserPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      subCategory: freezed == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: freezed == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      videos: freezed == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      preferredDate: freezed == preferredDate
          ? _value.preferredDate
          : preferredDate // ignore: cast_nullable_to_non_nullable
              as String?,
      preferredTime: freezed == preferredTime
          ? _value.preferredTime
          : preferredTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedToName: freezed == assignedToName
          ? _value.assignedToName
          : assignedToName // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedAt: freezed == assignedAt
          ? _value.assignedAt
          : assignedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as String?,
      resolvedBy: freezed == resolvedBy
          ? _value.resolvedBy
          : resolvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      resolvedAt: freezed == resolvedAt
          ? _value.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closedAt: freezed == closedAt
          ? _value.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      isPaid: freezed == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      updates: freezed == updates
          ? _value.updates
          : updates // ignore: cast_nullable_to_non_nullable
              as List<ComplaintUpdate>?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      slaDeadline: freezed == slaDeadline
          ? _value.slaDeadline
          : slaDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSlaBreached: freezed == isSlaBreached
          ? _value.isSlaBreached
          : isSlaBreached // ignore: cast_nullable_to_non_nullable
              as bool?,
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
abstract class _$$ComplaintEntityImplCopyWith<$Res>
    implements $ComplaintEntityCopyWith<$Res> {
  factory _$$ComplaintEntityImplCopyWith(_$ComplaintEntityImpl value,
          $Res Function(_$ComplaintEntityImpl) then) =
      __$$ComplaintEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String societyId,
      String flatId,
      String raisedBy,
      String? raiserName,
      String? raiserPhone,
      String title,
      String description,
      String category,
      String? subCategory,
      List<String>? photos,
      List<String>? videos,
      String? location,
      String? preferredDate,
      @JsonKey(includeFromJson: false, includeToJson: false)
      TimeOfDay? preferredTime,
      String status,
      String? assignedTo,
      String? assignedToName,
      DateTime? assignedAt,
      String? resolution,
      String? resolvedBy,
      DateTime? resolvedAt,
      DateTime? closedAt,
      double? cost,
      String? currency,
      String? paymentId,
      bool? isPaid,
      List<ComplaintUpdate>? updates,
      int? priority,
      DateTime? slaDeadline,
      bool? isSlaBreached,
      Map<String, dynamic>? metadata,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$ComplaintEntityImplCopyWithImpl<$Res>
    extends _$ComplaintEntityCopyWithImpl<$Res, _$ComplaintEntityImpl>
    implements _$$ComplaintEntityImplCopyWith<$Res> {
  __$$ComplaintEntityImplCopyWithImpl(
      _$ComplaintEntityImpl _value, $Res Function(_$ComplaintEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? flatId = null,
    Object? raisedBy = null,
    Object? raiserName = freezed,
    Object? raiserPhone = freezed,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? subCategory = freezed,
    Object? photos = freezed,
    Object? videos = freezed,
    Object? location = freezed,
    Object? preferredDate = freezed,
    Object? preferredTime = freezed,
    Object? status = null,
    Object? assignedTo = freezed,
    Object? assignedToName = freezed,
    Object? assignedAt = freezed,
    Object? resolution = freezed,
    Object? resolvedBy = freezed,
    Object? resolvedAt = freezed,
    Object? closedAt = freezed,
    Object? cost = freezed,
    Object? currency = freezed,
    Object? paymentId = freezed,
    Object? isPaid = freezed,
    Object? updates = freezed,
    Object? priority = freezed,
    Object? slaDeadline = freezed,
    Object? isSlaBreached = freezed,
    Object? metadata = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ComplaintEntityImpl(
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
      raisedBy: null == raisedBy
          ? _value.raisedBy
          : raisedBy // ignore: cast_nullable_to_non_nullable
              as String,
      raiserName: freezed == raiserName
          ? _value.raiserName
          : raiserName // ignore: cast_nullable_to_non_nullable
              as String?,
      raiserPhone: freezed == raiserPhone
          ? _value.raiserPhone
          : raiserPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      subCategory: freezed == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: freezed == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      videos: freezed == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      preferredDate: freezed == preferredDate
          ? _value.preferredDate
          : preferredDate // ignore: cast_nullable_to_non_nullable
              as String?,
      preferredTime: freezed == preferredTime
          ? _value.preferredTime
          : preferredTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedToName: freezed == assignedToName
          ? _value.assignedToName
          : assignedToName // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedAt: freezed == assignedAt
          ? _value.assignedAt
          : assignedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as String?,
      resolvedBy: freezed == resolvedBy
          ? _value.resolvedBy
          : resolvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      resolvedAt: freezed == resolvedAt
          ? _value.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closedAt: freezed == closedAt
          ? _value.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      isPaid: freezed == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      updates: freezed == updates
          ? _value._updates
          : updates // ignore: cast_nullable_to_non_nullable
              as List<ComplaintUpdate>?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      slaDeadline: freezed == slaDeadline
          ? _value.slaDeadline
          : slaDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSlaBreached: freezed == isSlaBreached
          ? _value.isSlaBreached
          : isSlaBreached // ignore: cast_nullable_to_non_nullable
              as bool?,
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
class _$ComplaintEntityImpl implements _ComplaintEntity {
  const _$ComplaintEntityImpl(
      {required this.id,
      required this.societyId,
      required this.flatId,
      required this.raisedBy,
      this.raiserName,
      this.raiserPhone,
      required this.title,
      required this.description,
      required this.category,
      this.subCategory,
      final List<String>? photos,
      final List<String>? videos,
      this.location,
      this.preferredDate,
      @JsonKey(includeFromJson: false, includeToJson: false) this.preferredTime,
      this.status = 'open',
      this.assignedTo,
      this.assignedToName,
      this.assignedAt,
      this.resolution,
      this.resolvedBy,
      this.resolvedAt,
      this.closedAt,
      this.cost,
      this.currency,
      this.paymentId,
      this.isPaid,
      final List<ComplaintUpdate>? updates,
      this.priority,
      this.slaDeadline,
      this.isSlaBreached,
      final Map<String, dynamic>? metadata,
      this.createdAt,
      this.updatedAt})
      : _photos = photos,
        _videos = videos,
        _updates = updates,
        _metadata = metadata;

  factory _$ComplaintEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComplaintEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String societyId;
  @override
  final String flatId;
  @override
  final String raisedBy;
  @override
  final String? raiserName;
  @override
  final String? raiserPhone;
  @override
  final String title;
  @override
  final String description;
  @override
  final String category;
// maintenance, cleaning, security, electrical, plumbing, other
  @override
  final String? subCategory;
  final List<String>? _photos;
  @override
  List<String>? get photos {
    final value = _photos;
    if (value == null) return null;
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _videos;
  @override
  List<String>? get videos {
    final value = _videos;
    if (value == null) return null;
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? location;
  @override
  final String? preferredDate;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final TimeOfDay? preferredTime;
  @override
  @JsonKey()
  final String status;
// open, in_progress, resolved, closed
  @override
  final String? assignedTo;
  @override
  final String? assignedToName;
  @override
  final DateTime? assignedAt;
  @override
  final String? resolution;
  @override
  final String? resolvedBy;
  @override
  final DateTime? resolvedAt;
  @override
  final DateTime? closedAt;
  @override
  final double? cost;
  @override
  final String? currency;
  @override
  final String? paymentId;
  @override
  final bool? isPaid;
  final List<ComplaintUpdate>? _updates;
  @override
  List<ComplaintUpdate>? get updates {
    final value = _updates;
    if (value == null) return null;
    if (_updates is EqualUnmodifiableListView) return _updates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? priority;
// 1=low, 2=normal, 3=high, 4=urgent
  @override
  final DateTime? slaDeadline;
  @override
  final bool? isSlaBreached;
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
    return 'ComplaintEntity(id: $id, societyId: $societyId, flatId: $flatId, raisedBy: $raisedBy, raiserName: $raiserName, raiserPhone: $raiserPhone, title: $title, description: $description, category: $category, subCategory: $subCategory, photos: $photos, videos: $videos, location: $location, preferredDate: $preferredDate, preferredTime: $preferredTime, status: $status, assignedTo: $assignedTo, assignedToName: $assignedToName, assignedAt: $assignedAt, resolution: $resolution, resolvedBy: $resolvedBy, resolvedAt: $resolvedAt, closedAt: $closedAt, cost: $cost, currency: $currency, paymentId: $paymentId, isPaid: $isPaid, updates: $updates, priority: $priority, slaDeadline: $slaDeadline, isSlaBreached: $isSlaBreached, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComplaintEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.societyId, societyId) ||
                other.societyId == societyId) &&
            (identical(other.flatId, flatId) || other.flatId == flatId) &&
            (identical(other.raisedBy, raisedBy) ||
                other.raisedBy == raisedBy) &&
            (identical(other.raiserName, raiserName) ||
                other.raiserName == raiserName) &&
            (identical(other.raiserPhone, raiserPhone) ||
                other.raiserPhone == raiserPhone) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.subCategory, subCategory) ||
                other.subCategory == subCategory) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            const DeepCollectionEquality().equals(other._videos, _videos) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.preferredDate, preferredDate) ||
                other.preferredDate == preferredDate) &&
            (identical(other.preferredTime, preferredTime) ||
                other.preferredTime == preferredTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            (identical(other.assignedToName, assignedToName) ||
                other.assignedToName == assignedToName) &&
            (identical(other.assignedAt, assignedAt) ||
                other.assignedAt == assignedAt) &&
            (identical(other.resolution, resolution) ||
                other.resolution == resolution) &&
            (identical(other.resolvedBy, resolvedBy) ||
                other.resolvedBy == resolvedBy) &&
            (identical(other.resolvedAt, resolvedAt) ||
                other.resolvedAt == resolvedAt) &&
            (identical(other.closedAt, closedAt) ||
                other.closedAt == closedAt) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            const DeepCollectionEquality().equals(other._updates, _updates) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.slaDeadline, slaDeadline) ||
                other.slaDeadline == slaDeadline) &&
            (identical(other.isSlaBreached, isSlaBreached) ||
                other.isSlaBreached == isSlaBreached) &&
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
        flatId,
        raisedBy,
        raiserName,
        raiserPhone,
        title,
        description,
        category,
        subCategory,
        const DeepCollectionEquality().hash(_photos),
        const DeepCollectionEquality().hash(_videos),
        location,
        preferredDate,
        preferredTime,
        status,
        assignedTo,
        assignedToName,
        assignedAt,
        resolution,
        resolvedBy,
        resolvedAt,
        closedAt,
        cost,
        currency,
        paymentId,
        isPaid,
        const DeepCollectionEquality().hash(_updates),
        priority,
        slaDeadline,
        isSlaBreached,
        const DeepCollectionEquality().hash(_metadata),
        createdAt,
        updatedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComplaintEntityImplCopyWith<_$ComplaintEntityImpl> get copyWith =>
      __$$ComplaintEntityImplCopyWithImpl<_$ComplaintEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComplaintEntityImplToJson(
      this,
    );
  }
}

abstract class _ComplaintEntity implements ComplaintEntity {
  const factory _ComplaintEntity(
      {required final String id,
      required final String societyId,
      required final String flatId,
      required final String raisedBy,
      final String? raiserName,
      final String? raiserPhone,
      required final String title,
      required final String description,
      required final String category,
      final String? subCategory,
      final List<String>? photos,
      final List<String>? videos,
      final String? location,
      final String? preferredDate,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final TimeOfDay? preferredTime,
      final String status,
      final String? assignedTo,
      final String? assignedToName,
      final DateTime? assignedAt,
      final String? resolution,
      final String? resolvedBy,
      final DateTime? resolvedAt,
      final DateTime? closedAt,
      final double? cost,
      final String? currency,
      final String? paymentId,
      final bool? isPaid,
      final List<ComplaintUpdate>? updates,
      final int? priority,
      final DateTime? slaDeadline,
      final bool? isSlaBreached,
      final Map<String, dynamic>? metadata,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$ComplaintEntityImpl;

  factory _ComplaintEntity.fromJson(Map<String, dynamic> json) =
      _$ComplaintEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get societyId;
  @override
  String get flatId;
  @override
  String get raisedBy;
  @override
  String? get raiserName;
  @override
  String? get raiserPhone;
  @override
  String get title;
  @override
  String get description;
  @override
  String get category;
  @override // maintenance, cleaning, security, electrical, plumbing, other
  String? get subCategory;
  @override
  List<String>? get photos;
  @override
  List<String>? get videos;
  @override
  String? get location;
  @override
  String? get preferredDate;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  TimeOfDay? get preferredTime;
  @override
  String get status;
  @override // open, in_progress, resolved, closed
  String? get assignedTo;
  @override
  String? get assignedToName;
  @override
  DateTime? get assignedAt;
  @override
  String? get resolution;
  @override
  String? get resolvedBy;
  @override
  DateTime? get resolvedAt;
  @override
  DateTime? get closedAt;
  @override
  double? get cost;
  @override
  String? get currency;
  @override
  String? get paymentId;
  @override
  bool? get isPaid;
  @override
  List<ComplaintUpdate>? get updates;
  @override
  int? get priority;
  @override // 1=low, 2=normal, 3=high, 4=urgent
  DateTime? get slaDeadline;
  @override
  bool? get isSlaBreached;
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ComplaintEntityImplCopyWith<_$ComplaintEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ComplaintUpdate _$ComplaintUpdateFromJson(Map<String, dynamic> json) {
  return _ComplaintUpdate.fromJson(json);
}

/// @nodoc
mixin _$ComplaintUpdate {
  String get id => throw _privateConstructorUsedError;
  String get complaintId => throw _privateConstructorUsedError;
  String get updatedBy => throw _privateConstructorUsedError;
  String? get updaterName => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<String>? get photos => throw _privateConstructorUsedError;
  DateTime? get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComplaintUpdateCopyWith<ComplaintUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComplaintUpdateCopyWith<$Res> {
  factory $ComplaintUpdateCopyWith(
          ComplaintUpdate value, $Res Function(ComplaintUpdate) then) =
      _$ComplaintUpdateCopyWithImpl<$Res, ComplaintUpdate>;
  @useResult
  $Res call(
      {String id,
      String complaintId,
      String updatedBy,
      String? updaterName,
      String status,
      String? message,
      List<String>? photos,
      DateTime? timestamp});
}

/// @nodoc
class _$ComplaintUpdateCopyWithImpl<$Res, $Val extends ComplaintUpdate>
    implements $ComplaintUpdateCopyWith<$Res> {
  _$ComplaintUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? complaintId = null,
    Object? updatedBy = null,
    Object? updaterName = freezed,
    Object? status = null,
    Object? message = freezed,
    Object? photos = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      complaintId: null == complaintId
          ? _value.complaintId
          : complaintId // ignore: cast_nullable_to_non_nullable
              as String,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      updaterName: freezed == updaterName
          ? _value.updaterName
          : updaterName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: freezed == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComplaintUpdateImplCopyWith<$Res>
    implements $ComplaintUpdateCopyWith<$Res> {
  factory _$$ComplaintUpdateImplCopyWith(_$ComplaintUpdateImpl value,
          $Res Function(_$ComplaintUpdateImpl) then) =
      __$$ComplaintUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String complaintId,
      String updatedBy,
      String? updaterName,
      String status,
      String? message,
      List<String>? photos,
      DateTime? timestamp});
}

/// @nodoc
class __$$ComplaintUpdateImplCopyWithImpl<$Res>
    extends _$ComplaintUpdateCopyWithImpl<$Res, _$ComplaintUpdateImpl>
    implements _$$ComplaintUpdateImplCopyWith<$Res> {
  __$$ComplaintUpdateImplCopyWithImpl(
      _$ComplaintUpdateImpl _value, $Res Function(_$ComplaintUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? complaintId = null,
    Object? updatedBy = null,
    Object? updaterName = freezed,
    Object? status = null,
    Object? message = freezed,
    Object? photos = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_$ComplaintUpdateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      complaintId: null == complaintId
          ? _value.complaintId
          : complaintId // ignore: cast_nullable_to_non_nullable
              as String,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      updaterName: freezed == updaterName
          ? _value.updaterName
          : updaterName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: freezed == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ComplaintUpdateImpl implements _ComplaintUpdate {
  const _$ComplaintUpdateImpl(
      {required this.id,
      required this.complaintId,
      required this.updatedBy,
      this.updaterName,
      required this.status,
      this.message,
      final List<String>? photos,
      this.timestamp})
      : _photos = photos;

  factory _$ComplaintUpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComplaintUpdateImplFromJson(json);

  @override
  final String id;
  @override
  final String complaintId;
  @override
  final String updatedBy;
  @override
  final String? updaterName;
  @override
  final String status;
  @override
  final String? message;
  final List<String>? _photos;
  @override
  List<String>? get photos {
    final value = _photos;
    if (value == null) return null;
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? timestamp;

  @override
  String toString() {
    return 'ComplaintUpdate(id: $id, complaintId: $complaintId, updatedBy: $updatedBy, updaterName: $updaterName, status: $status, message: $message, photos: $photos, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComplaintUpdateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.complaintId, complaintId) ||
                other.complaintId == complaintId) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.updaterName, updaterName) ||
                other.updaterName == updaterName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      complaintId,
      updatedBy,
      updaterName,
      status,
      message,
      const DeepCollectionEquality().hash(_photos),
      timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComplaintUpdateImplCopyWith<_$ComplaintUpdateImpl> get copyWith =>
      __$$ComplaintUpdateImplCopyWithImpl<_$ComplaintUpdateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComplaintUpdateImplToJson(
      this,
    );
  }
}

abstract class _ComplaintUpdate implements ComplaintUpdate {
  const factory _ComplaintUpdate(
      {required final String id,
      required final String complaintId,
      required final String updatedBy,
      final String? updaterName,
      required final String status,
      final String? message,
      final List<String>? photos,
      final DateTime? timestamp}) = _$ComplaintUpdateImpl;

  factory _ComplaintUpdate.fromJson(Map<String, dynamic> json) =
      _$ComplaintUpdateImpl.fromJson;

  @override
  String get id;
  @override
  String get complaintId;
  @override
  String get updatedBy;
  @override
  String? get updaterName;
  @override
  String get status;
  @override
  String? get message;
  @override
  List<String>? get photos;
  @override
  DateTime? get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$ComplaintUpdateImplCopyWith<_$ComplaintUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnnouncementEntity _$AnnouncementEntityFromJson(Map<String, dynamic> json) {
  return _AnnouncementEntity.fromJson(json);
}

/// @nodoc
mixin _$AnnouncementEntity {
  String get id => throw _privateConstructorUsedError;
  String get societyId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String? get category =>
      throw _privateConstructorUsedError; // general, emergency, event, maintenance, rule
  List<String>? get attachments => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get postedBy => throw _privateConstructorUsedError;
  String? get postedByName => throw _privateConstructorUsedError;
  DateTime? get postedAt => throw _privateConstructorUsedError;
  DateTime? get validFrom => throw _privateConstructorUsedError;
  DateTime? get validUntil => throw _privateConstructorUsedError;
  bool get isPinned => throw _privateConstructorUsedError;
  bool get isEmergency => throw _privateConstructorUsedError;
  List<String>? get targetBuildings => throw _privateConstructorUsedError;
  List<String>? get targetFlats => throw _privateConstructorUsedError;
  bool? get isSocietyWide => throw _privateConstructorUsedError;
  int? get viewCount => throw _privateConstructorUsedError;
  Map<String, int>? get readByFlat => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnnouncementEntityCopyWith<AnnouncementEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementEntityCopyWith<$Res> {
  factory $AnnouncementEntityCopyWith(
          AnnouncementEntity value, $Res Function(AnnouncementEntity) then) =
      _$AnnouncementEntityCopyWithImpl<$Res, AnnouncementEntity>;
  @useResult
  $Res call(
      {String id,
      String societyId,
      String title,
      String content,
      String? category,
      List<String>? attachments,
      String? imageUrl,
      String? postedBy,
      String? postedByName,
      DateTime? postedAt,
      DateTime? validFrom,
      DateTime? validUntil,
      bool isPinned,
      bool isEmergency,
      List<String>? targetBuildings,
      List<String>? targetFlats,
      bool? isSocietyWide,
      int? viewCount,
      Map<String, int>? readByFlat,
      Map<String, dynamic>? metadata,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$AnnouncementEntityCopyWithImpl<$Res, $Val extends AnnouncementEntity>
    implements $AnnouncementEntityCopyWith<$Res> {
  _$AnnouncementEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? title = null,
    Object? content = null,
    Object? category = freezed,
    Object? attachments = freezed,
    Object? imageUrl = freezed,
    Object? postedBy = freezed,
    Object? postedByName = freezed,
    Object? postedAt = freezed,
    Object? validFrom = freezed,
    Object? validUntil = freezed,
    Object? isPinned = null,
    Object? isEmergency = null,
    Object? targetBuildings = freezed,
    Object? targetFlats = freezed,
    Object? isSocietyWide = freezed,
    Object? viewCount = freezed,
    Object? readByFlat = freezed,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: freezed == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      postedBy: freezed == postedBy
          ? _value.postedBy
          : postedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      postedByName: freezed == postedByName
          ? _value.postedByName
          : postedByName // ignore: cast_nullable_to_non_nullable
              as String?,
      postedAt: freezed == postedAt
          ? _value.postedAt
          : postedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      validFrom: freezed == validFrom
          ? _value.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      validUntil: freezed == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPinned: null == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      isEmergency: null == isEmergency
          ? _value.isEmergency
          : isEmergency // ignore: cast_nullable_to_non_nullable
              as bool,
      targetBuildings: freezed == targetBuildings
          ? _value.targetBuildings
          : targetBuildings // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      targetFlats: freezed == targetFlats
          ? _value.targetFlats
          : targetFlats // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isSocietyWide: freezed == isSocietyWide
          ? _value.isSocietyWide
          : isSocietyWide // ignore: cast_nullable_to_non_nullable
              as bool?,
      viewCount: freezed == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      readByFlat: freezed == readByFlat
          ? _value.readByFlat
          : readByFlat // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
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
abstract class _$$AnnouncementEntityImplCopyWith<$Res>
    implements $AnnouncementEntityCopyWith<$Res> {
  factory _$$AnnouncementEntityImplCopyWith(_$AnnouncementEntityImpl value,
          $Res Function(_$AnnouncementEntityImpl) then) =
      __$$AnnouncementEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String societyId,
      String title,
      String content,
      String? category,
      List<String>? attachments,
      String? imageUrl,
      String? postedBy,
      String? postedByName,
      DateTime? postedAt,
      DateTime? validFrom,
      DateTime? validUntil,
      bool isPinned,
      bool isEmergency,
      List<String>? targetBuildings,
      List<String>? targetFlats,
      bool? isSocietyWide,
      int? viewCount,
      Map<String, int>? readByFlat,
      Map<String, dynamic>? metadata,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$AnnouncementEntityImplCopyWithImpl<$Res>
    extends _$AnnouncementEntityCopyWithImpl<$Res, _$AnnouncementEntityImpl>
    implements _$$AnnouncementEntityImplCopyWith<$Res> {
  __$$AnnouncementEntityImplCopyWithImpl(_$AnnouncementEntityImpl _value,
      $Res Function(_$AnnouncementEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? title = null,
    Object? content = null,
    Object? category = freezed,
    Object? attachments = freezed,
    Object? imageUrl = freezed,
    Object? postedBy = freezed,
    Object? postedByName = freezed,
    Object? postedAt = freezed,
    Object? validFrom = freezed,
    Object? validUntil = freezed,
    Object? isPinned = null,
    Object? isEmergency = null,
    Object? targetBuildings = freezed,
    Object? targetFlats = freezed,
    Object? isSocietyWide = freezed,
    Object? viewCount = freezed,
    Object? readByFlat = freezed,
    Object? metadata = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$AnnouncementEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      societyId: null == societyId
          ? _value.societyId
          : societyId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: freezed == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      postedBy: freezed == postedBy
          ? _value.postedBy
          : postedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      postedByName: freezed == postedByName
          ? _value.postedByName
          : postedByName // ignore: cast_nullable_to_non_nullable
              as String?,
      postedAt: freezed == postedAt
          ? _value.postedAt
          : postedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      validFrom: freezed == validFrom
          ? _value.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      validUntil: freezed == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPinned: null == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      isEmergency: null == isEmergency
          ? _value.isEmergency
          : isEmergency // ignore: cast_nullable_to_non_nullable
              as bool,
      targetBuildings: freezed == targetBuildings
          ? _value._targetBuildings
          : targetBuildings // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      targetFlats: freezed == targetFlats
          ? _value._targetFlats
          : targetFlats // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isSocietyWide: freezed == isSocietyWide
          ? _value.isSocietyWide
          : isSocietyWide // ignore: cast_nullable_to_non_nullable
              as bool?,
      viewCount: freezed == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      readByFlat: freezed == readByFlat
          ? _value._readByFlat
          : readByFlat // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
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
class _$AnnouncementEntityImpl implements _AnnouncementEntity {
  const _$AnnouncementEntityImpl(
      {required this.id,
      required this.societyId,
      required this.title,
      required this.content,
      this.category,
      final List<String>? attachments,
      this.imageUrl,
      this.postedBy,
      this.postedByName,
      this.postedAt,
      this.validFrom,
      this.validUntil,
      this.isPinned = false,
      this.isEmergency = false,
      final List<String>? targetBuildings,
      final List<String>? targetFlats,
      this.isSocietyWide,
      this.viewCount,
      final Map<String, int>? readByFlat,
      final Map<String, dynamic>? metadata,
      this.createdAt,
      this.updatedAt})
      : _attachments = attachments,
        _targetBuildings = targetBuildings,
        _targetFlats = targetFlats,
        _readByFlat = readByFlat,
        _metadata = metadata;

  factory _$AnnouncementEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnnouncementEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String societyId;
  @override
  final String title;
  @override
  final String content;
  @override
  final String? category;
// general, emergency, event, maintenance, rule
  final List<String>? _attachments;
// general, emergency, event, maintenance, rule
  @override
  List<String>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? imageUrl;
  @override
  final String? postedBy;
  @override
  final String? postedByName;
  @override
  final DateTime? postedAt;
  @override
  final DateTime? validFrom;
  @override
  final DateTime? validUntil;
  @override
  @JsonKey()
  final bool isPinned;
  @override
  @JsonKey()
  final bool isEmergency;
  final List<String>? _targetBuildings;
  @override
  List<String>? get targetBuildings {
    final value = _targetBuildings;
    if (value == null) return null;
    if (_targetBuildings is EqualUnmodifiableListView) return _targetBuildings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _targetFlats;
  @override
  List<String>? get targetFlats {
    final value = _targetFlats;
    if (value == null) return null;
    if (_targetFlats is EqualUnmodifiableListView) return _targetFlats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isSocietyWide;
  @override
  final int? viewCount;
  final Map<String, int>? _readByFlat;
  @override
  Map<String, int>? get readByFlat {
    final value = _readByFlat;
    if (value == null) return null;
    if (_readByFlat is EqualUnmodifiableMapView) return _readByFlat;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
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
    return 'AnnouncementEntity(id: $id, societyId: $societyId, title: $title, content: $content, category: $category, attachments: $attachments, imageUrl: $imageUrl, postedBy: $postedBy, postedByName: $postedByName, postedAt: $postedAt, validFrom: $validFrom, validUntil: $validUntil, isPinned: $isPinned, isEmergency: $isEmergency, targetBuildings: $targetBuildings, targetFlats: $targetFlats, isSocietyWide: $isSocietyWide, viewCount: $viewCount, readByFlat: $readByFlat, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnnouncementEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.societyId, societyId) ||
                other.societyId == societyId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.postedBy, postedBy) ||
                other.postedBy == postedBy) &&
            (identical(other.postedByName, postedByName) ||
                other.postedByName == postedByName) &&
            (identical(other.postedAt, postedAt) ||
                other.postedAt == postedAt) &&
            (identical(other.validFrom, validFrom) ||
                other.validFrom == validFrom) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.isEmergency, isEmergency) ||
                other.isEmergency == isEmergency) &&
            const DeepCollectionEquality()
                .equals(other._targetBuildings, _targetBuildings) &&
            const DeepCollectionEquality()
                .equals(other._targetFlats, _targetFlats) &&
            (identical(other.isSocietyWide, isSocietyWide) ||
                other.isSocietyWide == isSocietyWide) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            const DeepCollectionEquality()
                .equals(other._readByFlat, _readByFlat) &&
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
        title,
        content,
        category,
        const DeepCollectionEquality().hash(_attachments),
        imageUrl,
        postedBy,
        postedByName,
        postedAt,
        validFrom,
        validUntil,
        isPinned,
        isEmergency,
        const DeepCollectionEquality().hash(_targetBuildings),
        const DeepCollectionEquality().hash(_targetFlats),
        isSocietyWide,
        viewCount,
        const DeepCollectionEquality().hash(_readByFlat),
        const DeepCollectionEquality().hash(_metadata),
        createdAt,
        updatedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnnouncementEntityImplCopyWith<_$AnnouncementEntityImpl> get copyWith =>
      __$$AnnouncementEntityImplCopyWithImpl<_$AnnouncementEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnnouncementEntityImplToJson(
      this,
    );
  }
}

abstract class _AnnouncementEntity implements AnnouncementEntity {
  const factory _AnnouncementEntity(
      {required final String id,
      required final String societyId,
      required final String title,
      required final String content,
      final String? category,
      final List<String>? attachments,
      final String? imageUrl,
      final String? postedBy,
      final String? postedByName,
      final DateTime? postedAt,
      final DateTime? validFrom,
      final DateTime? validUntil,
      final bool isPinned,
      final bool isEmergency,
      final List<String>? targetBuildings,
      final List<String>? targetFlats,
      final bool? isSocietyWide,
      final int? viewCount,
      final Map<String, int>? readByFlat,
      final Map<String, dynamic>? metadata,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$AnnouncementEntityImpl;

  factory _AnnouncementEntity.fromJson(Map<String, dynamic> json) =
      _$AnnouncementEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get societyId;
  @override
  String get title;
  @override
  String get content;
  @override
  String? get category;
  @override // general, emergency, event, maintenance, rule
  List<String>? get attachments;
  @override
  String? get imageUrl;
  @override
  String? get postedBy;
  @override
  String? get postedByName;
  @override
  DateTime? get postedAt;
  @override
  DateTime? get validFrom;
  @override
  DateTime? get validUntil;
  @override
  bool get isPinned;
  @override
  bool get isEmergency;
  @override
  List<String>? get targetBuildings;
  @override
  List<String>? get targetFlats;
  @override
  bool? get isSocietyWide;
  @override
  int? get viewCount;
  @override
  Map<String, int>? get readByFlat;
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$AnnouncementEntityImplCopyWith<_$AnnouncementEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentEntity _$PaymentEntityFromJson(Map<String, dynamic> json) {
  return _PaymentEntity.fromJson(json);
}

/// @nodoc
mixin _$PaymentEntity {
  String get id => throw _privateConstructorUsedError;
  String get societyId => throw _privateConstructorUsedError;
  String get flatId => throw _privateConstructorUsedError;
  String? get flatNumber => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // maintenance, water, electricity, penalty, amenity, other
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // pending, paid, partial, overdue, cancelled
  DateTime? get dueDate => throw _privateConstructorUsedError;
  DateTime? get paidAt => throw _privateConstructorUsedError;
  String? get paymentMethod => throw _privateConstructorUsedError;
  String? get transactionId => throw _privateConstructorUsedError;
  String? get gateway => throw _privateConstructorUsedError;
  String? get receiptUrl => throw _privateConstructorUsedError;
  List<String>? get items => throw _privateConstructorUsedError;
  Map<String, dynamic>? get breakdown => throw _privateConstructorUsedError;
  double? get discount => throw _privateConstructorUsedError;
  double? get tax => throw _privateConstructorUsedError;
  double? get lateFee => throw _privateConstructorUsedError;
  DateTime? get lastReminderSent => throw _privateConstructorUsedError;
  int? get reminderCount => throw _privateConstructorUsedError;
  String? get raisedBy => throw _privateConstructorUsedError;
  String? get paidBy => throw _privateConstructorUsedError;
  String? get paidByName => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentEntityCopyWith<PaymentEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentEntityCopyWith<$Res> {
  factory $PaymentEntityCopyWith(
          PaymentEntity value, $Res Function(PaymentEntity) then) =
      _$PaymentEntityCopyWithImpl<$Res, PaymentEntity>;
  @useResult
  $Res call(
      {String id,
      String societyId,
      String flatId,
      String? flatNumber,
      String type,
      String title,
      String? description,
      double amount,
      String? currency,
      String status,
      DateTime? dueDate,
      DateTime? paidAt,
      String? paymentMethod,
      String? transactionId,
      String? gateway,
      String? receiptUrl,
      List<String>? items,
      Map<String, dynamic>? breakdown,
      double? discount,
      double? tax,
      double? lateFee,
      DateTime? lastReminderSent,
      int? reminderCount,
      String? raisedBy,
      String? paidBy,
      String? paidByName,
      Map<String, dynamic>? metadata,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$PaymentEntityCopyWithImpl<$Res, $Val extends PaymentEntity>
    implements $PaymentEntityCopyWith<$Res> {
  _$PaymentEntityCopyWithImpl(this._value, this._then);

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
    Object? flatNumber = freezed,
    Object? type = null,
    Object? title = null,
    Object? description = freezed,
    Object? amount = null,
    Object? currency = freezed,
    Object? status = null,
    Object? dueDate = freezed,
    Object? paidAt = freezed,
    Object? paymentMethod = freezed,
    Object? transactionId = freezed,
    Object? gateway = freezed,
    Object? receiptUrl = freezed,
    Object? items = freezed,
    Object? breakdown = freezed,
    Object? discount = freezed,
    Object? tax = freezed,
    Object? lateFee = freezed,
    Object? lastReminderSent = freezed,
    Object? reminderCount = freezed,
    Object? raisedBy = freezed,
    Object? paidBy = freezed,
    Object? paidByName = freezed,
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
      flatId: null == flatId
          ? _value.flatId
          : flatId // ignore: cast_nullable_to_non_nullable
              as String,
      flatNumber: freezed == flatNumber
          ? _value.flatNumber
          : flatNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      gateway: freezed == gateway
          ? _value.gateway
          : gateway // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptUrl: freezed == receiptUrl
          ? _value.receiptUrl
          : receiptUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      breakdown: freezed == breakdown
          ? _value.breakdown
          : breakdown // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      lateFee: freezed == lateFee
          ? _value.lateFee
          : lateFee // ignore: cast_nullable_to_non_nullable
              as double?,
      lastReminderSent: freezed == lastReminderSent
          ? _value.lastReminderSent
          : lastReminderSent // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reminderCount: freezed == reminderCount
          ? _value.reminderCount
          : reminderCount // ignore: cast_nullable_to_non_nullable
              as int?,
      raisedBy: freezed == raisedBy
          ? _value.raisedBy
          : raisedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      paidBy: freezed == paidBy
          ? _value.paidBy
          : paidBy // ignore: cast_nullable_to_non_nullable
              as String?,
      paidByName: freezed == paidByName
          ? _value.paidByName
          : paidByName // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$PaymentEntityImplCopyWith<$Res>
    implements $PaymentEntityCopyWith<$Res> {
  factory _$$PaymentEntityImplCopyWith(
          _$PaymentEntityImpl value, $Res Function(_$PaymentEntityImpl) then) =
      __$$PaymentEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String societyId,
      String flatId,
      String? flatNumber,
      String type,
      String title,
      String? description,
      double amount,
      String? currency,
      String status,
      DateTime? dueDate,
      DateTime? paidAt,
      String? paymentMethod,
      String? transactionId,
      String? gateway,
      String? receiptUrl,
      List<String>? items,
      Map<String, dynamic>? breakdown,
      double? discount,
      double? tax,
      double? lateFee,
      DateTime? lastReminderSent,
      int? reminderCount,
      String? raisedBy,
      String? paidBy,
      String? paidByName,
      Map<String, dynamic>? metadata,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$PaymentEntityImplCopyWithImpl<$Res>
    extends _$PaymentEntityCopyWithImpl<$Res, _$PaymentEntityImpl>
    implements _$$PaymentEntityImplCopyWith<$Res> {
  __$$PaymentEntityImplCopyWithImpl(
      _$PaymentEntityImpl _value, $Res Function(_$PaymentEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? flatId = null,
    Object? flatNumber = freezed,
    Object? type = null,
    Object? title = null,
    Object? description = freezed,
    Object? amount = null,
    Object? currency = freezed,
    Object? status = null,
    Object? dueDate = freezed,
    Object? paidAt = freezed,
    Object? paymentMethod = freezed,
    Object? transactionId = freezed,
    Object? gateway = freezed,
    Object? receiptUrl = freezed,
    Object? items = freezed,
    Object? breakdown = freezed,
    Object? discount = freezed,
    Object? tax = freezed,
    Object? lateFee = freezed,
    Object? lastReminderSent = freezed,
    Object? reminderCount = freezed,
    Object? raisedBy = freezed,
    Object? paidBy = freezed,
    Object? paidByName = freezed,
    Object? metadata = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PaymentEntityImpl(
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
      flatNumber: freezed == flatNumber
          ? _value.flatNumber
          : flatNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      gateway: freezed == gateway
          ? _value.gateway
          : gateway // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptUrl: freezed == receiptUrl
          ? _value.receiptUrl
          : receiptUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      breakdown: freezed == breakdown
          ? _value._breakdown
          : breakdown // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      lateFee: freezed == lateFee
          ? _value.lateFee
          : lateFee // ignore: cast_nullable_to_non_nullable
              as double?,
      lastReminderSent: freezed == lastReminderSent
          ? _value.lastReminderSent
          : lastReminderSent // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reminderCount: freezed == reminderCount
          ? _value.reminderCount
          : reminderCount // ignore: cast_nullable_to_non_nullable
              as int?,
      raisedBy: freezed == raisedBy
          ? _value.raisedBy
          : raisedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      paidBy: freezed == paidBy
          ? _value.paidBy
          : paidBy // ignore: cast_nullable_to_non_nullable
              as String?,
      paidByName: freezed == paidByName
          ? _value.paidByName
          : paidByName // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$PaymentEntityImpl implements _PaymentEntity {
  const _$PaymentEntityImpl(
      {required this.id,
      required this.societyId,
      required this.flatId,
      this.flatNumber,
      required this.type,
      required this.title,
      this.description,
      required this.amount,
      this.currency,
      required this.status,
      this.dueDate,
      this.paidAt,
      this.paymentMethod,
      this.transactionId,
      this.gateway,
      this.receiptUrl,
      final List<String>? items,
      final Map<String, dynamic>? breakdown,
      this.discount,
      this.tax,
      this.lateFee,
      this.lastReminderSent,
      this.reminderCount,
      this.raisedBy,
      this.paidBy,
      this.paidByName,
      final Map<String, dynamic>? metadata,
      this.createdAt,
      this.updatedAt})
      : _items = items,
        _breakdown = breakdown,
        _metadata = metadata;

  factory _$PaymentEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String societyId;
  @override
  final String flatId;
  @override
  final String? flatNumber;
  @override
  final String type;
// maintenance, water, electricity, penalty, amenity, other
  @override
  final String title;
  @override
  final String? description;
  @override
  final double amount;
  @override
  final String? currency;
  @override
  final String status;
// pending, paid, partial, overdue, cancelled
  @override
  final DateTime? dueDate;
  @override
  final DateTime? paidAt;
  @override
  final String? paymentMethod;
  @override
  final String? transactionId;
  @override
  final String? gateway;
  @override
  final String? receiptUrl;
  final List<String>? _items;
  @override
  List<String>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _breakdown;
  @override
  Map<String, dynamic>? get breakdown {
    final value = _breakdown;
    if (value == null) return null;
    if (_breakdown is EqualUnmodifiableMapView) return _breakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final double? discount;
  @override
  final double? tax;
  @override
  final double? lateFee;
  @override
  final DateTime? lastReminderSent;
  @override
  final int? reminderCount;
  @override
  final String? raisedBy;
  @override
  final String? paidBy;
  @override
  final String? paidByName;
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
    return 'PaymentEntity(id: $id, societyId: $societyId, flatId: $flatId, flatNumber: $flatNumber, type: $type, title: $title, description: $description, amount: $amount, currency: $currency, status: $status, dueDate: $dueDate, paidAt: $paidAt, paymentMethod: $paymentMethod, transactionId: $transactionId, gateway: $gateway, receiptUrl: $receiptUrl, items: $items, breakdown: $breakdown, discount: $discount, tax: $tax, lateFee: $lateFee, lastReminderSent: $lastReminderSent, reminderCount: $reminderCount, raisedBy: $raisedBy, paidBy: $paidBy, paidByName: $paidByName, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.societyId, societyId) ||
                other.societyId == societyId) &&
            (identical(other.flatId, flatId) || other.flatId == flatId) &&
            (identical(other.flatNumber, flatNumber) ||
                other.flatNumber == flatNumber) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.gateway, gateway) || other.gateway == gateway) &&
            (identical(other.receiptUrl, receiptUrl) ||
                other.receiptUrl == receiptUrl) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other._breakdown, _breakdown) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.lateFee, lateFee) || other.lateFee == lateFee) &&
            (identical(other.lastReminderSent, lastReminderSent) ||
                other.lastReminderSent == lastReminderSent) &&
            (identical(other.reminderCount, reminderCount) ||
                other.reminderCount == reminderCount) &&
            (identical(other.raisedBy, raisedBy) ||
                other.raisedBy == raisedBy) &&
            (identical(other.paidBy, paidBy) || other.paidBy == paidBy) &&
            (identical(other.paidByName, paidByName) ||
                other.paidByName == paidByName) &&
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
        flatId,
        flatNumber,
        type,
        title,
        description,
        amount,
        currency,
        status,
        dueDate,
        paidAt,
        paymentMethod,
        transactionId,
        gateway,
        receiptUrl,
        const DeepCollectionEquality().hash(_items),
        const DeepCollectionEquality().hash(_breakdown),
        discount,
        tax,
        lateFee,
        lastReminderSent,
        reminderCount,
        raisedBy,
        paidBy,
        paidByName,
        const DeepCollectionEquality().hash(_metadata),
        createdAt,
        updatedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentEntityImplCopyWith<_$PaymentEntityImpl> get copyWith =>
      __$$PaymentEntityImplCopyWithImpl<_$PaymentEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentEntityImplToJson(
      this,
    );
  }
}

abstract class _PaymentEntity implements PaymentEntity {
  const factory _PaymentEntity(
      {required final String id,
      required final String societyId,
      required final String flatId,
      final String? flatNumber,
      required final String type,
      required final String title,
      final String? description,
      required final double amount,
      final String? currency,
      required final String status,
      final DateTime? dueDate,
      final DateTime? paidAt,
      final String? paymentMethod,
      final String? transactionId,
      final String? gateway,
      final String? receiptUrl,
      final List<String>? items,
      final Map<String, dynamic>? breakdown,
      final double? discount,
      final double? tax,
      final double? lateFee,
      final DateTime? lastReminderSent,
      final int? reminderCount,
      final String? raisedBy,
      final String? paidBy,
      final String? paidByName,
      final Map<String, dynamic>? metadata,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$PaymentEntityImpl;

  factory _PaymentEntity.fromJson(Map<String, dynamic> json) =
      _$PaymentEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get societyId;
  @override
  String get flatId;
  @override
  String? get flatNumber;
  @override
  String get type;
  @override // maintenance, water, electricity, penalty, amenity, other
  String get title;
  @override
  String? get description;
  @override
  double get amount;
  @override
  String? get currency;
  @override
  String get status;
  @override // pending, paid, partial, overdue, cancelled
  DateTime? get dueDate;
  @override
  DateTime? get paidAt;
  @override
  String? get paymentMethod;
  @override
  String? get transactionId;
  @override
  String? get gateway;
  @override
  String? get receiptUrl;
  @override
  List<String>? get items;
  @override
  Map<String, dynamic>? get breakdown;
  @override
  double? get discount;
  @override
  double? get tax;
  @override
  double? get lateFee;
  @override
  DateTime? get lastReminderSent;
  @override
  int? get reminderCount;
  @override
  String? get raisedBy;
  @override
  String? get paidBy;
  @override
  String? get paidByName;
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$PaymentEntityImplCopyWith<_$PaymentEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmergencyEntity _$EmergencyEntityFromJson(Map<String, dynamic> json) {
  return _EmergencyEntity.fromJson(json);
}

/// @nodoc
mixin _$EmergencyEntity {
  String get id => throw _privateConstructorUsedError;
  String get societyId => throw _privateConstructorUsedError;
  String get flatId => throw _privateConstructorUsedError;
  String? get flatNumber => throw _privateConstructorUsedError;
  String get raisedBy => throw _privateConstructorUsedError;
  String? get raiserName => throw _privateConstructorUsedError;
  String? get raiserPhone => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // medical, fire, security, accident, other
  String get description => throw _privateConstructorUsedError;
  GeoPoint? get location => throw _privateConstructorUsedError;
  String? get status =>
      throw _privateConstructorUsedError; // active, acknowledged, resolved, false_alarm
  List<String>? get respondedBy => throw _privateConstructorUsedError;
  DateTime? get acknowledgedAt => throw _privateConstructorUsedError;
  DateTime? get resolvedAt => throw _privateConstructorUsedError;
  String? get resolution => throw _privateConstructorUsedError;
  List<String>? get photos => throw _privateConstructorUsedError;
  List<String>? get videos => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmergencyEntityCopyWith<EmergencyEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmergencyEntityCopyWith<$Res> {
  factory $EmergencyEntityCopyWith(
          EmergencyEntity value, $Res Function(EmergencyEntity) then) =
      _$EmergencyEntityCopyWithImpl<$Res, EmergencyEntity>;
  @useResult
  $Res call(
      {String id,
      String societyId,
      String flatId,
      String? flatNumber,
      String raisedBy,
      String? raiserName,
      String? raiserPhone,
      String type,
      String description,
      GeoPoint? location,
      String? status,
      List<String>? respondedBy,
      DateTime? acknowledgedAt,
      DateTime? resolvedAt,
      String? resolution,
      List<String>? photos,
      List<String>? videos,
      Map<String, dynamic>? metadata,
      DateTime? createdAt,
      DateTime? updatedAt});

  $GeoPointCopyWith<$Res>? get location;
}

/// @nodoc
class _$EmergencyEntityCopyWithImpl<$Res, $Val extends EmergencyEntity>
    implements $EmergencyEntityCopyWith<$Res> {
  _$EmergencyEntityCopyWithImpl(this._value, this._then);

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
    Object? flatNumber = freezed,
    Object? raisedBy = null,
    Object? raiserName = freezed,
    Object? raiserPhone = freezed,
    Object? type = null,
    Object? description = null,
    Object? location = freezed,
    Object? status = freezed,
    Object? respondedBy = freezed,
    Object? acknowledgedAt = freezed,
    Object? resolvedAt = freezed,
    Object? resolution = freezed,
    Object? photos = freezed,
    Object? videos = freezed,
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
      flatId: null == flatId
          ? _value.flatId
          : flatId // ignore: cast_nullable_to_non_nullable
              as String,
      flatNumber: freezed == flatNumber
          ? _value.flatNumber
          : flatNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      raisedBy: null == raisedBy
          ? _value.raisedBy
          : raisedBy // ignore: cast_nullable_to_non_nullable
              as String,
      raiserName: freezed == raiserName
          ? _value.raiserName
          : raiserName // ignore: cast_nullable_to_non_nullable
              as String?,
      raiserPhone: freezed == raiserPhone
          ? _value.raiserPhone
          : raiserPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      respondedBy: freezed == respondedBy
          ? _value.respondedBy
          : respondedBy // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      acknowledgedAt: freezed == acknowledgedAt
          ? _value.acknowledgedAt
          : acknowledgedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resolvedAt: freezed == resolvedAt
          ? _value.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: freezed == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      videos: freezed == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
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
abstract class _$$EmergencyEntityImplCopyWith<$Res>
    implements $EmergencyEntityCopyWith<$Res> {
  factory _$$EmergencyEntityImplCopyWith(_$EmergencyEntityImpl value,
          $Res Function(_$EmergencyEntityImpl) then) =
      __$$EmergencyEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String societyId,
      String flatId,
      String? flatNumber,
      String raisedBy,
      String? raiserName,
      String? raiserPhone,
      String type,
      String description,
      GeoPoint? location,
      String? status,
      List<String>? respondedBy,
      DateTime? acknowledgedAt,
      DateTime? resolvedAt,
      String? resolution,
      List<String>? photos,
      List<String>? videos,
      Map<String, dynamic>? metadata,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $GeoPointCopyWith<$Res>? get location;
}

/// @nodoc
class __$$EmergencyEntityImplCopyWithImpl<$Res>
    extends _$EmergencyEntityCopyWithImpl<$Res, _$EmergencyEntityImpl>
    implements _$$EmergencyEntityImplCopyWith<$Res> {
  __$$EmergencyEntityImplCopyWithImpl(
      _$EmergencyEntityImpl _value, $Res Function(_$EmergencyEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? flatId = null,
    Object? flatNumber = freezed,
    Object? raisedBy = null,
    Object? raiserName = freezed,
    Object? raiserPhone = freezed,
    Object? type = null,
    Object? description = null,
    Object? location = freezed,
    Object? status = freezed,
    Object? respondedBy = freezed,
    Object? acknowledgedAt = freezed,
    Object? resolvedAt = freezed,
    Object? resolution = freezed,
    Object? photos = freezed,
    Object? videos = freezed,
    Object? metadata = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$EmergencyEntityImpl(
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
      flatNumber: freezed == flatNumber
          ? _value.flatNumber
          : flatNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      raisedBy: null == raisedBy
          ? _value.raisedBy
          : raisedBy // ignore: cast_nullable_to_non_nullable
              as String,
      raiserName: freezed == raiserName
          ? _value.raiserName
          : raiserName // ignore: cast_nullable_to_non_nullable
              as String?,
      raiserPhone: freezed == raiserPhone
          ? _value.raiserPhone
          : raiserPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      respondedBy: freezed == respondedBy
          ? _value._respondedBy
          : respondedBy // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      acknowledgedAt: freezed == acknowledgedAt
          ? _value.acknowledgedAt
          : acknowledgedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resolvedAt: freezed == resolvedAt
          ? _value.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: freezed == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      videos: freezed == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
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
class _$EmergencyEntityImpl implements _EmergencyEntity {
  const _$EmergencyEntityImpl(
      {required this.id,
      required this.societyId,
      required this.flatId,
      this.flatNumber,
      required this.raisedBy,
      this.raiserName,
      this.raiserPhone,
      required this.type,
      required this.description,
      this.location,
      this.status,
      final List<String>? respondedBy,
      this.acknowledgedAt,
      this.resolvedAt,
      this.resolution,
      final List<String>? photos,
      final List<String>? videos,
      final Map<String, dynamic>? metadata,
      this.createdAt,
      this.updatedAt})
      : _respondedBy = respondedBy,
        _photos = photos,
        _videos = videos,
        _metadata = metadata;

  factory _$EmergencyEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmergencyEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String societyId;
  @override
  final String flatId;
  @override
  final String? flatNumber;
  @override
  final String raisedBy;
  @override
  final String? raiserName;
  @override
  final String? raiserPhone;
  @override
  final String type;
// medical, fire, security, accident, other
  @override
  final String description;
  @override
  final GeoPoint? location;
  @override
  final String? status;
// active, acknowledged, resolved, false_alarm
  final List<String>? _respondedBy;
// active, acknowledged, resolved, false_alarm
  @override
  List<String>? get respondedBy {
    final value = _respondedBy;
    if (value == null) return null;
    if (_respondedBy is EqualUnmodifiableListView) return _respondedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? acknowledgedAt;
  @override
  final DateTime? resolvedAt;
  @override
  final String? resolution;
  final List<String>? _photos;
  @override
  List<String>? get photos {
    final value = _photos;
    if (value == null) return null;
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _videos;
  @override
  List<String>? get videos {
    final value = _videos;
    if (value == null) return null;
    if (_videos is EqualUnmodifiableListView) return _videos;
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
    return 'EmergencyEntity(id: $id, societyId: $societyId, flatId: $flatId, flatNumber: $flatNumber, raisedBy: $raisedBy, raiserName: $raiserName, raiserPhone: $raiserPhone, type: $type, description: $description, location: $location, status: $status, respondedBy: $respondedBy, acknowledgedAt: $acknowledgedAt, resolvedAt: $resolvedAt, resolution: $resolution, photos: $photos, videos: $videos, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmergencyEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.societyId, societyId) ||
                other.societyId == societyId) &&
            (identical(other.flatId, flatId) || other.flatId == flatId) &&
            (identical(other.flatNumber, flatNumber) ||
                other.flatNumber == flatNumber) &&
            (identical(other.raisedBy, raisedBy) ||
                other.raisedBy == raisedBy) &&
            (identical(other.raiserName, raiserName) ||
                other.raiserName == raiserName) &&
            (identical(other.raiserPhone, raiserPhone) ||
                other.raiserPhone == raiserPhone) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._respondedBy, _respondedBy) &&
            (identical(other.acknowledgedAt, acknowledgedAt) ||
                other.acknowledgedAt == acknowledgedAt) &&
            (identical(other.resolvedAt, resolvedAt) ||
                other.resolvedAt == resolvedAt) &&
            (identical(other.resolution, resolution) ||
                other.resolution == resolution) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            const DeepCollectionEquality().equals(other._videos, _videos) &&
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
        flatId,
        flatNumber,
        raisedBy,
        raiserName,
        raiserPhone,
        type,
        description,
        location,
        status,
        const DeepCollectionEquality().hash(_respondedBy),
        acknowledgedAt,
        resolvedAt,
        resolution,
        const DeepCollectionEquality().hash(_photos),
        const DeepCollectionEquality().hash(_videos),
        const DeepCollectionEquality().hash(_metadata),
        createdAt,
        updatedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmergencyEntityImplCopyWith<_$EmergencyEntityImpl> get copyWith =>
      __$$EmergencyEntityImplCopyWithImpl<_$EmergencyEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmergencyEntityImplToJson(
      this,
    );
  }
}

abstract class _EmergencyEntity implements EmergencyEntity {
  const factory _EmergencyEntity(
      {required final String id,
      required final String societyId,
      required final String flatId,
      final String? flatNumber,
      required final String raisedBy,
      final String? raiserName,
      final String? raiserPhone,
      required final String type,
      required final String description,
      final GeoPoint? location,
      final String? status,
      final List<String>? respondedBy,
      final DateTime? acknowledgedAt,
      final DateTime? resolvedAt,
      final String? resolution,
      final List<String>? photos,
      final List<String>? videos,
      final Map<String, dynamic>? metadata,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$EmergencyEntityImpl;

  factory _EmergencyEntity.fromJson(Map<String, dynamic> json) =
      _$EmergencyEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get societyId;
  @override
  String get flatId;
  @override
  String? get flatNumber;
  @override
  String get raisedBy;
  @override
  String? get raiserName;
  @override
  String? get raiserPhone;
  @override
  String get type;
  @override // medical, fire, security, accident, other
  String get description;
  @override
  GeoPoint? get location;
  @override
  String? get status;
  @override // active, acknowledged, resolved, false_alarm
  List<String>? get respondedBy;
  @override
  DateTime? get acknowledgedAt;
  @override
  DateTime? get resolvedAt;
  @override
  String? get resolution;
  @override
  List<String>? get photos;
  @override
  List<String>? get videos;
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$EmergencyEntityImplCopyWith<_$EmergencyEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PatrolLogEntity _$PatrolLogEntityFromJson(Map<String, dynamic> json) {
  return _PatrolLogEntity.fromJson(json);
}

/// @nodoc
mixin _$PatrolLogEntity {
  String get id => throw _privateConstructorUsedError;
  String get societyId => throw _privateConstructorUsedError;
  String get securityUserId => throw _privateConstructorUsedError;
  String? get securityUserName => throw _privateConstructorUsedError;
  String get checkpointId => throw _privateConstructorUsedError;
  String? get checkpointName => throw _privateConstructorUsedError;
  GeoPoint? get checkpointLocation => throw _privateConstructorUsedError;
  DateTime? get checkInTime => throw _privateConstructorUsedError;
  DateTime? get checkOutTime => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  List<String>? get photos => throw _privateConstructorUsedError;
  bool? get hasIssue => throw _privateConstructorUsedError;
  String? get issueDescription => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatrolLogEntityCopyWith<PatrolLogEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatrolLogEntityCopyWith<$Res> {
  factory $PatrolLogEntityCopyWith(
          PatrolLogEntity value, $Res Function(PatrolLogEntity) then) =
      _$PatrolLogEntityCopyWithImpl<$Res, PatrolLogEntity>;
  @useResult
  $Res call(
      {String id,
      String societyId,
      String securityUserId,
      String? securityUserName,
      String checkpointId,
      String? checkpointName,
      GeoPoint? checkpointLocation,
      DateTime? checkInTime,
      DateTime? checkOutTime,
      String? notes,
      List<String>? photos,
      bool? hasIssue,
      String? issueDescription,
      Map<String, dynamic>? metadata,
      DateTime? createdAt});

  $GeoPointCopyWith<$Res>? get checkpointLocation;
}

/// @nodoc
class _$PatrolLogEntityCopyWithImpl<$Res, $Val extends PatrolLogEntity>
    implements $PatrolLogEntityCopyWith<$Res> {
  _$PatrolLogEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? securityUserId = null,
    Object? securityUserName = freezed,
    Object? checkpointId = null,
    Object? checkpointName = freezed,
    Object? checkpointLocation = freezed,
    Object? checkInTime = freezed,
    Object? checkOutTime = freezed,
    Object? notes = freezed,
    Object? photos = freezed,
    Object? hasIssue = freezed,
    Object? issueDescription = freezed,
    Object? metadata = freezed,
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
      securityUserId: null == securityUserId
          ? _value.securityUserId
          : securityUserId // ignore: cast_nullable_to_non_nullable
              as String,
      securityUserName: freezed == securityUserName
          ? _value.securityUserName
          : securityUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      checkpointId: null == checkpointId
          ? _value.checkpointId
          : checkpointId // ignore: cast_nullable_to_non_nullable
              as String,
      checkpointName: freezed == checkpointName
          ? _value.checkpointName
          : checkpointName // ignore: cast_nullable_to_non_nullable
              as String?,
      checkpointLocation: freezed == checkpointLocation
          ? _value.checkpointLocation
          : checkpointLocation // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
      checkInTime: freezed == checkInTime
          ? _value.checkInTime
          : checkInTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkOutTime: freezed == checkOutTime
          ? _value.checkOutTime
          : checkOutTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: freezed == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      hasIssue: freezed == hasIssue
          ? _value.hasIssue
          : hasIssue // ignore: cast_nullable_to_non_nullable
              as bool?,
      issueDescription: freezed == issueDescription
          ? _value.issueDescription
          : issueDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeoPointCopyWith<$Res>? get checkpointLocation {
    if (_value.checkpointLocation == null) {
      return null;
    }

    return $GeoPointCopyWith<$Res>(_value.checkpointLocation!, (value) {
      return _then(_value.copyWith(checkpointLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PatrolLogEntityImplCopyWith<$Res>
    implements $PatrolLogEntityCopyWith<$Res> {
  factory _$$PatrolLogEntityImplCopyWith(_$PatrolLogEntityImpl value,
          $Res Function(_$PatrolLogEntityImpl) then) =
      __$$PatrolLogEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String societyId,
      String securityUserId,
      String? securityUserName,
      String checkpointId,
      String? checkpointName,
      GeoPoint? checkpointLocation,
      DateTime? checkInTime,
      DateTime? checkOutTime,
      String? notes,
      List<String>? photos,
      bool? hasIssue,
      String? issueDescription,
      Map<String, dynamic>? metadata,
      DateTime? createdAt});

  @override
  $GeoPointCopyWith<$Res>? get checkpointLocation;
}

/// @nodoc
class __$$PatrolLogEntityImplCopyWithImpl<$Res>
    extends _$PatrolLogEntityCopyWithImpl<$Res, _$PatrolLogEntityImpl>
    implements _$$PatrolLogEntityImplCopyWith<$Res> {
  __$$PatrolLogEntityImplCopyWithImpl(
      _$PatrolLogEntityImpl _value, $Res Function(_$PatrolLogEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? societyId = null,
    Object? securityUserId = null,
    Object? securityUserName = freezed,
    Object? checkpointId = null,
    Object? checkpointName = freezed,
    Object? checkpointLocation = freezed,
    Object? checkInTime = freezed,
    Object? checkOutTime = freezed,
    Object? notes = freezed,
    Object? photos = freezed,
    Object? hasIssue = freezed,
    Object? issueDescription = freezed,
    Object? metadata = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$PatrolLogEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      societyId: null == societyId
          ? _value.societyId
          : societyId // ignore: cast_nullable_to_non_nullable
              as String,
      securityUserId: null == securityUserId
          ? _value.securityUserId
          : securityUserId // ignore: cast_nullable_to_non_nullable
              as String,
      securityUserName: freezed == securityUserName
          ? _value.securityUserName
          : securityUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      checkpointId: null == checkpointId
          ? _value.checkpointId
          : checkpointId // ignore: cast_nullable_to_non_nullable
              as String,
      checkpointName: freezed == checkpointName
          ? _value.checkpointName
          : checkpointName // ignore: cast_nullable_to_non_nullable
              as String?,
      checkpointLocation: freezed == checkpointLocation
          ? _value.checkpointLocation
          : checkpointLocation // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
      checkInTime: freezed == checkInTime
          ? _value.checkInTime
          : checkInTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkOutTime: freezed == checkOutTime
          ? _value.checkOutTime
          : checkOutTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: freezed == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      hasIssue: freezed == hasIssue
          ? _value.hasIssue
          : hasIssue // ignore: cast_nullable_to_non_nullable
              as bool?,
      issueDescription: freezed == issueDescription
          ? _value.issueDescription
          : issueDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatrolLogEntityImpl implements _PatrolLogEntity {
  const _$PatrolLogEntityImpl(
      {required this.id,
      required this.societyId,
      required this.securityUserId,
      this.securityUserName,
      required this.checkpointId,
      this.checkpointName,
      this.checkpointLocation,
      this.checkInTime,
      this.checkOutTime,
      this.notes,
      final List<String>? photos,
      this.hasIssue,
      this.issueDescription,
      final Map<String, dynamic>? metadata,
      this.createdAt})
      : _photos = photos,
        _metadata = metadata;

  factory _$PatrolLogEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatrolLogEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String societyId;
  @override
  final String securityUserId;
  @override
  final String? securityUserName;
  @override
  final String checkpointId;
  @override
  final String? checkpointName;
  @override
  final GeoPoint? checkpointLocation;
  @override
  final DateTime? checkInTime;
  @override
  final DateTime? checkOutTime;
  @override
  final String? notes;
  final List<String>? _photos;
  @override
  List<String>? get photos {
    final value = _photos;
    if (value == null) return null;
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? hasIssue;
  @override
  final String? issueDescription;
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
  String toString() {
    return 'PatrolLogEntity(id: $id, societyId: $societyId, securityUserId: $securityUserId, securityUserName: $securityUserName, checkpointId: $checkpointId, checkpointName: $checkpointName, checkpointLocation: $checkpointLocation, checkInTime: $checkInTime, checkOutTime: $checkOutTime, notes: $notes, photos: $photos, hasIssue: $hasIssue, issueDescription: $issueDescription, metadata: $metadata, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatrolLogEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.societyId, societyId) ||
                other.societyId == societyId) &&
            (identical(other.securityUserId, securityUserId) ||
                other.securityUserId == securityUserId) &&
            (identical(other.securityUserName, securityUserName) ||
                other.securityUserName == securityUserName) &&
            (identical(other.checkpointId, checkpointId) ||
                other.checkpointId == checkpointId) &&
            (identical(other.checkpointName, checkpointName) ||
                other.checkpointName == checkpointName) &&
            (identical(other.checkpointLocation, checkpointLocation) ||
                other.checkpointLocation == checkpointLocation) &&
            (identical(other.checkInTime, checkInTime) ||
                other.checkInTime == checkInTime) &&
            (identical(other.checkOutTime, checkOutTime) ||
                other.checkOutTime == checkOutTime) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.hasIssue, hasIssue) ||
                other.hasIssue == hasIssue) &&
            (identical(other.issueDescription, issueDescription) ||
                other.issueDescription == issueDescription) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      societyId,
      securityUserId,
      securityUserName,
      checkpointId,
      checkpointName,
      checkpointLocation,
      checkInTime,
      checkOutTime,
      notes,
      const DeepCollectionEquality().hash(_photos),
      hasIssue,
      issueDescription,
      const DeepCollectionEquality().hash(_metadata),
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PatrolLogEntityImplCopyWith<_$PatrolLogEntityImpl> get copyWith =>
      __$$PatrolLogEntityImplCopyWithImpl<_$PatrolLogEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatrolLogEntityImplToJson(
      this,
    );
  }
}

abstract class _PatrolLogEntity implements PatrolLogEntity {
  const factory _PatrolLogEntity(
      {required final String id,
      required final String societyId,
      required final String securityUserId,
      final String? securityUserName,
      required final String checkpointId,
      final String? checkpointName,
      final GeoPoint? checkpointLocation,
      final DateTime? checkInTime,
      final DateTime? checkOutTime,
      final String? notes,
      final List<String>? photos,
      final bool? hasIssue,
      final String? issueDescription,
      final Map<String, dynamic>? metadata,
      final DateTime? createdAt}) = _$PatrolLogEntityImpl;

  factory _PatrolLogEntity.fromJson(Map<String, dynamic> json) =
      _$PatrolLogEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get societyId;
  @override
  String get securityUserId;
  @override
  String? get securityUserName;
  @override
  String get checkpointId;
  @override
  String? get checkpointName;
  @override
  GeoPoint? get checkpointLocation;
  @override
  DateTime? get checkInTime;
  @override
  DateTime? get checkOutTime;
  @override
  String? get notes;
  @override
  List<String>? get photos;
  @override
  bool? get hasIssue;
  @override
  String? get issueDescription;
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$PatrolLogEntityImplCopyWith<_$PatrolLogEntityImpl> get copyWith =>
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
