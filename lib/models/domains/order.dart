import 'package:yata/models/bases/base.dart';
import 'package:yata/core/constants/enums/order_enums.dart';

class Order extends CoreBaseModel {
  /// 注文
  final String? id;
  final int totalAmount; // 合計金額
  final OrderStatus status; // 注文ステータス
  final PaymentMethod paymentMethod; // 支払い方法
  final int discountAmount; // 割引額
  final String? customerName; // 顧客名（呼び出し用）
  final String? notes; // 備考
  final DateTime orderedAt; // 注文日時
  final DateTime? startedPreparingAt; // 調理開始日時
  final DateTime? readyAt; // 完成日時
  final DateTime? completedAt; // 提供完了日時
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? userId;

  Order({
    this.id,
    required this.totalAmount,
    required this.status,
    required this.paymentMethod,
    this.discountAmount = 0,
    this.customerName,
    this.notes,
    required this.orderedAt,
    this.startedPreparingAt,
    this.readyAt,
    this.completedAt,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  static String tableName() => 'orders';

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'total_amount': totalAmount,
        'status': status.value,
        'payment_method': paymentMethod.value,
        'discount_amount': discountAmount,
        'customer_name': customerName,
        'notes': notes,
        'ordered_at': orderedAt.toIso8601String(),
        'started_preparing_at': startedPreparingAt?.toIso8601String(),
        'ready_at': readyAt?.toIso8601String(),
        'completed_at': completedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user_id': userId,
      };

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as String?,
      totalAmount: json['total_amount'] as int,
      status: OrderStatus.fromString(json['status'] as String),
      paymentMethod: PaymentMethod.fromString(json['payment_method'] as String),
      discountAmount: json['discount_amount'] as int? ?? 0,
      customerName: json['customer_name'] as String?,
      notes: json['notes'] as String?,
      orderedAt: DateTime.parse(json['ordered_at'] as String),
      startedPreparingAt: json['started_preparing_at'] != null
          ? DateTime.parse(json['started_preparing_at'] as String)
          : null,
      readyAt: json['ready_at'] != null
          ? DateTime.parse(json['ready_at'] as String)
          : null,
      completedAt: json['completed_at'] != null
          ? DateTime.parse(json['completed_at'] as String)
          : null,
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

class OrderItem extends CoreBaseModel {
  /// 注文明細
  final String? id;
  final String orderId; // 注文ID
  final String menuItemId; // メニューID
  final int quantity; // 数量
  final int unitPrice; // 単価（注文時点の価格）
  final int subtotal; // 小計
  final Map<String, String>? selectedOptions; // 選択されたオプション
  final String? specialRequest; // 特別リクエスト(例: アレルギー対応)
  final DateTime? createdAt;
  final String? userId;

  OrderItem({
    this.id,
    required this.orderId,
    required this.menuItemId,
    required this.quantity,
    required this.unitPrice,
    required this.subtotal,
    this.selectedOptions,
    this.specialRequest,
    this.createdAt,
    this.userId,
  });

  static String tableName() => 'order_items';

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'order_id': orderId,
        'menu_item_id': menuItemId,
        'quantity': quantity,
        'unit_price': unitPrice,
        'subtotal': subtotal,
        'selected_options': selectedOptions,
        'special_request': specialRequest,
        'created_at': createdAt?.toIso8601String(),
        'user_id': userId,
      };

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'] as String?,
      orderId: json['order_id'] as String,
      menuItemId: json['menu_item_id'] as String,
      quantity: json['quantity'] as int,
      unitPrice: json['unit_price'] as int,
      subtotal: json['subtotal'] as int,
      selectedOptions: json['selected_options'] != null
          ? Map<String, String>.from(json['selected_options'] as Map)
          : null,
      specialRequest: json['special_request'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      userId: json['user_id'] as String?,
    );
  }
}