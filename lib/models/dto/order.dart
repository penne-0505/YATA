import 'package:yata/models/bases/base.dart';
import 'package:yata/utils/constants/option_enums.dart';
import 'package:yata/utils/constants/state_enums.dart';


class CartItemRequest extends CoreBaseModel {
  /// カートアイテム追加/更新リクエスト
  final String menuItemId;
  final int quantity;
  final Map<String, String>? selectedOptions;
  final String? specialRequest;

  CartItemRequest({
    required this.menuItemId,
    required this.quantity,
    this.selectedOptions,
    this.specialRequest,
  });

  static String? tableName() => null;

  @override
  Map<String, dynamic> toJson() => {
        'menu_item_id': menuItemId,
        'quantity': quantity,
        'selected_options': selectedOptions,
        'special_request': specialRequest,
      };

  factory CartItemRequest.fromJson(Map<String, dynamic> json) {
    return CartItemRequest(
      menuItemId: json['menu_item_id'] as String,
      quantity: json['quantity'] as int,
      selectedOptions: json['selected_options'] != null
          ? Map<String, String>.from(json['selected_options'] as Map)
          : null,
      specialRequest: json['special_request'] as String?,
    );
  }
}

class OrderCheckoutRequest extends CoreBaseModel {
  /// 注文確定リクエスト
  final PaymentMethod paymentMethod;
  final String? customerName;
  final int discountAmount;
  final String? notes;

  OrderCheckoutRequest({
    required this.paymentMethod,
    this.customerName,
    this.discountAmount = 0,
    this.notes,
  });

  static String? tableName() => null;

  @override
  Map<String, dynamic> toJson() => {
        'payment_method': paymentMethod.value,
        'customer_name': customerName,
        'discount_amount': discountAmount,
        'notes': notes,
      };

  factory OrderCheckoutRequest.fromJson(Map<String, dynamic> json) {
    return OrderCheckoutRequest(
      paymentMethod: PaymentMethod.fromString(json['payment_method'] as String),
      customerName: json['customer_name'] as String?,
      discountAmount: json['discount_amount'] as int? ?? 0,
      notes: json['notes'] as String?,
    );
  }
}

class OrderSearchRequest extends CoreBaseModel {
  /// 注文検索リクエスト
  final DateTime? dateFrom;
  final DateTime? dateTo;
  final List<OrderStatus>? statusFilter;
  final String? customerName;
  final String? menuItemName;
  final int page;
  final int limit;

  OrderSearchRequest({
    this.dateFrom,
    this.dateTo,
    this.statusFilter,
    this.customerName,
    this.menuItemName,
    this.page = 1,
    this.limit = 20,
  });

  static String? tableName() => null;

  @override
  Map<String, dynamic> toJson() => {
        'date_from': dateFrom?.toIso8601String(),
        'date_to': dateTo?.toIso8601String(),
        'status_filter': statusFilter?.map((s) => s.value).toList(),
        'customer_name': customerName,
        'menu_item_name': menuItemName,
        'page': page,
        'limit': limit,
      };

  factory OrderSearchRequest.fromJson(Map<String, dynamic> json) {
    return OrderSearchRequest(
      dateFrom: json['date_from'] != null
          ? DateTime.parse(json['date_from'] as String)
          : null,
      dateTo: json['date_to'] != null
          ? DateTime.parse(json['date_to'] as String)
          : null,
      statusFilter: json['status_filter'] != null
          ? (json['status_filter'] as List)
              .map((s) => OrderStatus.fromString(s as String))
              .toList()
          : null,
      customerName: json['customer_name'] as String?,
      menuItemName: json['menu_item_name'] as String?,
      page: json['page'] as int? ?? 1,
      limit: json['limit'] as int? ?? 20,
    );
  }
}

class OrderCalculationResult extends CoreBaseModel {
  /// 注文金額計算結果
  final int subtotal;
  final int taxAmount;
  final int discountAmount;
  final int totalAmount;

  OrderCalculationResult({
    required this.subtotal,
    required this.taxAmount,
    required this.discountAmount,
    required this.totalAmount,
  });

  static String? tableName() => null;

  @override
  Map<String, dynamic> toJson() => {
        'subtotal': subtotal,
        'tax_amount': taxAmount,
        'discount_amount': discountAmount,
        'total_amount': totalAmount,
      };

  factory OrderCalculationResult.fromJson(Map<String, dynamic> json) {
    return OrderCalculationResult(
      subtotal: json['subtotal'] as int,
      taxAmount: json['tax_amount'] as int,
      discountAmount: json['discount_amount'] as int,
      totalAmount: json['total_amount'] as int,
    );
  }
}
