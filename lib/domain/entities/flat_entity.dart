import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flat_entity.freezed.dart';
part 'flat_entity.g.dart';

/// Flat entity representing residential units
@freezed
class FlatEntity with _$FlatEntity {
  const factory FlatEntity({
    required String id,
    required String societyId,
    required String buildingNumber,
    required String flatNumber,
    String? floor,
    String? wing,
    int? bedrooms,
    int? bathrooms,
    double? area,
    String? areaUnit, // sqft, sqm
    @Default(true) bool isOccupied,
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
    DateTime? updatedAt,
  }) = _FlatEntity;

  factory FlatEntity.fromJson(Map<String, dynamic> json) => _$FlatEntityFromJson(json);
}

/// Society/Community entity
@freezed
class SocietyEntity with _$SocietyEntity {
  const factory SocietyEntity({
    required String id,
    required String name,
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
    @Default(true) bool isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _SocietyEntity;

  factory SocietyEntity.fromJson(Map<String, dynamic> json) => _$SocietyEntityFromJson(json);
}

/// Building entity within a society
@freezed
class BuildingEntity with _$BuildingEntity {
  const factory BuildingEntity({
    required String id,
    required String societyId,
    required String buildingNumber,
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
    DateTime? updatedAt,
  }) = _BuildingEntity;

  factory BuildingEntity.fromJson(Map<String, dynamic> json) => 
      _$BuildingEntityFromJson(json);
}

/// Amenity entity for facility booking
@freezed
class AmenityEntity with _$AmenityEntity {
  const factory AmenityEntity({
    required String id,
    required String societyId,
    required String name,
    String? description,
    String? type, // clubhouse, pool, gym, tennis, etc.
    String? imageUrl,
    int? capacity,
    @JsonKey(includeFromJson: false, includeToJson: false) TimeOfDay? openingTime,
    @JsonKey(includeFromJson: false, includeToJson: false) TimeOfDay? closingTime,
    List<int>? availableDays, // 0=Sunday, 1=Monday, etc.
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
    DateTime? updatedAt,
  }) = _AmenityEntity;

  factory AmenityEntity.fromJson(Map<String, dynamic> json) => 
      _$AmenityEntityFromJson(json);
}

/// Amenity booking entity
@freezed
class BookingEntity with _$BookingEntity {
  const factory BookingEntity({
    required String id,
    required String societyId,
    required String amenityId,
    required String amenityName,
    required String flatId,
    required String bookedBy,
    String? bookerName,
    String? bookerPhone,
    required DateTime startTime,
    required DateTime endTime,
    String? purpose,
    int? expectedGuests,
    @Default('pending') String status, // pending, confirmed, cancelled, completed
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
    DateTime? updatedAt,
  }) = _BookingEntity;

  factory BookingEntity.fromJson(Map<String, dynamic> json) => 
      _$BookingEntityFromJson(json);
}

/// GeoPoint for location data
@freezed
class GeoPoint with _$GeoPoint {
  const factory GeoPoint({
    required double latitude,
    required double longitude,
  }) = _GeoPoint;

  factory GeoPoint.fromJson(Map<String, dynamic> json) => _$GeoPointFromJson(json);
}
