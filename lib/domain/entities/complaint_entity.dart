import 'package:freezed_annotation/freezed_annotation.dart';

part 'complaint_entity.freezed.dart';
part 'complaint_entity.g.dart';

/// Complaint status enum
enum ComplaintStatus {
  open,
  inProgress,
  resolved,
  closed,
}

/// Complaint priority enum
enum ComplaintPriority {
  low,
  medium,
  high,
  urgent,
}

/// Complaint category enum
enum ComplaintCategory {
  maintenance,
  cleaning,
  security,
  noise,
  parking,
  plumbing,
  electrical,
  elevator,
  garbage,
  waterSupply,
  powerOutage,
  other,
}

/// Complaint entity for tracking resident complaints
@freezed
class ComplaintEntity with _$ComplaintEntity {
  const factory ComplaintEntity({
    required String id,
    required String societyId,
    required String flatNumber,
    required String subject,
    required String description,
    required ComplaintCategory category,
    @Default(ComplaintPriority.medium) ComplaintPriority priority,
    @Default(ComplaintStatus.open) ComplaintStatus status,
    String? assignedTo,
    String? assignedByName,
    DateTime? assignedAt,
    String? resolvedBy,
    String? resolutionNotes,
    DateTime? resolvedAt,
    String? closedBy,
    DateTime? closedAt,
    List<String>? photoUrls,
    Map<String, dynamic>? metadata,
    required String createdBy,
    required DateTime createdAt,
    DateTime? updatedAt,
    String? updatedBy,
  }) = _ComplaintEntity;

  factory ComplaintEntity.fromJson(Map<String, dynamic> json) => 
      _$ComplaintEntityFromJson(json);
}

/// Complaint comment/reply
@freezed
class ComplaintComment with _$ComplaintComment {
  const factory ComplaintComment({
    required String id,
    required String complaintId,
    required String content,
    required String authorId,
    String? authorName,
    String? authorRole,
    List<String>? attachmentUrls,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _ComplaintComment;

  factory ComplaintComment.fromJson(Map<String, dynamic> json) => 
      _$ComplaintCommentFromJson(json);
}
