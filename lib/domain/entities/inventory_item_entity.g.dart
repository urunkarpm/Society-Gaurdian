// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InventoryItemEntityImpl _$$InventoryItemEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryItemEntityImpl(
      id: json['id'] as String,
      societyId: json['societyId'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      type: $enumDecode(_$InventoryItemTypeEnumMap, json['type']),
      quantity: (json['quantity'] as num).toInt(),
      unit: json['unit'] as String,
      status: $enumDecode(_$InventoryItemStatusEnumMap, json['status']),
      minQuantity: (json['minQuantity'] as num?)?.toInt(),
      description: json['description'] as String?,
      location: json['location'] as String?,
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      createdBy: json['createdBy'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      updatedBy: json['updatedBy'] as String?,
    );

Map<String, dynamic> _$$InventoryItemEntityImplToJson(
        _$InventoryItemEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'societyId': instance.societyId,
      'name': instance.name,
      'category': instance.category,
      'type': _$InventoryItemTypeEnumMap[instance.type]!,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'status': _$InventoryItemStatusEnumMap[instance.status]!,
      'minQuantity': instance.minQuantity,
      'description': instance.description,
      'location': instance.location,
      'photos': instance.photos,
      'createdAt': instance.createdAt?.toIso8601String(),
      'createdBy': instance.createdBy,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'updatedBy': instance.updatedBy,
    };

const _$InventoryItemTypeEnumMap = {
  InventoryItemType.consumable: 'consumable',
  InventoryItemType.durable: 'durable',
};

const _$InventoryItemStatusEnumMap = {
  InventoryItemStatus.available: 'available',
  InventoryItemStatus.inUse: 'inUse',
  InventoryItemStatus.maintenance: 'maintenance',
  InventoryItemStatus.depleted: 'depleted',
};

_$InventoryTransactionEntityImpl _$$InventoryTransactionEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryTransactionEntityImpl(
      id: json['id'] as String,
      itemId: json['itemId'] as String,
      societyId: json['societyId'] as String,
      quantityChange: (json['quantityChange'] as num).toInt(),
      transactionType: json['transactionType'] as String,
      reason: json['reason'] as String,
      location: json['location'] as String?,
      description: json['description'] as String?,
      evidencePhotos: (json['evidencePhotos'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      performedBy: json['performedBy'] as String,
      performedByName: json['performedByName'] as String?,
      relatedTicketId: json['relatedTicketId'] as String?,
    );

Map<String, dynamic> _$$InventoryTransactionEntityImplToJson(
        _$InventoryTransactionEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemId': instance.itemId,
      'societyId': instance.societyId,
      'quantityChange': instance.quantityChange,
      'transactionType': instance.transactionType,
      'reason': instance.reason,
      'location': instance.location,
      'description': instance.description,
      'evidencePhotos': instance.evidencePhotos,
      'timestamp': instance.timestamp.toIso8601String(),
      'performedBy': instance.performedBy,
      'performedByName': instance.performedByName,
      'relatedTicketId': instance.relatedTicketId,
    };
