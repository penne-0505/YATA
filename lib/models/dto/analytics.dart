import 'package:yata/models/bases/base.dart';

class DailyStatsResult extends CoreBaseModel {
  /// 日次統計結果
  final int completedOrders;
  final int pendingOrders;
  final int totalRevenue;
  final int? averagePrepTimeMinutes;
  final Map<String, dynamic>? mostPopularItem;

  DailyStatsResult({
    required this.completedOrders,
    required this.pendingOrders,
    required this.totalRevenue,
    this.averagePrepTimeMinutes,
    this.mostPopularItem,
  });

  static String? tableName() => null;

  @override
  Map<String, dynamic> toJson() => {
        'completed_orders': completedOrders,
        'pending_orders': pendingOrders,
        'total_revenue': totalRevenue,
        'average_prep_time_minutes': averagePrepTimeMinutes,
        'most_popular_item': mostPopularItem,
      };

  factory DailyStatsResult.fromJson(Map<String, dynamic> json) {
    return DailyStatsResult(
      completedOrders: json['completed_orders'] as int,
      pendingOrders: json['pending_orders'] as int,
      totalRevenue: json['total_revenue'] as int,
      averagePrepTimeMinutes: json['average_prep_time_minutes'] as int?,
      mostPopularItem: json['most_popular_item'] != null
          ? Map<String, dynamic>.from(json['most_popular_item'] as Map)
          : null,
    );
  }
}