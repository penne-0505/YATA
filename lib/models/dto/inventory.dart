import 'package:decimal/decimal.dart';
import 'package:yata/core/constants/enums/stock_enums.dart';
import 'package:yata/models/bases/base.dart';
import 'package:yata/models/domains/inventory.dart';

class MaterialStockInfo extends CoreBaseModel {
  /// 材料在庫情報（在庫レベル付き）
  final Material material;
  final StockLevel stockLevel;
  final int? estimatedUsageDays;
  final Decimal? dailyUsageRate;

  MaterialStockInfo({
    required this.material,
    required this.stockLevel,
    this.estimatedUsageDays,
    this.dailyUsageRate,
  });

  static String? tableName() => null;

  @override
  Map<String, dynamic> toJson() => {
        'material': material.toJson(),
        'stock_level': stockLevel.value,
        'estimated_usage_days': estimatedUsageDays,
        'daily_usage_rate': dailyUsageRate?.toString(),
      };

  factory MaterialStockInfo.fromJson(Map<String, dynamic> json) {
    return MaterialStockInfo(
      material: Material.fromJson(json['material'] as Map<String, dynamic>),
      stockLevel: StockLevel.fromString(json['stock_level'] as String),
      estimatedUsageDays: json['estimated_usage_days'] as int?,
      dailyUsageRate: json['daily_usage_rate'] != null
          ? Decimal.parse(json['daily_usage_rate'] as String)
          : null,
    );
  }
}

class MaterialUsageCalculation extends CoreBaseModel {
  /// 材料使用量計算結果
  final String materialId;
  final Decimal requiredAmount;
  final Decimal availableAmount;
  final bool isSufficient;

  MaterialUsageCalculation({
    required this.materialId,
    required this.requiredAmount,
    required this.availableAmount,
    required this.isSufficient,
  });

  static String? tableName() => null;

  @override
  Map<String, dynamic> toJson() => {
        'material_id': materialId,
        'required_amount': requiredAmount.toString(),
        'available_amount': availableAmount.toString(),
        'is_sufficient': isSufficient,
      };

  factory MaterialUsageCalculation.fromJson(Map<String, dynamic> json) {
    return MaterialUsageCalculation(
      materialId: json['material_id'] as String,
      requiredAmount: Decimal.parse(json['required_amount'] as String),
      availableAmount: Decimal.parse(json['available_amount'] as String),
      isSufficient: json['is_sufficient'] as bool,
    );
  }
}