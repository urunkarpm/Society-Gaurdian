// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationEntityImpl _$$NotificationEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationEntityImpl(
      id: json['id'] as String,
      societyId: json['societyId'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      imageUrl: json['imageUrl'] as String?,
      data: json['data'] as Map<String, dynamic>?,
      deepLink: json['deepLink'] as String?,
      targetUserIds: (json['targetUserIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      targetFlatIds: (json['targetFlatIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      targetRole: json['targetRole'] as String?,
      isSocietyWide: json['isSocietyWide'] as bool?,
      createdBy: json['createdBy'] as String?,
      createdByName: json['createdByName'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      isRead: json['isRead'] as bool? ?? false,
      readAt: json['readAt'] == null
          ? null
          : DateTime.parse(json['readAt'] as String),
      readBy: json['readBy'] as String?,
      priority: (json['priority'] as num?)?.toInt() ?? 0,
      shouldSendPush: json['shouldSendPush'] as bool? ?? true,
      shouldShowInApp: json['shouldShowInApp'] as bool? ?? true,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$NotificationEntityImplToJson(
        _$NotificationEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'societyId': instance.societyId,
      'type': instance.type,
      'title': instance.title,
      'body': instance.body,
      'imageUrl': instance.imageUrl,
      'data': instance.data,
      'deepLink': instance.deepLink,
      'targetUserIds': instance.targetUserIds,
      'targetFlatIds': instance.targetFlatIds,
      'targetRole': instance.targetRole,
      'isSocietyWide': instance.isSocietyWide,
      'createdBy': instance.createdBy,
      'createdByName': instance.createdByName,
      'createdAt': instance.createdAt?.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'isRead': instance.isRead,
      'readAt': instance.readAt?.toIso8601String(),
      'readBy': instance.readBy,
      'priority': instance.priority,
      'shouldSendPush': instance.shouldSendPush,
      'shouldShowInApp': instance.shouldShowInApp,
      'metadata': instance.metadata,
    };

_$ComplaintEntityImpl _$$ComplaintEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ComplaintEntityImpl(
      id: json['id'] as String,
      societyId: json['societyId'] as String,
      flatId: json['flatId'] as String,
      raisedBy: json['raisedBy'] as String,
      raiserName: json['raiserName'] as String?,
      raiserPhone: json['raiserPhone'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      subCategory: json['subCategory'] as String?,
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      videos:
          (json['videos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      location: json['location'] as String?,
      preferredDate: json['preferredDate'] as String?,
      status: json['status'] as String? ?? 'open',
      assignedTo: json['assignedTo'] as String?,
      assignedToName: json['assignedToName'] as String?,
      assignedAt: json['assignedAt'] == null
          ? null
          : DateTime.parse(json['assignedAt'] as String),
      resolution: json['resolution'] as String?,
      resolvedBy: json['resolvedBy'] as String?,
      resolvedAt: json['resolvedAt'] == null
          ? null
          : DateTime.parse(json['resolvedAt'] as String),
      closedAt: json['closedAt'] == null
          ? null
          : DateTime.parse(json['closedAt'] as String),
      cost: (json['cost'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      paymentId: json['paymentId'] as String?,
      isPaid: json['isPaid'] as bool?,
      updates: (json['updates'] as List<dynamic>?)
          ?.map((e) => ComplaintUpdate.fromJson(e as Map<String, dynamic>))
          .toList(),
      priority: (json['priority'] as num?)?.toInt(),
      slaDeadline: json['slaDeadline'] == null
          ? null
          : DateTime.parse(json['slaDeadline'] as String),
      isSlaBreached: json['isSlaBreached'] as bool?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ComplaintEntityImplToJson(
        _$ComplaintEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'societyId': instance.societyId,
      'flatId': instance.flatId,
      'raisedBy': instance.raisedBy,
      'raiserName': instance.raiserName,
      'raiserPhone': instance.raiserPhone,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'subCategory': instance.subCategory,
      'photos': instance.photos,
      'videos': instance.videos,
      'location': instance.location,
      'preferredDate': instance.preferredDate,
      'status': instance.status,
      'assignedTo': instance.assignedTo,
      'assignedToName': instance.assignedToName,
      'assignedAt': instance.assignedAt?.toIso8601String(),
      'resolution': instance.resolution,
      'resolvedBy': instance.resolvedBy,
      'resolvedAt': instance.resolvedAt?.toIso8601String(),
      'closedAt': instance.closedAt?.toIso8601String(),
      'cost': instance.cost,
      'currency': instance.currency,
      'paymentId': instance.paymentId,
      'isPaid': instance.isPaid,
      'updates': instance.updates,
      'priority': instance.priority,
      'slaDeadline': instance.slaDeadline?.toIso8601String(),
      'isSlaBreached': instance.isSlaBreached,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$ComplaintUpdateImpl _$$ComplaintUpdateImplFromJson(
        Map<String, dynamic> json) =>
    _$ComplaintUpdateImpl(
      id: json['id'] as String,
      complaintId: json['complaintId'] as String,
      updatedBy: json['updatedBy'] as String,
      updaterName: json['updaterName'] as String?,
      status: json['status'] as String,
      message: json['message'] as String?,
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$ComplaintUpdateImplToJson(
        _$ComplaintUpdateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'complaintId': instance.complaintId,
      'updatedBy': instance.updatedBy,
      'updaterName': instance.updaterName,
      'status': instance.status,
      'message': instance.message,
      'photos': instance.photos,
      'timestamp': instance.timestamp?.toIso8601String(),
    };

_$AnnouncementEntityImpl _$$AnnouncementEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$AnnouncementEntityImpl(
      id: json['id'] as String,
      societyId: json['societyId'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      category: json['category'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      imageUrl: json['imageUrl'] as String?,
      postedBy: json['postedBy'] as String?,
      postedByName: json['postedByName'] as String?,
      postedAt: json['postedAt'] == null
          ? null
          : DateTime.parse(json['postedAt'] as String),
      validFrom: json['validFrom'] == null
          ? null
          : DateTime.parse(json['validFrom'] as String),
      validUntil: json['validUntil'] == null
          ? null
          : DateTime.parse(json['validUntil'] as String),
      isPinned: json['isPinned'] as bool? ?? false,
      isEmergency: json['isEmergency'] as bool? ?? false,
      targetBuildings: (json['targetBuildings'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      targetFlats: (json['targetFlats'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isSocietyWide: json['isSocietyWide'] as bool?,
      viewCount: (json['viewCount'] as num?)?.toInt(),
      readByFlat: (json['readByFlat'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$AnnouncementEntityImplToJson(
        _$AnnouncementEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'societyId': instance.societyId,
      'title': instance.title,
      'content': instance.content,
      'category': instance.category,
      'attachments': instance.attachments,
      'imageUrl': instance.imageUrl,
      'postedBy': instance.postedBy,
      'postedByName': instance.postedByName,
      'postedAt': instance.postedAt?.toIso8601String(),
      'validFrom': instance.validFrom?.toIso8601String(),
      'validUntil': instance.validUntil?.toIso8601String(),
      'isPinned': instance.isPinned,
      'isEmergency': instance.isEmergency,
      'targetBuildings': instance.targetBuildings,
      'targetFlats': instance.targetFlats,
      'isSocietyWide': instance.isSocietyWide,
      'viewCount': instance.viewCount,
      'readByFlat': instance.readByFlat,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$PaymentEntityImpl _$$PaymentEntityImplFromJson(Map<String, dynamic> json) =>
    _$PaymentEntityImpl(
      id: json['id'] as String,
      societyId: json['societyId'] as String,
      flatId: json['flatId'] as String,
      flatNumber: json['flatNumber'] as String?,
      type: json['type'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String?,
      status: json['status'] as String,
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      paidAt: json['paidAt'] == null
          ? null
          : DateTime.parse(json['paidAt'] as String),
      paymentMethod: json['paymentMethod'] as String?,
      transactionId: json['transactionId'] as String?,
      gateway: json['gateway'] as String?,
      receiptUrl: json['receiptUrl'] as String?,
      items:
          (json['items'] as List<dynamic>?)?.map((e) => e as String).toList(),
      breakdown: json['breakdown'] as Map<String, dynamic>?,
      discount: (json['discount'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      lateFee: (json['lateFee'] as num?)?.toDouble(),
      lastReminderSent: json['lastReminderSent'] == null
          ? null
          : DateTime.parse(json['lastReminderSent'] as String),
      reminderCount: (json['reminderCount'] as num?)?.toInt(),
      raisedBy: json['raisedBy'] as String?,
      paidBy: json['paidBy'] as String?,
      paidByName: json['paidByName'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PaymentEntityImplToJson(_$PaymentEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'societyId': instance.societyId,
      'flatId': instance.flatId,
      'flatNumber': instance.flatNumber,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'amount': instance.amount,
      'currency': instance.currency,
      'status': instance.status,
      'dueDate': instance.dueDate?.toIso8601String(),
      'paidAt': instance.paidAt?.toIso8601String(),
      'paymentMethod': instance.paymentMethod,
      'transactionId': instance.transactionId,
      'gateway': instance.gateway,
      'receiptUrl': instance.receiptUrl,
      'items': instance.items,
      'breakdown': instance.breakdown,
      'discount': instance.discount,
      'tax': instance.tax,
      'lateFee': instance.lateFee,
      'lastReminderSent': instance.lastReminderSent?.toIso8601String(),
      'reminderCount': instance.reminderCount,
      'raisedBy': instance.raisedBy,
      'paidBy': instance.paidBy,
      'paidByName': instance.paidByName,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$EmergencyEntityImpl _$$EmergencyEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$EmergencyEntityImpl(
      id: json['id'] as String,
      societyId: json['societyId'] as String,
      flatId: json['flatId'] as String,
      flatNumber: json['flatNumber'] as String?,
      raisedBy: json['raisedBy'] as String,
      raiserName: json['raiserName'] as String?,
      raiserPhone: json['raiserPhone'] as String?,
      type: json['type'] as String,
      description: json['description'] as String,
      location: json['location'] == null
          ? null
          : GeoPoint.fromJson(json['location'] as Map<String, dynamic>),
      status: json['status'] as String?,
      respondedBy: (json['respondedBy'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      acknowledgedAt: json['acknowledgedAt'] == null
          ? null
          : DateTime.parse(json['acknowledgedAt'] as String),
      resolvedAt: json['resolvedAt'] == null
          ? null
          : DateTime.parse(json['resolvedAt'] as String),
      resolution: json['resolution'] as String?,
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      videos:
          (json['videos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$EmergencyEntityImplToJson(
        _$EmergencyEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'societyId': instance.societyId,
      'flatId': instance.flatId,
      'flatNumber': instance.flatNumber,
      'raisedBy': instance.raisedBy,
      'raiserName': instance.raiserName,
      'raiserPhone': instance.raiserPhone,
      'type': instance.type,
      'description': instance.description,
      'location': instance.location,
      'status': instance.status,
      'respondedBy': instance.respondedBy,
      'acknowledgedAt': instance.acknowledgedAt?.toIso8601String(),
      'resolvedAt': instance.resolvedAt?.toIso8601String(),
      'resolution': instance.resolution,
      'photos': instance.photos,
      'videos': instance.videos,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$PatrolLogEntityImpl _$$PatrolLogEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$PatrolLogEntityImpl(
      id: json['id'] as String,
      societyId: json['societyId'] as String,
      securityUserId: json['securityUserId'] as String,
      securityUserName: json['securityUserName'] as String?,
      checkpointId: json['checkpointId'] as String,
      checkpointName: json['checkpointName'] as String?,
      checkpointLocation: json['checkpointLocation'] == null
          ? null
          : GeoPoint.fromJson(
              json['checkpointLocation'] as Map<String, dynamic>),
      checkInTime: json['checkInTime'] == null
          ? null
          : DateTime.parse(json['checkInTime'] as String),
      checkOutTime: json['checkOutTime'] == null
          ? null
          : DateTime.parse(json['checkOutTime'] as String),
      notes: json['notes'] as String?,
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      hasIssue: json['hasIssue'] as bool?,
      issueDescription: json['issueDescription'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PatrolLogEntityImplToJson(
        _$PatrolLogEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'societyId': instance.societyId,
      'securityUserId': instance.securityUserId,
      'securityUserName': instance.securityUserName,
      'checkpointId': instance.checkpointId,
      'checkpointName': instance.checkpointName,
      'checkpointLocation': instance.checkpointLocation,
      'checkInTime': instance.checkInTime?.toIso8601String(),
      'checkOutTime': instance.checkOutTime?.toIso8601String(),
      'notes': instance.notes,
      'photos': instance.photos,
      'hasIssue': instance.hasIssue,
      'issueDescription': instance.issueDescription,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt?.toIso8601String(),
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
