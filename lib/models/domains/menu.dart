import 'package:yata/models/bases/base.dart';


class MenuCategory extends CoreBaseModel {
  /// メニューカテゴリ
  final String? id;
  final String name; // カテゴリ名（メイン料理、サイドメニュー、ドリンク、デザート）
  final int displayOrder; // 表示順序
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? userId;

  MenuCategory({
    this.id,
    required this.name,
    this.displayOrder = 0,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  static String tableName() => 'menu_categories';

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'display_order': displayOrder,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user_id': userId,
      };

  factory MenuCategory.fromJson(Map<String, dynamic> json) {
    return MenuCategory(
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

class MenuItem extends CoreBaseModel {
  /// メニュー（販売商品）
  final String? id;
  final String name; // 商品名
  final String categoryId; // メニューカテゴリID
  final int price; // 販売価格（円）
  final String? description; // 商品説明
  final bool isAvailable; // 販売可能フラグ
  final int estimatedPrepTimeMinutes; // 推定調理時間（分）
  final int displayOrder; // 表示順序
  final String? imageUrl; // 商品画像URL
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? userId;

  MenuItem({
    this.id,
    required this.name,
    required this.categoryId,
    required this.price,
    this.description,
    this.isAvailable = true,
    this.estimatedPrepTimeMinutes = 5,
    this.displayOrder = 0,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  static String tableName() => 'menu_items';

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category_id': categoryId,
        'price': price,
        'description': description,
        'is_available': isAvailable,
        'estimated_prep_time_minutes': estimatedPrepTimeMinutes,
        'display_order': displayOrder,
        'image_url': imageUrl,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user_id': userId,
      };

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'] as String?,
      name: json['name'] as String,
      categoryId: json['category_id'] as String,
      price: json['price'] as int,
      description: json['description'] as String?,
      isAvailable: json['is_available'] as bool? ?? true,
      estimatedPrepTimeMinutes: json['estimated_prep_time_minutes'] as int? ?? 5,
      displayOrder: json['display_order'] as int? ?? 0,
      imageUrl: json['image_url'] as String?,
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

class MenuItemOption extends CoreBaseModel {
  /// メニューオプション（トッピングなど）
  final String? id;
  final String menuItemId; // メニューID
  final String optionName; // オプション名（例：「ソース」）
  final List<String> optionValues; // 選択肢（例：["あり", "なし"]）
  final bool isRequired; // 必須選択かどうか
  final int additionalPrice; // 追加料金
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? userId;

  MenuItemOption({
    this.id,
    required this.menuItemId,
    required this.optionName,
    required this.optionValues,
    this.isRequired = false,
    this.additionalPrice = 0,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  static String tableName() => 'menu_item_options';

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'menu_item_id': menuItemId,
        'option_name': optionName,
        'option_values': optionValues,
        'is_required': isRequired,
        'additional_price': additionalPrice,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user_id': userId,
      };

  factory MenuItemOption.fromJson(Map<String, dynamic> json) {
    return MenuItemOption(
      id: json['id'] as String?,
      menuItemId: json['menu_item_id'] as String,
      optionName: json['option_name'] as String,
      optionValues: List<String>.from(json['option_values'] as List),
      isRequired: json['is_required'] as bool? ?? false,
      additionalPrice: json['additional_price'] as int? ?? 0,
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
