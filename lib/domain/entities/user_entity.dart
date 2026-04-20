import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

/// User entity representing all user types in the system
@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String uid,
    required String email,
    required String? phoneNumber,
    required String displayName,
    required String role, // resident, security, admin, vendor
    required String societyId,
    required String? flatId,
    required DateTime createdAt,
    required DateTime updatedAt,
    required bool isActive,
    required Map<String, dynamic> metadata,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
}

/// Flat entity representing a residential unit
@freezed
class FlatEntity with _$FlatEntity {
  const factory FlatEntity({
    required String id,
    required String societyId,
    required String buildingNumber,
    required String floorNumber,
    required String flatNumber,
    required List<String> memberUids,
    required String? primaryContactUid,
    required Map<String, dynamic> contactDetails,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _FlatEntity;

  factory FlatEntity.fromJson(Map<String, dynamic> json) => _$FlatEntityFromJson(json);
}

/// Visitor entity for tracking visitors
@freezed
class VisitorEntity with _$VisitorEntity {
  const factory VisitorEntity({
    required String id,
    required String societyId,
    required String hostFlatId,
    required String visitorName,
    required String? visitorPhone,
    required String? visitorPhotoUrl,
    required String purpose,
    required String? vehicleNumber,
    required String? licensePlatePhotoUrl,
    required DateTime expectedArrivalTime,
    required DateTime? actualArrivalTime,
    required DateTime expectedDepartureTime,
    required DateTime? actualDepartureTime,
    required String status, // pending, approved, rejected, checked_in, checked_out, expired
    required String gateNumber,
    required String? securityNotes,
    required String? approvedBy,
    required DateTime? approvedAt,
    required String? rejectedBy,
    required String? rejectionReason,
    required DateTime? rejectedAt,
    required String taggedBy, // Security personnel UID
    required DateTime taggedAt,
    required bool isPreApproved,
    required String? preApprovalCode,
    required DateTime? preApprovalExpiry,
    required Map<String, dynamic> metadata,
  }) = _VisitorEntity;

  factory VisitorEntity.fromJson(Map<String, dynamic> json) => _$VisitorEntityFromJson(json);
}

/// Notification entity
@freezed
class NotificationEntity with _$NotificationEntity {
  const factory NotificationEntity({
    required String id,
    required String userId,
    required String type, // visitor, announcement, complaint, payment, emergency
    required String title,
    required String body,
    required Map<String, dynamic> data,
    required String? imageUrl,
    required String? actionUrl,
    required bool isRead,
    required DateTime createdAt,
    required DateTime? readAt,
  }) = _NotificationEntity;

  factory NotificationEntity.fromJson(Map<String, dynamic> json) => 
      _$NotificationEntityFromJson(json);
}

/// Complaint entity for work orders and issues
@freezed
class ComplaintEntity with _$ComplaintEntity {
  const factory ComplaintEntity({
    required String id,
    required String societyId,
    required String raisedByUid,
    required String? flatId,
    required String category,
    required String subCategory,
    required String title,
    required String description,
    required List<String> photoUrls,
    required List<String> videoUrls,
    required String priority, // low, medium, high, urgent
    required String status, // open, in_progress, resolved, closed, rejected
    required String? assignedToUid,
    required String? assignedVendorId,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime? resolvedAt,
    required String? resolutionNotes,
    required int? rating,
    required String? feedback,
    required List<ComplaintUpdateEntity> updates,
    required Map<String, dynamic> metadata,
  }) = _ComplaintEntity;

  factory ComplaintEntity.fromJson(Map<String, dynamic> json) => 
      _$ComplaintEntityFromJson(json);
}

/// Complaint update for tracking status changes
@freezed
class ComplaintUpdateEntity with _$ComplaintUpdateEntity {
  const factory ComplaintUpdateEntity({
    required String id,
    required String updatedByUid,
    required String updatedByRole,
    required String status,
    required String? notes,
    required List<String> photoUrls,
    required DateTime timestamp,
  }) = _ComplaintUpdateEntity;

  factory ComplaintUpdateEntity.fromJson(Map<String, dynamic> json) => 
      _$ComplaintUpdateEntityFromJson(json);
}

/// Amenity entity for facility booking
@freezed
class AmenityEntity with _$AmenityEntity {
  const factory AmenityEntity({
    required String id,
    required String societyId,
    required String name,
    required String description,
    required String type, // clubhouse, pool, gym, tennis, etc.
    required int capacity,
    required TimeOfDay openingTime,
    required TimeOfDay closingTime,
    required int bookingDurationMinutes,
    required int advanceBookingDays,
    required double depositAmount,
    required double usageFee,
    required List<String> photoUrls,
    required List<String> rules,
    required bool isActive,
    required Map<String, dynamic> metadata,
  }) = _AmenityEntity;

  factory AmenityEntity.fromJson(Map<String, dynamic> json) => 
      _$AmenityEntityFromJson(json);
}

/// Booking entity for amenity reservations
@freezed
class BookingEntity with _$BookingEntity {
  const factory BookingEntity({
    required String id,
    required String societyId,
    required String amenityId,
    required String bookedByUid,
    required String? flatId,
    required DateTime slotDate,
    required TimeOfDay slotStartTime,
    required TimeOfDay slotEndTime,
    required int numberOfGuests,
    required String status, // pending, confirmed, cancelled, completed, no_show
    required double totalAmount,
    required bool depositPaid,
    required String? cancellationReason,
    required DateTime? cancelledAt,
    required DateTime createdAt,
    required Map<String, dynamic> metadata,
  }) = _BookingEntity;

  factory BookingEntity.fromJson(Map<String, dynamic> json) => 
      _$BookingEntityFromJson(json);
}

/// Announcement entity for notices
@freezed
class AnnouncementEntity with _$AnnouncementEntity {
  const factory AnnouncementEntity({
    required String id,
    required String societyId,
    required String title,
    required String content,
    required String category, // general, emergency, maintenance, event
    required List<String> targetBuildingIds,
    required List<String> targetFloorIds,
    required List<String> targetFlatIds,
    required bool isSocietyWide,
    required String? imageUrl,
    required List<String> attachmentUrls,
    required String postedByUid,
    required DateTime createdAt,
    required DateTime? expiresAt,
    required bool isActive,
    required int readCount,
    required Map<String, dynamic> metadata,
  }) = _AnnouncementEntity;

  factory AnnouncementEntity.fromJson(Map<String, dynamic> json) => 
      _$AnnouncementEntityFromJson(json);
}

/// Payment/Invoice entity for maintenance billing
@freezed
class PaymentEntity with _$PaymentEntity {
  const factory PaymentEntity({
    required String id,
    required String societyId,
    required String flatId,
    required String invoiceNumber,
    required String type, // maintenance, penalty, amenity_fee, event_fee
    required double amount,
    required double paidAmount,
    required String currency,
    required String period, // e.g., "2024-01"
    required DateTime dueDate,
    required String status, // pending, partial, paid, overdue, waived
    required String? paymentMethod,
    required String? transactionId,
    required DateTime? paidAt,
    required String? receiptUrl,
    required List<PaymentBreakdownEntity> breakdown,
    required Map<String, dynamic> metadata,
  }) = _PaymentEntity;

  factory PaymentEntity.fromJson(Map<String, dynamic> json) => 
      _$PaymentEntityFromJson(json);
}

/// Payment breakdown line item
@freezed
class PaymentBreakdownEntity with _$PaymentBreakdownEntity {
  const factory PaymentBreakdownEntity({
    required String description,
    required double amount,
    required String type, // charge, credit, tax
  }) = _PaymentBreakdownEntity;

  factory PaymentBreakdownEntity.fromJson(Map<String, dynamic> json) => 
      _$PaymentBreakdownEntityFromJson(json);
}

/// Emergency/SOS entity
@freezed
class EmergencyEntity with _$EmergencyEntity {
  const factory EmergencyEntity({
    required String id,
    required String societyId,
    required String raisedByUid,
    required String? flatId,
    required String type, // medical, fire, security, other
    required String description,
    required GeoPoint location,
    required String status, // active, responding, resolved
    required List<String> notifiedSecurityUids,
    required List<String> notifiedAdminUids,
    required DateTime createdAt,
    required DateTime? respondedAt,
    required DateTime? resolvedAt,
    required String? resolutionNotes,
    required Map<String, dynamic> metadata,
  }) = _EmergencyEntity;

  factory EmergencyEntity.fromJson(Map<String, dynamic> json) => 
      _$EmergencyEntityFromJson(json);
}

/// Society entity representing a residential complex
@freezed
class SocietyEntity with _$SocietyEntity {
  const factory SocietyEntity({
    required String id,
    required String name,
    required String address,
    required String city,
    required String state,
    required String pincode,
    required String country,
    required GeoPoint? location,
    required List<String> adminUids,
    required List<String> buildingIds,
    required int totalFlats,
    required Map<String, dynamic> settings,
    required DateTime createdAt,
    required DateTime updatedAt,
    required bool isActive,
  }) = _SocietyEntity;

  factory SocietyEntity.fromJson(Map<String, dynamic> json) => 
      _$SocietyEntityFromJson(json);
}
