import 'package:freezed_annotation/freezed_annotation.dart';

part 'complaint_entity.freezed.dart';
part 'complaint_entity.g.dart';

/// Complaint category enum
enum ComplaintCategory {
  electrical,
  plumbing,
  tiles,
  carpentry,
  painting,
  cleaning,
  security,
  elevator,
  waterSupply,
  gardening,
  other,
}

/// Complaint status enum
enum ComplaintStatus {
  open,
  inProgress,
  assigned,
  workInProgress,
  completed,
  resolved,
  closed,
  rejected,
}

/// Complaint priority enum
enum ComplaintPriority {
  low,
  medium,
  high,
  urgent,
}

/// Main complaint entity
@freezed
class ComplaintEntity with _$ComplaintEntity {
  const factory ComplaintEntity({
    required String id,
    required String societyId,
    required String raisedBy,
    required String raisedByName,
    required String flatId,
    required String flatNumber,
    required ComplaintCategory category,
    required String title,
    required String description,
    required ComplaintStatus status,
    required ComplaintPriority priority,
    List<String>? photos,
    String? assignedTo,
    String? assignedToName,
    String? assignedBy,
    DateTime? assignedAt,
    DateTime? estimatedCompletionDate,
    DateTime? completedAt,
    String? completionNotes,
    List<String>? evidencePhotos,
    List<ComplaintUpdate>? updates,
    Map<String, dynamic>? metadata,
    @Default(false) bool isAnonymous,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ComplaintEntity;

  factory ComplaintEntity.fromJson(Map<String, dynamic> json) => _$ComplaintEntityFromJson(json);
}

/// Complaint update/history entry
@freezed
class ComplaintUpdate with _$ComplaintUpdate {
  const factory ComplaintUpdate({
    required String updatedBy,
    required String updatedByName,
    required String action,
    required DateTime timestamp,
    String? comment,
    List<String>? photos,
    ComplaintStatus? previousStatus,
    ComplaintStatus? newStatus,
    String? assignedTo,
    String? assignedToName,
  }) = _ComplaintUpdate;

  factory ComplaintUpdate.fromJson(Map<String, dynamic> json) => _$ComplaintUpdateFromJson(json);
}

/// Worker assignment details
@freezed
class WorkerAssignment with _$WorkerAssignment {
  const factory WorkerAssignment({
    required String workerId,
    required String workerName,
    required String workerPhone,
    required String workerType,
    required DateTime assignedAt,
    String? assignedBy,
    String? notes,
  }) = _WorkerAssignment;

  factory WorkerAssignment.fromJson(Map<String, dynamic> json) => _$WorkerAssignmentFromJson(json);
}

/// Worker profile for complaint management
@freezed
class WorkerProfile with _$WorkerProfile {
  const factory WorkerProfile({
    required String userId,
    required String societyId,
    required String fullName,
    required String phoneNumber,
    required String workerType,
    String? photoUrl,
    String? email,
    String? address,
    List<String>? skills,
    String? licenseNumber,
    @Default(true) bool isActive,
    @Default(0) int totalComplaintsHandled,
    @Default(0.0) double averageRating,
    DateTime? joinedDate,
    Map<String, dynamic>? metadata,
  }) = _WorkerProfile;

  factory WorkerProfile.fromJson(Map<String, dynamic> json) => _$WorkerProfileFromJson(json);
}
