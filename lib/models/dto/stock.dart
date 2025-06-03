import 'package:decimal/decimal.dart';
import 'package:yata/models/bases/base.dart';

class StockUpdateRequest extends CoreBaseModel {
  /// 在庫更新リクエスト
  final String materialId;
  final Decimal newQuantity;
  final String reason;
  final String? notes;

  StockUpdateRequest({
    required this.materialId,
    required this.newQuantity,
    required this.reason,
    this.notes,
  });

  static String? tableName() => null;

  @override
  Map<String, dynamic> toJson() => {
        'material_id': materialId,
        'new_quantity': newQuantity.toString(),
        'reason': reason,
        'notes': notes,
      };

  factory StockUpdateRequest.fromJson(Map<String, dynamic> json) {
    return StockUpdateRequest(
      materialId: json['material_id'] as String,
      newQuantity: Decimal.parse(json['new_quantity'] as String),
      reason: json['reason'] as String,
      notes: json['notes'] as String?,
    );
  }
}

class PurchaseRequest extends CoreBaseModel {
  /// 仕入れリクエスト
  final List<PurchaseItemDto> items;
  final DateTime purchaseDate;
  final String? notes;

  PurchaseRequest({
    required this.items,
    required this.purchaseDate,
    this.notes,
  });

  static String? tableName() => null;

  @override
  Map<String, dynamic> toJson() => {
        'items': items.map((item) => item.toJson()).toList(),
        'purchase_date': purchaseDate.toIso8601String(),
        'notes': notes,
      };

  factory PurchaseRequest.fromJson(Map<String, dynamic> json) {
    return PurchaseRequest(
      items: (json['items'] as List)
          .map((item) => PurchaseItemDto.fromJson(item as Map<String, dynamic>))
          .toList(),
      purchaseDate: DateTime.parse(json['purchase_date'] as String),
      notes: json['notes'] as String?,
    );
  }
}

class PurchaseItemDto extends CoreBaseModel {
  /// 仕入れアイテムDTO
  final String materialId;
  final Decimal quantity;

  PurchaseItemDto({
    required this.materialId,
    required this.quantity,
  });

  static String? tableName() => null;

  @override
  Map<String, dynamic> toJson() => {
        'material_id': materialId,
        'quantity': quantity.toString(),
      };

  factory PurchaseItemDto.fromJson(Map<String, dynamic> json) {
    return PurchaseItemDto(
      materialId: json['material_id'] as String,
      quantity: Decimal.parse(json['quantity'] as String),
    );
  }
}