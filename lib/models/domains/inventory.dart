import 'package:decimal/decimal.dart';
import 'package:yata/utils/constants/option_enums.dart';
import 'package:yata/models/bases/base.dart';

class Material extends CoreBaseModel {
  /// 材料マスタ
  final String? id;
  final String name; // 材料名
  final String categoryId; // 材料カテゴリID
  final UnitType unitType; // 管理単位（個数 or グラム）
  final Decimal currentStock; // 現在在庫量
  final Decimal alertThreshold; // アラート閾値
  final Decimal criticalThreshold; // 緊急閾値
  final String? notes; // メモ
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? userId;

  Material({
    this.id,
    required this.name,
    required this.categoryId,
    required this.unitType,
    required this.currentStock,
    required this.alertThreshold,
    required this.criticalThreshold,
    this.notes,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  static String tableName() => 'materials';

  StockLevel getStockLevel() {
    /// 在庫レベルを取得
    if (currentStock <= criticalThreshold) {
      return StockLevel.critical;
    } else if (currentStock <= alertThreshold) {
      return StockLevel.low;
    } else {
      return StockLevel.sufficient;
    }
  }

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category_id': categoryId,
        'unit_type': unitType.value,
        'current_stock': currentStock.toString(),
        'alert_threshold': alertThreshold.toString(),
        'critical_threshold': criticalThreshold.toString(),
        'notes': notes,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user_id': userId,
      };

  factory Material.fromJson(Map<String, dynamic> json) {
    return Material(
      id: json['id'] as String?,
      name: json['name'] as String,
      categoryId: json['category_id'] as String,
      unitType: UnitType.fromString(json['unit_type'] as String),
      currentStock: Decimal.parse(json['current_stock'] as String),
      alertThreshold: Decimal.parse(json['alert_threshold'] as String),
      criticalThreshold: Decimal.parse(json['critical_threshold'] as String),
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

class MaterialCategory extends CoreBaseModel {
  /// 材料カテゴリ
  final String? id;
  final String name; // カテゴリ名（肉類、野菜、調理済食品、果物）
  final int displayOrder; // 表示順序
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? userId;

  MaterialCategory({
    this.id,
    required this.name,
    this.displayOrder = 0,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  static String tableName() => 'material_categories';

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'display_order': displayOrder,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user_id': userId,
      };

  factory MaterialCategory.fromJson(Map<String, dynamic> json) {
    return MaterialCategory(
      id: json['id'] as String?,
      name: json['name'] as String,
      displayOrder: json['display_order'] as int? ?? 0,
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

class Recipe extends CoreBaseModel {
  /// レシピ（メニューと材料の関係）
  final String? id;
  final String menuItemId; // メニューID
  final String materialId; // 材料ID
  final Decimal requiredAmount; // 必要量（材料の単位に依存）
  final bool isOptional; // オプション材料かどうか
  final String? notes; // 備考
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? userId;

  Recipe({
    this.id,
    required this.menuItemId,
    required this.materialId,
    required this.requiredAmount,
    this.isOptional = false,
    this.notes,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  static String tableName() => 'recipes';

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'menu_item_id': menuItemId,
        'material_id': materialId,
        'required_amount': requiredAmount.toString(),
        'is_optional': isOptional,
        'notes': notes,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user_id': userId,
      };

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] as String?,
      menuItemId: json['menu_item_id'] as String,
      materialId: json['material_id'] as String,
      requiredAmount: Decimal.parse(json['required_amount'] as String),
      isOptional: json['is_optional'] as bool? ?? false,
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
