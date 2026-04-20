// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flat_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlatEntityImpl _$$FlatEntityImplFromJson(Map<String, dynamic> json) =>
    _$FlatEntityImpl(
      id: json['id'] as String,
      societyId: json['societyId'] as String,
      buildingNumber: json['buildingNumber'] as String,
      flatNumber: json['flatNumber'] as String,
      floor: json['floor'] as String?,
      wing: json['wing'] as String?,
      bedrooms: (json['bedrooms'] as num?)?.toInt(),
      bathrooms: (json['bathrooms'] as num?)?.toInt(),
      area: (json['area'] as num?)?.toDouble(),
      areaUnit: json['areaUnit'] as String?,
      isOccupied: json['isOccupied'] as bool? ?? true,
      occupiedSince: json['occupiedSince'] == null
          ? null
          : DateTime.parse(json['occupiedSince'] as String),
      residentUids: (json['residentUids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      primaryContactUid: json['primaryContactUid'] as String?,
      fcmTokens: (json['fcmTokens'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      amenities: json['amenities'] as Map<String, dynamic>?,
      hasParking: json['hasParking'] as bool?,
      parkingSlotNumber: json['parkingSlotNumber'] as String?,
      parkingSlots: (json['parkingSlots'] as num?)?.toInt(),
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$FlatEntityImplToJson(_$FlatEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'societyId': instance.societyId,
      'buildingNumber': instance.buildingNumber,
      'flatNumber': instance.flatNumber,
      'floor': instance.floor,
      'wing': instance.wing,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'area': instance.area,
      'areaUnit': instance.areaUnit,
      'isOccupied': instance.isOccupied,
      'occupiedSince': instance.occupiedSince?.toIso8601String(),
      'residentUids': instance.residentUids,
      'primaryContactUid': instance.primaryContactUid,
      'fcmTokens': instance.fcmTokens,
      'amenities': instance.amenities,
      'hasParking': instance.hasParking,
      'parkingSlotNumber': instance.parkingSlotNumber,
      'parkingSlots': instance.parkingSlots,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$SocietyEntityImpl _$$SocietyEntityImplFromJson(Map<String, dynamic> json) =>
    _$SocietyEntityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      shortName: json['shortName'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      pincode: json['pincode'] as String?,
      country: json['country'] as String?,
      location: json['location'] == null
          ? null
          : GeoPoint.fromJson(json['location'] as Map<String, dynamic>),
      buildings: (json['buildings'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      totalFlats: (json['totalFlats'] as num?)?.toInt(),
      occupiedFlats: (json['occupiedFlats'] as num?)?.toInt(),
      adminUids: (json['adminUids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      amenities: (json['amenities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      settings: json['settings'] as Map<String, dynamic>?,
      rules: json['rules'] as Map<String, dynamic>?,
      logoUrl: json['logoUrl'] as String?,
      bannerUrl: json['bannerUrl'] as String?,
      contactEmail: json['contactEmail'] as String?,
      contactPhone: json['contactPhone'] as String?,
      emergencyPhone: json['emergencyPhone'] as String?,
      gateNames: (json['gateNames'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      isActive: json['isActive'] as bool? ?? true,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$SocietyEntityImplToJson(_$SocietyEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortName': instance.shortName,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'pincode': instance.pincode,
      'country': instance.country,
      'location': instance.location,
      'buildings': instance.buildings,
      'totalFlats': instance.totalFlats,
      'occupiedFlats': instance.occupiedFlats,
      'adminUids': instance.adminUids,
      'amenities': instance.amenities,
      'settings': instance.settings,
      'rules': instance.rules,
      'logoUrl': instance.logoUrl,
      'bannerUrl': instance.bannerUrl,
      'contactEmail': instance.contactEmail,
      'contactPhone': instance.contactPhone,
      'emergencyPhone': instance.emergencyPhone,
      'gateNames': instance.gateNames,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$BuildingEntityImpl _$$BuildingEntityImplFromJson(Map<String, dynamic> json) =>
    _$BuildingEntityImpl(
      id: json['id'] as String,
      societyId: json['societyId'] as String,
      buildingNumber: json['buildingNumber'] as String,
      buildingName: json['buildingName'] as String?,
      totalFloors: (json['totalFloors'] as num?)?.toInt(),
      flatsPerFloor: (json['flatsPerFloor'] as num?)?.toInt(),
      totalFlats: (json['totalFlats'] as num?)?.toInt(),
      wings:
          (json['wings'] as List<dynamic>?)?.map((e) => e as String).toList(),
      amenities: json['amenities'] as Map<String, dynamic>?,
      hasLift: json['hasLift'] as bool?,
      hasParking: json['hasParking'] as bool?,
      totalParkingSlots: (json['totalParkingSlots'] as num?)?.toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$BuildingEntityImplToJson(
        _$BuildingEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'societyId': instance.societyId,
      'buildingNumber': instance.buildingNumber,
      'buildingName': instance.buildingName,
      'totalFloors': instance.totalFloors,
      'flatsPerFloor': instance.flatsPerFloor,
      'totalFlats': instance.totalFlats,
      'wings': instance.wings,
      'amenities': instance.amenities,
      'hasLift': instance.hasLift,
      'hasParking': instance.hasParking,
      'totalParkingSlots': instance.totalParkingSlots,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$AmenityEntityImpl _$$AmenityEntityImplFromJson(Map<String, dynamic> json) =>
    _$AmenityEntityImpl(
      id: json['id'] as String,
      societyId: json['societyId'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      type: json['type'] as String?,
      imageUrl: json['imageUrl'] as String?,
      capacity: (json['capacity'] as num?)?.toInt(),
      availableDays: (json['availableDays'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      requiresBooking: json['requiresBooking'] as bool?,
      requiresDeposit: json['requiresDeposit'] as bool?,
      depositAmount: (json['depositAmount'] as num?)?.toDouble(),
      hourlyRate: (json['hourlyRate'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      maxBookingDurationHours:
          (json['maxBookingDurationHours'] as num?)?.toInt(),
      advanceBookingDays: (json['advanceBookingDays'] as num?)?.toInt(),
      isActive: json['isActive'] as bool?,
      rules: json['rules'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$AmenityEntityImplToJson(_$AmenityEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'societyId': instance.societyId,
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'imageUrl': instance.imageUrl,
      'capacity': instance.capacity,
      'availableDays': instance.availableDays,
      'requiresBooking': instance.requiresBooking,
      'requiresDeposit': instance.requiresDeposit,
      'depositAmount': instance.depositAmount,
      'hourlyRate': instance.hourlyRate,
      'currency': instance.currency,
      'maxBookingDurationHours': instance.maxBookingDurationHours,
      'advanceBookingDays': instance.advanceBookingDays,
      'isActive': instance.isActive,
      'rules': instance.rules,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$BookingEntityImpl _$$BookingEntityImplFromJson(Map<String, dynamic> json) =>
    _$BookingEntityImpl(
      id: json['id'] as String,
      societyId: json['societyId'] as String,
      amenityId: json['amenityId'] as String,
      amenityName: json['amenityName'] as String,
      flatId: json['flatId'] as String,
      bookedBy: json['bookedBy'] as String,
      bookerName: json['bookerName'] as String?,
      bookerPhone: json['bookerPhone'] as String?,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      purpose: json['purpose'] as String?,
      expectedGuests: (json['expectedGuests'] as num?)?.toInt(),
      status: json['status'] as String? ?? 'pending',
      depositPaid: json['depositPaid'] as bool?,
      depositAmount: (json['depositAmount'] as num?)?.toDouble(),
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      paymentId: json['paymentId'] as String?,
      cancellationReason: json['cancellationReason'] as String?,
      cancelledAt: json['cancelledAt'] == null
          ? null
          : DateTime.parse(json['cancelledAt'] as String),
      cancelledBy: json['cancelledBy'] as String?,
      attendeeUids: (json['attendeeUids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$BookingEntityImplToJson(_$BookingEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'societyId': instance.societyId,
      'amenityId': instance.amenityId,
      'amenityName': instance.amenityName,
      'flatId': instance.flatId,
      'bookedBy': instance.bookedBy,
      'bookerName': instance.bookerName,
      'bookerPhone': instance.bookerPhone,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'purpose': instance.purpose,
      'expectedGuests': instance.expectedGuests,
      'status': instance.status,
      'depositPaid': instance.depositPaid,
      'depositAmount': instance.depositAmount,
      'totalAmount': instance.totalAmount,
      'paymentId': instance.paymentId,
      'cancellationReason': instance.cancellationReason,
      'cancelledAt': instance.cancelledAt?.toIso8601String(),
      'cancelledBy': instance.cancelledBy,
      'attendeeUids': instance.attendeeUids,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$GeoPointImpl _$$GeoPointImplFromJson(Map<String, dynamic> json) =>
    _$GeoPointImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$GeoPointImplToJson(_$GeoPointImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
