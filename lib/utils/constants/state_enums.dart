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