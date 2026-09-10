// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_slot_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParkingSlotEntityImpl _$$ParkingSlotEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ParkingSlotEntityImpl(
      id: json['id'] as String,
      societyId: json['societyId'] as String,
      slotNumber: json['slotNumber'] as String,
      type: $enumDecodeNullable(_$ParkingTypeEnumMap, json['type']) ??
          ParkingType.visitor,
      category:
          $enumDecodeNullable(_$ParkingCategoryEnumMap, json['category']) ??
              ParkingCategory.standard,
      floorZone: json['floorZone'] as String? ?? 'Ground',
      isOccupied: json['isOccupied'] as bool? ?? false,
      assignedFlatNumber: json['assignedFlatNumber'] as String?,
      currentVehicleNumber: json['currentVehicleNumber'] as String?,
      currentVisitorId: json['currentVisitorId'] as String?,
      currentVisitorName: json['currentVisitorName'] as String?,
      currentVisitorFlatNumber: json['currentVisitorFlatNumber'] as String?,
      occupiedAt: json['occupiedAt'] == null
          ? null
          : DateTime.parse(json['occupiedAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ParkingSlotEntityImplToJson(
        _$ParkingSlotEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'societyId': instance.societyId,
      'slotNumber': instance.slotNumber,
      'type': _$ParkingTypeEnumMap[instance.type]!,
      'category': _$ParkingCategoryEnumMap[instance.category]!,
      'floorZone': instance.floorZone,
      'isOccupied': instance.isOccupied,
      'assignedFlatNumber': instance.assignedFlatNumber,
      'currentVehicleNumber': instance.currentVehicleNumber,
      'currentVisitorId': instance.currentVisitorId,
      'currentVisitorName': instance.currentVisitorName,
      'currentVisitorFlatNumber': instance.currentVisitorFlatNumber,
      'occupiedAt': instance.occupiedAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$ParkingTypeEnumMap = {
  ParkingType.resident: 'resident',
  ParkingType.visitor: 'visitor',
};

const _$ParkingCategoryEnumMap = {
  ParkingCategory.standard: 'standard',
  ParkingCategory.ev: 'ev',
  ParkingCategory.guest: 'guest',
  ParkingCategory.temporary: 'temporary',
};

_$VehicleRegistrationEntityImpl _$$VehicleRegistrationEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$VehicleRegistrationEntityImpl(
      id: json['id'] as String,
      societyId: json['societyId'] as String,
      flatNumber: json['flatNumber'] as String,
      vehicleNumber: json['vehicleNumber'] as String,
      ownerName: json['ownerName'] as String,
      vehicleType: json['vehicleType'] as String? ?? '4 Wheeler',
      slotNumber: json['slotNumber'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$VehicleRegistrationEntityImplToJson(
        _$VehicleRegistrationEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'societyId': instance.societyId,
      'flatNumber': instance.flatNumber,
      'vehicleNumber': instance.vehicleNumber,
      'ownerName': instance.ownerName,
      'vehicleType': instance.vehicleType,
      'slotNumber': instance.slotNumber,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
