import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_entity.freezed.dart';
part 'vendor_entity.g.dart';

/// Contract or AMC details for a vendor
@freezed
class VendorContractEntity with _$VendorContractEntity {
  const factory VendorContractEntity({
    required String id,
    required String vendorId,
    required String title, // e.g. "Lift AMC Block A"
    required String serviceType, // e.g. "Elevator", "Security", "Plumbing"
    required DateTime startDate,
    required DateTime expiryDate,
    required double monthlyCost,
    @Default('INR') String currency,
    DateTime? lastServiceDate,
    DateTime? nextServiceDate,
    String? contractDocumentUrl,
    String? notes,
    @Default('active') String status, // active, expired, terminated, pending_renewal
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _VendorContractEntity;

  factory VendorContractEntity.fromJson(Map<String, dynamic> json) =>
      _$VendorContractEntityFromJson(json);
}

/// Bill and payment records for vendor
@freezed
class VendorBillEntity with _$VendorBillEntity {
  const factory VendorBillEntity({
    required String id,
    required String vendorId,
    String? contractId,
    required String invoiceNumber,
    required double amount,
    @Default('INR') String currency,
    required DateTime dueDate,
    required String status, // pending, paid, overdue, cancelled
    DateTime? paidAt,
    String? paymentMethod,
    String? transactionId,
    String? receiptUrl,
    String? notes,
    DateTime? createdAt,
  }) = _VendorBillEntity;

  factory VendorBillEntity.fromJson(Map<String, dynamic> json) =>
      _$VendorBillEntityFromJson(json);
}

/// Rating, performance review, or complaint log for a vendor
@freezed
class VendorPerformanceEntity with _$VendorPerformanceEntity {
  const factory VendorPerformanceEntity({
    required String id,
    required String vendorId,
    required String type, // review, complaint, service_log
    required String title,
    required String description,
    double? rating, // 1.0 to 5.0
    String? loggedBy,
    String? loggedByName,
    String? linkedComplaintId,
    DateTime? date,
    DateTime? createdAt,
  }) = _VendorPerformanceEntity;

  factory VendorPerformanceEntity.fromJson(Map<String, dynamic> json) =>
      _$VendorPerformanceEntityFromJson(json);
}

/// Vendor Profile & Directory Entity
@freezed
class VendorEntity with _$VendorEntity {
  @JsonSerializable(explicitToJson: true)
  const factory VendorEntity({
    required String id,
    required String societyId,
    required String name, // e.g. "XYZ Elevators"
    required String category, // e.g. Elevator, Electrical, Plumbing, Security, Cleaning, Landscaping, General
    required String contactPerson,
    required String phone,
    String? email,
    String? address,
    String? gstNumber,
    @Default(5.0) double rating,
    @Default('active') String status, // active, inactive, blacklisted
    @Default([]) List<VendorContractEntity> contracts,
    @Default([]) List<VendorBillEntity> bills,
    @Default([]) List<VendorPerformanceEntity> performanceLogs,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _VendorEntity;

  factory VendorEntity.fromJson(Map<String, dynamic> json) =>
      _$VendorEntityFromJson(json);
}
