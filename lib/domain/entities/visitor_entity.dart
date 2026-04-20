import 'package:freezed_annotation/freezed_annotation.dart';

part 'visitor_entity.freezed.dart';
part 'visitor_entity.g.dart';

/// Visitor status enum
enum VisitorStatus {
  pending,
  approved,
  rejected,
  checkedIn,
  checkedOut,
  expired,
}

/// Visitor type enum
enum VisitorType {
  guest,
  delivery,
  service,
  staff,
  vendor,
  other,
}

/// Visitor entity for tracking visitors
@freezed
class VisitorEntity with _$VisitorEntity {
  const factory VisitorEntity({
    required String id,
    required String societyId,
    required String gateName,
    required String visitorName,
    String? visitorPhone,
    String? visitorPhotoUrl,
    String? vehicleNumber,
    String? licensePlatePhotoUrl,
    required String hostFlatId,
    String? hostFlatNumber,
    String? hostName,
    String? hostPhone,
    required String purpose,
    @Default(VisitorType.guest) VisitorType type,
    @Default(VisitorStatus.pending) VisitorStatus status,
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
    required DateTime createdAt,
    String? createdBy,
    DateTime? updatedAt,
    String? updatedBy,
    @Default(false) bool isPreApproved,
    String? preApprovedBy,
    DateTime? preApprovedAt,
    DateTime? validUntil,
    @Default(false) bool isRecurring,
    String? recurringPattern,
    int? visitCount,
    String? lastVisitId,
    // For delivery personnel
    String? deliveryCompany,
    String? trackingNumber,
    String? packageName,
    bool? packageHandedOver,
    String? packageHandoverPhotoUrl,
    String? handedOverTo,
    DateTime? packageHandoverAt,
  }) = _VisitorEntity;

  factory VisitorEntity.fromJson(Map<String, dynamic> json) => _$VisitorEntityFromJson(json);
}

/// Visitor check-in request
@freezed
class VisitorCheckInRequest with _$VisitorCheckInRequest {
  const factory VisitorCheckInRequest({
    required String visitorId,
    required String securityUserId,
    String? photoUrl,
    DateTime? checkInTime,
  }) = _VisitorCheckInRequest;

  factory VisitorCheckInRequest.fromJson(Map<String, dynamic> json) => 
      _$VisitorCheckInRequestFromJson(json);
}

/// Visitor check-out request
@freezed
class VisitorCheckOutRequest with _$VisitorCheckOutRequest {
  const factory VisitorCheckOutRequest({
    required String visitorId,
    required String securityUserId,
    String? reason,
    DateTime? checkOutTime,
  }) = _VisitorCheckOutRequest;

  factory VisitorCheckOutRequest.fromJson(Map<String, dynamic> json) => 
      _$VisitorCheckOutRequestFromJson(json);
}

/// Pre-approval request created by resident
@freezed
class PreApprovalRequest with _$PreApprovalRequest {
  const factory PreApprovalRequest({
    required String id,
    required String societyId,
    required String flatId,
    required String visitorName,
    String? visitorPhone,
    required String purpose,
    @Default(VisitorType.guest) VisitorType type,
    required DateTime validFrom,
    required DateTime validUntil,
    String? recurringPattern, // e.g., "daily", "weekly", "weekdays"
    required String createdBy,
    DateTime? createdAt,
    @Default(true) bool isActive,
    String? notes,
    int? maxVisits,
    int? currentVisitCount,
  }) = _PreApprovalRequest;

  factory PreApprovalRequest.fromJson(Map<String, dynamic> json) => 
      _$PreApprovalRequestFromJson(json);
}

/// Visitor statistics for analytics
@freezed
class VisitorStats with _$VisitorStats {
  const factory VisitorStats({
    @Default(0) int totalVisitorsToday,
    @Default(0) int totalVisitorsThisWeek,
    @Default(0) int totalVisitorsThisMonth,
    @Default(0) int currentlyInside,
    @Default(0) int pendingApprovals,
    @Default(0) int preApprovedToday,
    @Default(0) int deliveriesToday,
    @Default(0) int serviceProvidersToday,
    Map<String, int>? visitorsByHour,
    Map<String, int>? visitorsByGate,
    Map<String, int>? visitorsByType,
  }) = _VisitorStats;

  factory VisitorStats.fromJson(Map<String, dynamic> json) => 
      _$VisitorStatsFromJson(json);
}
