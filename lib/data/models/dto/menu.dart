import 'package:yata/data/models/bases/base.dart';

class MenuAvailabilityInfo extends CoreBaseModel {
  /// メニュー在庫可否情報
  final String menuItemId;
  final bool isAvailable;
  final List<String> missingMaterials; // 不足材料名のリスト
  final int? estimatedServings; // 作れる数量

  MenuAvailabilityInfo({
    required this.menuItemId,
    required this.isAvailable,
    List<String>? missingMaterials,
    this.estimatedServings,
  }) : missingMaterials = missingMaterials ?? [];

  static String? tableName() => null;

  @override
  Map<String, dynamic> toJson() => {
        'menu_item_id': menuItemId,
        'is_available': isAvailable,
        'missing_materials': missingMaterials,
        'estimated_servings': estimatedServings,
      };

  factory MenuAvailabilityInfo.fromJson(Map<String, dynamic> json) {
    return MenuAvailabilityInfo(
      menuItemId: json['menu_item_id'] as String,
      isAvailable: json['is_available'] as bool,
      missingMaterials: json['missing_materials'] != null
          ? List<String>.from(json['missing_materials'] as List)
          : [],
      estimatedServings: json['estimated_servings'] as int?,
    );
  }
}