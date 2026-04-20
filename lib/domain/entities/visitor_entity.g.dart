// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VisitorEntityImpl _$$VisitorEntityImplFromJson(Map<String, dynamic> json) =>
    _$VisitorEntityImpl(
      id: json['id'] as String,
      societyId: json['societyId'] as String,
      gateName: json['gateName'] as String,
      visitorName: json['visitorName'] as String,
      visitorPhone: json['visitorPhone'] as String?,
      visitorPhotoUrl: json['visitorPhotoUrl'] as String?,
      vehicleNumber: json['vehicleNumber'] as String?,
      licensePlatePhotoUrl: json['licensePlatePhotoUrl'] as String?,
      hostFlatId: json['hostFlatId'] as String,
      hostFlatNumber: json['hostFlatNumber'] as String?,
      hostName: json['hostName'] as String?,
      hostPhone: json['hostPhone'] as String?,
      purpose: json['purpose'] as String,
      type: $enumDecodeNullable(_$VisitorTypeEnumMap, json['type']) ??
          VisitorType.guest,
      status: $enumDecodeNullable(_$VisitorStatusEnumMap, json['status']) ??
          VisitorStatus.pending,
      expectedArrivalTime: json['expectedArrivalTime'] == null
          ? null
          : DateTime.parse(json['expectedArrivalTime'] as String),
      actualArrivalTime: json['actualArrivalTime'] == null
          ? null
          : DateTime.parse(json['actualArrivalTime'] as String),
      expectedDepartureTime: json['expectedDepartureTime'] == null
          ? null
          : DateTime.parse(json['expectedDepartureTime'] as String),
      actualDepartureTime: json['actualDepartureTime'] == null
          ? null
          : DateTime.parse(json['actualDepartureTime'] as String),
      otp: json['otp'] as String?,
      otpVerifiedBy: (json['otpVerifiedBy'] as num?)?.toInt(),
      approvedBy: json['approvedBy'] as String?,
      approvedAt: json['approvedAt'] == null
          ? null
          : DateTime.parse(json['approvedAt'] as String),
      rejectedBy: json['rejectedBy'] as String?,
      rejectionReason: json['rejectionReason'] as String?,
      rejectedAt: json['rejectedAt'] == null
          ? null
          : DateTime.parse(json['rejectedAt'] as String),
      checkedInBy: json['checkedInBy'] as String?,
      checkedInAt: json['checkedInAt'] == null
          ? null
          : DateTime.parse(json['checkedInAt'] as String),
      checkedOutBy: json['checkedOutBy'] as String?,
      checkedOutAt: json['checkedOutAt'] == null
          ? null
          : DateTime.parse(json['checkedOutAt'] as String),
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      createdBy: json['createdBy'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      updatedBy: json['updatedBy'] as String?,
      isPreApproved: json['isPreApproved'] as bool? ?? false,
      preApprovedBy: json['preApprovedBy'] as String?,
      preApprovedAt: json['preApprovedAt'] == null
          ? null
          : DateTime.parse(json['preApprovedAt'] as String),
      validUntil: json['validUntil'] == null
          ? null
          : DateTime.parse(json['validUntil'] as String),
      isRecurring: json['isRecurring'] as bool? ?? false,
      recurringPattern: json['recurringPattern'] as String?,
      visitCount: (json['visitCount'] as num?)?.toInt(),
      lastVisitId: json['lastVisitId'] as String?,
      deliveryCompany: json['deliveryCompany'] as String?,
      trackingNumber: json['trackingNumber'] as String?,
      packageName: json['packageName'] as String?,
      packageHandedOver: json['packageHandedOver'] as bool?,
      packageHandoverPhotoUrl: json['packageHandoverPhotoUrl'] as String?,
      handedOverTo: json['handedOverTo'] as String?,
      packageHandoverAt: json['packageHandoverAt'] == null
          ? null
          : DateTime.parse(json['packageHandoverAt'] as String),
    );

Map<String, dynamic> _$$VisitorEntityImplToJson(_$VisitorEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'societyId': instance.societyId,
      'gateName': instance.gateName,
      'visitorName': instance.visitorName,
      'visitorPhone': instance.visitorPhone,
      'visitorPhotoUrl': instance.visitorPhotoUrl,
      'vehicleNumber': instance.vehicleNumber,
      'licensePlatePhotoUrl': instance.licensePlatePhotoUrl,
      'hostFlatId': instance.hostFlatId,
      'hostFlatNumber': instance.hostFlatNumber,
      'hostName': instance.hostName,
      'hostPhone': instance.hostPhone,
      'purpose': instance.purpose,
      'type': _$VisitorTypeEnumMap[instance.type]!,
      'status': _$VisitorStatusEnumMap[instance.status]!,
      'expectedArrivalTime': instance.expectedArrivalTime?.toIso8601String(),
      'actualArrivalTime': instance.actualArrivalTime?.toIso8601String(),
      'expectedDepartureTime':
          instance.expectedDepartureTime?.toIso8601String(),
      'actualDepartureTime': instance.actualDepartureTime?.toIso8601String(),
      'otp': instance.otp,
      'otpVerifiedBy': instance.otpVerifiedBy,
      'approvedBy': instance.approvedBy,
      'approvedAt': instance.approvedAt?.toIso8601String(),
      'rejectedBy': instance.rejectedBy,
      'rejectionReason': instance.rejectionReason,
      'rejectedAt': instance.rejectedAt?.toIso8601String(),
      'checkedInBy': instance.checkedInBy,
      'checkedInAt': instance.checkedInAt?.toIso8601String(),
      'checkedOutBy': instance.checkedOutBy,
      'checkedOutAt': instance.checkedOutAt?.toIso8601String(),
      'photos': instance.photos,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'createdBy': instance.createdBy,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'updatedBy': instance.updatedBy,
      'isPreApproved': instance.isPreApproved,
      'preApprovedBy': instance.preApprovedBy,
      'preApprovedAt': instance.preApprovedAt?.toIso8601String(),
      'validUntil': instance.validUntil?.toIso8601String(),
      'isRecurring': instance.isRecurring,
      'recurringPattern': instance.recurringPattern,
      'visitCount': instance.visitCount,
      'lastVisitId': instance.lastVisitId,
      'deliveryCompany': instance.deliveryCompany,
      'trackingNumber': instance.trackingNumber,
      'packageName': instance.packageName,
      'packageHandedOver': instance.packageHandedOver,
      'packageHandoverPhotoUrl': instance.packageHandoverPhotoUrl,
      'handedOverTo': instance.handedOverTo,
      'packageHandoverAt': instance.packageHandoverAt?.toIso8601String(),
    };

const _$VisitorTypeEnumMap = {
  VisitorType.guest: 'guest',
  VisitorType.delivery: 'delivery',
  VisitorType.service: 'service',
  VisitorType.staff: 'staff',
  VisitorType.vendor: 'vendor',
  VisitorType.other: 'other',
};

const _$VisitorStatusEnumMap = {
  VisitorStatus.pending: 'pending',
  VisitorStatus.approved: 'approved',
  VisitorStatus.rejected: 'rejected',
  VisitorStatus.checkedIn: 'checkedIn',
  VisitorStatus.checkedOut: 'checkedOut',
  VisitorStatus.expired: 'expired',
};

_$VisitorCheckInRequestImpl _$$VisitorCheckInRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$VisitorCheckInRequestImpl(
      visitorId: json['visitorId'] as String,
      securityUserId: json['securityUserId'] as String,
      photoUrl: json['photoUrl'] as String?,
      checkInTime: json['checkInTime'] == null
          ? null
          : DateTime.parse(json['checkInTime'] as String),
    );

Map<String, dynamic> _$$VisitorCheckInRequestImplToJson(
        _$VisitorCheckInRequestImpl instance) =>
    <String, dynamic>{
      'visitorId': instance.visitorId,
      'securityUserId': instance.securityUserId,
      'photoUrl': instance.photoUrl,
      'checkInTime': instance.checkInTime?.toIso8601String(),
    };

_$VisitorCheckOutRequestImpl _$$VisitorCheckOutRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$VisitorCheckOutRequestImpl(
      visitorId: json['visitorId'] as String,
      securityUserId: json['securityUserId'] as String,
      reason: json['reason'] as String?,
      checkOutTime: json['checkOutTime'] == null
          ? null
          : DateTime.parse(json['checkOutTime'] as String),
    );

Map<String, dynamic> _$$VisitorCheckOutRequestImplToJson(
        _$VisitorCheckOutRequestImpl instance) =>
    <String, dynamic>{
      'visitorId': instance.visitorId,
      'securityUserId': instance.securityUserId,
      'reason': instance.reason,
      'checkOutTime': instance.checkOutTime?.toIso8601String(),
    };

_$PreApprovalRequestImpl _$$PreApprovalRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PreApprovalRequestImpl(
      id: json['id'] as String,
      societyId: json['societyId'] as String,
      flatId: json['flatId'] as String,
      visitorName: json['visitorName'] as String,
      visitorPhone: json['visitorPhone'] as String?,
      purpose: json['purpose'] as String,
      type: $enumDecodeNullable(_$VisitorTypeEnumMap, json['type']) ??
          VisitorType.guest,
      validFrom: DateTime.parse(json['validFrom'] as String),
      validUntil: DateTime.parse(json['validUntil'] as String),
      recurringPattern: json['recurringPattern'] as String?,
      createdBy: json['createdBy'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      isActive: json['isActive'] as bool? ?? true,
      notes: json['notes'] as String?,
      maxVisits: (json['maxVisits'] as num?)?.toInt(),
      currentVisitCount: (json['currentVisitCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PreApprovalRequestImplToJson(
        _$PreApprovalRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'societyId': instance.societyId,
      'flatId': instance.flatId,
      'visitorName': instance.visitorName,
      'visitorPhone': instance.visitorPhone,
      'purpose': instance.purpose,
      'type': _$VisitorTypeEnumMap[instance.type]!,
      'validFrom': instance.validFrom.toIso8601String(),
      'validUntil': instance.validUntil.toIso8601String(),
      'recurringPattern': instance.recurringPattern,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'isActive': instance.isActive,
      'notes': instance.notes,
      'maxVisits': instance.maxVisits,
      'currentVisitCount': instance.currentVisitCount,
    };

_$VisitorStatsImpl _$$VisitorStatsImplFromJson(Map<String, dynamic> json) =>
    _$VisitorStatsImpl(
      totalVisitorsToday: (json['totalVisitorsToday'] as num?)?.toInt() ?? 0,
      totalVisitorsThisWeek:
          (json['totalVisitorsThisWeek'] as num?)?.toInt() ?? 0,
      totalVisitorsThisMonth:
          (json['totalVisitorsThisMonth'] as num?)?.toInt() ?? 0,
      currentlyInside: (json['currentlyInside'] as num?)?.toInt() ?? 0,
      pendingApprovals: (json['pendingApprovals'] as num?)?.toInt() ?? 0,
      preApprovedToday: (json['preApprovedToday'] as num?)?.toInt() ?? 0,
      deliveriesToday: (json['deliveriesToday'] as num?)?.toInt() ?? 0,
      serviceProvidersToday:
          (json['serviceProvidersToday'] as num?)?.toInt() ?? 0,
      visitorsByHour: (json['visitorsByHour'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
      visitorsByGate: (json['visitorsByGate'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
      visitorsByType: (json['visitorsByType'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
    );

Map<String, dynamic> _$$VisitorStatsImplToJson(_$VisitorStatsImpl instance) =>
    <String, dynamic>{
      'totalVisitorsToday': instance.totalVisitorsToday,
      'totalVisitorsThisWeek': instance.totalVisitorsThisWeek,
      'totalVisitorsThisMonth': instance.totalVisitorsThisMonth,
      'currentlyInside': instance.currentlyInside,
      'pendingApprovals': instance.pendingApprovals,
      'preApprovedToday': instance.preApprovedToday,
      'deliveriesToday': instance.deliveriesToday,
      'serviceProvidersToday': instance.serviceProvidersToday,
      'visitorsByHour': instance.visitorsByHour,
      'visitorsByGate': instance.visitorsByGate,
      'visitorsByType': instance.visitorsByType,
    };
