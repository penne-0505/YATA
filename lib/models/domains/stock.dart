import 'package:decimal/decimal.dart';
import 'package:yata/utils/constants/option_enums.dart';
import 'package:yata/models/bases/base.dart';

class StockTransaction extends CoreBaseModel {
  /// 在庫取引記録
  final String? id;
  final String materialId; // 材料ID
  final TransactionType transactionType; // 取引タイプ
  final Decimal changeAmount; // 変動量（正=入庫、負=出庫）
  final ReferenceType? referenceType; // 参照タイプ
  final String? referenceId; // 参照ID
  final String? notes; // 備考
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? userId;

  StockTransaction({
    this.id,
    required this.materialId,
    required this.transactionType,
    required this.changeAmount,
    this.referenceType,
    this.referenceId,
    this.notes,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  static String tableName() => 'stock_transactions';

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'material_id': materialId,
        'transaction_type': transactionType.value,
        'change_amount': changeAmount.toString(),
        'reference_type': referenceType?.value,
        'reference_id': referenceId,
        'notes': notes,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user_id': userId,
      };

  factory StockTransaction.fromJson(Map<String, dynamic> json) {
    return StockTransaction(
      id: json['id'] as String?,
      materialId: json['material_id'] as String,
      transactionType: TransactionType.fromString(json['transaction_type'] as String),
      changeAmount: Decimal.parse(json['change_amount'] as String),
      referenceType: json['reference_type'] != null
          ? ReferenceType.fromString(json['reference_type'] as String)
          : null,
      referenceId: json['reference_id'] as String?,
      notes: json['notes'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
      userId: json['user_id'] as String?,
    );
  }
}

class Purchase extends CoreBaseModel {
  /// 仕入れ記録
  final String? id;
  final DateTime purchaseDate; // 仕入れ日
  final String? notes; // 備考
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? userId;

  Purchase({
    this.id,
    required this.purchaseDate,
    this.notes,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  static String tableName() => 'purchases';

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'purchase_date': purchaseDate.toIso8601String(),
        'notes': notes,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user_id': userId,
      };

  factory Purchase.fromJson(Map<String, dynamic> json) {
    return Purchase(
      id: json['id'] as String?,
      purchaseDate: DateTime.parse(json['purchase_date'] as String),
      notes: json['notes'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
      userId: json['user_id'] as String?,
    );
  }
}

class PurchaseItem extends CoreBaseModel {
  /// 仕入れ明細
  final String? id;
  final String purchaseId; // 仕入れID
  final String materialId; // 材料ID
  final Decimal quantity; // 仕入れ量(パッケージ単位)
  final DateTime? createdAt;
  final String? userId;

  PurchaseItem({
    this.id,
    required this.purchaseId,
    required this.materialId,
    required this.quantity,
    this.createdAt,
    this.userId,
  });

  static String tableName() => 'purchase_items';

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'purchase_id': purchaseId,
        'material_id': materialId,
        'quantity': quantity.toString(),
        'created_at': createdAt?.toIso8601String(),
        'user_id': userId,
      };

  factory PurchaseItem.fromJson(Map<String, dynamic> json) {
    return PurchaseItem(
      id: json['id'] as String?,
      purchaseId: json['purchase_id'] as String,
      materialId: json['material_id'] as String,
      quantity: Decimal.parse(json['quantity'] as String),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      userId: json['user_id'] as String?,
    );
  }
}

class StockAdjustment extends CoreBaseModel {
  /// 在庫調整
  final String? id;
  final String materialId; // 材料ID
  final Decimal adjustmentAmount; // 調整量（正負両方）
  final String? notes; // メモ
  final DateTime adjustedAt; // 調整日時
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? userId;

  StockAdjustment({
    this.id,
    required this.materialId,
    required this.adjustmentAmount,
    this.notes,
    required this.adjustedAt,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  static String tableName() => 'stock_adjustments';

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'material_id': materialId,
        'adjustment_amount': adjustmentAmount.toString(),
        'notes': notes,
        'adjusted_at': adjustedAt.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user_id': userId,
      };

  factory StockAdjustment.fromJson(Map<String, dynamic> json) {
    return StockAdjustment(
      id: json['id'] as String?,
      materialId: json['material_id'] as String,
      adjustmentAmount: Decimal.parse(json['adjustment_amount'] as String),
      notes: json['notes'] as String?,
      adjustedAt: DateTime.parse(json['adjusted_at'] as String),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
      userId: json['user_id'] as String?,
    );
  }
}