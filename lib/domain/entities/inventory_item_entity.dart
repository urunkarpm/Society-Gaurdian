import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_item_entity.freezed.dart';
part 'inventory_item_entity.g.dart';

enum InventoryItemType {
  consumable, // e.g., tubelights, bulbs - can be consumed
  durable,    // e.g., tools, equipment - tracked but not consumed
}

enum InventoryItemStatus {
  available,
  inUse,
  maintenance,
  depleted,
}

@freezed
class InventoryItemEntity with _$InventoryItemEntity {
  const factory InventoryItemEntity({
    required String id,
    required String societyId,
    required String name,
    required String category, // e.g., "Electrical", "Tools", "Cleaning"
    required InventoryItemType type,
    required int quantity,
    required String unit, // e.g., "pieces", "boxes", "sets"
    required InventoryItemStatus status,
    int? minQuantity, // Alert threshold for consumables
    String? description,
    String? location, // Where the item is stored
    List<String>? photos,
    DateTime? createdAt,
    String? createdBy,
    DateTime? updatedAt,
    String? updatedBy,
  }) = _InventoryItemEntity;

  factory InventoryItemEntity.fromJson(Map<String, dynamic> json) =>
      _$InventoryItemEntityFromJson(json);
}

@freezed
class InventoryTransactionEntity with _$InventoryTransactionEntity {
  const factory InventoryTransactionEntity({
    required String id,
    required String itemId,
    required String societyId,
    required int quantityChange, // Positive for add, negative for use
    required String transactionType, // "add", "use", "adjustment"
    required String reason,
    String? location, // Where the item was used/installed
    String? description,
    List<String>? evidencePhotos, // Photos showing where item was used
    required DateTime timestamp,
    required String performedBy,
    String? performedByName,
    String? relatedTicketId, // Optional link to maintenance ticket
  }) = _InventoryTransactionEntity;

  factory InventoryTransactionEntity.fromJson(Map<String, dynamic> json) =>
      _$InventoryTransactionEntityFromJson(json);
}
