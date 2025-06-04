enum PaymentMethod {
  cash('cash'),
  card('card'),
  other('other');

  final String value;
  const PaymentMethod(this.value);

  static PaymentMethod fromString(String value) {
    return PaymentMethod.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ArgumentError('Invalid PaymentMethod: $value'),
    );
  }
}

enum OrderStatus {
  preparing('preparing'),
  completed('completed'),
  canceled('canceled');

  final String value;
  const OrderStatus(this.value);

  static OrderStatus fromString(String value) {
    return OrderStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ArgumentError('Invalid OrderStatus: $value'),
    );
  }
}