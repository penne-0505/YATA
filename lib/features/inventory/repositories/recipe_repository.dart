import "../../../core/base/base_repository.dart";
import "../../../core/constants/query_types.dart";
import "../models/inventory_model.dart";

/// レシピリポジトリ
class RecipeRepository extends BaseRepository<Recipe, String> {
  /// コンストラクタ
  RecipeRepository() : super(tableName: "recipes");

  @override
  Recipe Function(Map<String, dynamic> json) get fromJson => Recipe.fromJson;

  /// メニューアイテムIDでレシピ一覧を取得
  Future<List<Recipe>> findByMenuItemId(String menuItemId, String userId) async {
    final List<QueryFilter> filters = <QueryFilter>[
      QueryConditionBuilder.eq("menu_item_id", menuItemId),
      QueryConditionBuilder.eq("user_id", userId),
    ];

    return find(filters: filters);
  }

  /// 材料IDを使用するレシピ一覧を取得
  Future<List<Recipe>> findByMaterialId(String materialId, String userId) async {
    final List<QueryFilter> filters = <QueryFilter>[
      QueryConditionBuilder.eq("material_id", materialId),
      QueryConditionBuilder.eq("user_id", userId),
    ];

    return find(filters: filters);
  }

  /// 複数メニューアイテムのレシピを一括取得
  Future<List<Recipe>> findByMenuItemIds(List<String> menuItemIds, String userId) async {
    if (menuItemIds.isEmpty) {
      return <Recipe>[];
    }

    final List<QueryFilter> filters = <QueryFilter>[
      QueryConditionBuilder.inList("menu_item_id", menuItemIds),
      QueryConditionBuilder.eq("user_id", userId),
    ];

    return find(filters: filters);
  }
}
