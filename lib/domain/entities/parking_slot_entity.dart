import 'package:freezed_annotation/freezed_annotation.dart';

part 'parking_slot_entity.freezed.dart';
part 'parking_slot_entity.g.dart';

enum ParkingType {
  resident,
  visitor,
}

enum ParkingCategory {
  standard,
  ev,
  guest,
  temporary,
}

@freezed
class ParkingSlotEntity with _$ParkingSlotEntity {
  const factory ParkingSlotEntity({
    required String id,
    required String societyId,
    required String slotNumber, // e.g. B2-147 or V-32
    @Default(ParkingType.visitor) ParkingType type,
    @Default(ParkingCategory.standard) ParkingCategory category,
    @Default('Ground') String floorZone, // e.g., B1, B2, Ground, Gate 1
    @Default(false) bool isOccupied,
    String? assignedFlatNumber, // for resident slots (e.g. B-1204)
    String? currentVehicleNumber, // e.g. MH 01 AB 1234
    String? currentVisitorId, // link to visitor doc if occupied by visitor
    String? currentVisitorName,
    String? currentVisitorFlatNumber,
    DateTime? occupiedAt,
    DateTime? updatedAt,
  }) = _ParkingSlotEntity;

  factory ParkingSlotEntity.fromJson(Map<String, dynamic> json) =>
      _$ParkingSlotEntityFromJson(json);
}

@freezed
class VehicleRegistrationEntity with _$VehicleRegistrationEntity {
  const factory VehicleRegistrationEntity({
    required String id,
    required String societyId,
    required String flatNumber,
    required String vehicleNumber, // e.g. MH 01 XX 1234
    required String ownerName,
    @Default('4 Wheeler') String vehicleType, // 2 Wheeler, 4 Wheeler, EV
    String? slotNumber, // assigned resident parking spot, e.g., B2-147
    DateTime? createdAt,
  }) = _VehicleRegistrationEntity;

  factory VehicleRegistrationEntity.fromJson(Map<String, dynamic> json) =>
      _$VehicleRegistrationEntityFromJson(json);
}
