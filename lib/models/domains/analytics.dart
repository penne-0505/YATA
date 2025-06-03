import 'package:yata/models/bases/base.dart';

class DailySummary extends CoreBaseModel {
  /// 日別集計
  final String? id;
  final DateTime summaryDate; // 集計日
  final int totalOrders; // 総注文数
  final int completedOrders; // 完了注文数
  final int pendingOrders; // 進行中注文数
  final int totalRevenue; // 総売上
  final int? averagePrepTimeMinutes; // 平均調理時間
  final String? mostPopularItemId; // 最人気商品ID
  final int mostPopularItemCount; // 最人気商品販売数
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? userId;

  DailySummary({
    this.id,
    required this.summaryDate,
    required this.totalOrders,
    required this.completedOrders,
    required this.pendingOrders,
    required this.totalRevenue,
    this.averagePrepTimeMinutes,
    this.mostPopularItemId,
    this.mostPopularItemCount = 0,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  static String tableName() => 'daily_summaries';

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'summary_date': summaryDate.toIso8601String(),
        'total_orders': totalOrders,
        'completed_orders': completedOrders,
        'pending_orders': pendingOrders,
        'total_revenue': totalRevenue,
        'average_prep_time_minutes': averagePrepTimeMinutes,
        'most_popular_item_id': mostPopularItemId,
        'most_popular_item_count': mostPopularItemCount,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user_id': userId,
      };

  factory DailySummary.fromJson(Map<String, dynamic> json) {
    return DailySummary(
      id: json['id'] as String?,
      summaryDate: DateTime.parse(json['summary_date'] as String),
      totalOrders: json['total_orders'] as int,
      completedOrders: json['completed_orders'] as int,
      pendingOrders: json['pending_orders'] as int,
      totalRevenue: json['total_revenue'] as int,
      averagePrepTimeMinutes: json['average_prep_time_minutes'] as int?,
      mostPopularItemId: json['most_popular_item_id'] as String?,
      mostPopularItemCount: json['most_popular_item_count'] as int? ?? 0,
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
