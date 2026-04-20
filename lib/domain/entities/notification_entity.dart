import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_entity.freezed.dart';
part 'notification_entity.g.dart';

/// Notification entity for FCM and in-app notifications
@freezed
class NotificationEntity with _$NotificationEntity {
  const factory NotificationEntity({
    required String id,
    required String societyId,
    required String type, // visitor, announcement, emergency, payment, complaint, booking
    required String title,
    required String body,
    String? imageUrl,
    Map<String, dynamic>? data,
    String? deepLink,
    List<String>? targetUserIds,
    List<String>? targetFlatIds,
    String? targetRole, // resident, security, admin, vendor
    bool? isSocietyWide,
    String? createdBy,
    String? createdByName,
    DateTime? createdAt,
    DateTime? expiresAt,
    @Default(false) bool isRead,
    DateTime? readAt,
    String? readBy,
    @Default(0) int priority, // 1=low, 2=normal, 3=high, 4=urgent
    @Default(true) bool shouldSendPush,
    @Default(true) bool shouldShowInApp,
    Map<String, dynamic>? metadata,
  }) = _NotificationEntity;

  factory NotificationEntity.fromJson(Map<String, dynamic> json) => 
      _$NotificationEntityFromJson(json);
}

/// Complaint/Work order entity
@freezed
class ComplaintEntity with _$ComplaintEntity {
  const factory ComplaintEntity({
    required String id,
    required String societyId,
    required String flatId,
    required String raisedBy,
    String? raiserName,
    String? raiserPhone,
    required String title,
    required String description,
    required String category, // maintenance, cleaning, security, electrical, plumbing, other
    String? subCategory,
    List<String>? photos,
    List<String>? videos,
    String? location,
    String? preferredDate,
    TimeOfDay? preferredTime,
    @Default('open') String status, // open, in_progress, resolved, closed
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
    int? priority, // 1=low, 2=normal, 3=high, 4=urgent
    DateTime? slaDeadline,
    bool? isSlaBreached,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ComplaintEntity;

  factory ComplaintEntity.fromJson(Map<String, dynamic> json) => 
      _$ComplaintEntityFromJson(json);
}

/// Complaint status update
@freezed
class ComplaintUpdate with _$ComplaintUpdate {
  const factory ComplaintUpdate({
    required String id,
    required String complaintId,
    required String updatedBy,
    String? updaterName,
    required String status,
    String? message,
    List<String>? photos,
    DateTime? timestamp,
  }) = _ComplaintUpdate;

  factory ComplaintUpdate.fromJson(Map<String, dynamic> json) => 
      _$ComplaintUpdateFromJson(json);
}

/// Announcement entity for notice board
@freezed
class AnnouncementEntity with _$AnnouncementEntity {
  const factory AnnouncementEntity({
    required String id,
    required String societyId,
    required String title,
    required String content,
    String? category, // general, emergency, event, maintenance, rule
    List<String>? attachments,
    String? imageUrl,
    String? postedBy,
    String? postedByName,
    DateTime? postedAt,
    DateTime? validFrom,
    DateTime? validUntil,
    @Default(false) bool isPinned,
    @Default(false) bool isEmergency,
    List<String>? targetBuildings,
    List<String>? targetFlats,
    bool? isSocietyWide,
    int? viewCount,
    Map<String, int>? readByFlat,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _AnnouncementEntity;

  factory AnnouncementEntity.fromJson(Map<String, dynamic> json) => 
      _$AnnouncementEntityFromJson(json);
}

/// Payment/Invoice entity
@freezed
class PaymentEntity with _$PaymentEntity {
  const factory PaymentEntity({
    required String id,
    required String societyId,
    required String flatId,
    String? flatNumber,
    required String type, // maintenance, water, electricity, penalty, amenity, other
    required String title,
    String? description,
    required double amount,
    String? currency,
    required String status, // pending, paid, partial, overdue, cancelled
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
    DateTime? updatedAt,
  }) = _PaymentEntity;

  factory PaymentEntity.fromJson(Map<String, dynamic> json) => 
      _$PaymentEntityFromJson(json);
}

/// Emergency/SOS entity
@freezed
class EmergencyEntity with _$EmergencyEntity {
  const factory EmergencyEntity({
    required String id,
    required String societyId,
    required String flatId,
    String? flatNumber,
    required String raisedBy,
    String? raiserName,
    String? raiserPhone,
    required String type, // medical, fire, security, accident, other
    required String description,
    GeoPoint? location,
    String? status, // active, acknowledged, resolved, false_alarm
    List<String>? respondedBy,
    DateTime? acknowledgedAt,
    DateTime? resolvedAt,
    String? resolution,
    List<String>? photos,
    List<String>? videos,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _EmergencyEntity;

  factory EmergencyEntity.fromJson(Map<String, dynamic> json) => 
      _$EmergencyEntityFromJson(json);
}

/// Patrol log entity for security tracking
@freezed
class PatrolLogEntity with _$PatrolLogEntity {
  const factory PatrolLogEntity({
    required String id,
    required String societyId,
    required String securityUserId,
    String? securityUserName,
    required String checkpointId,
    String? checkpointName,
    GeoPoint? checkpointLocation,
    DateTime? checkInTime,
    DateTime? checkOutTime,
    String? notes,
    List<String>? photos,
    bool? hasIssue,
    String? issueDescription,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
  }) = _PatrolLogEntity;

  factory PatrolLogEntity.fromJson(Map<String, dynamic> json) => 
      _$PatrolLogEntityFromJson(json);
}

/// GeoPoint for location
@freezed
class GeoPoint with _$GeoPoint {
  const factory GeoPoint({
    required double latitude,
    required double longitude,
  }) = _GeoPoint;

  factory GeoPoint.fromJson(Map<String, dynamic> json) => _$GeoPointFromJson(json);
}
