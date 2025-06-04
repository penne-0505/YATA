enum TransactionType {
  purchase('purchase'), // 仕入れ
  sale('sale'), // 販売
  adjustment('adjustment'), // 在庫調整
  waste('waste'); // 廃棄

  final String value;
  const TransactionType(this.value);

  static TransactionType fromString(String value) {
    return TransactionType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ArgumentError('Invalid TransactionType: $value'),
    );
  }
}

enum ReferenceType {
  order('order'), // 注文
  purchase('purchase'), // 仕入れ
  adjustment('adjustment'); // 在庫調整

  final String value;
  const ReferenceType(this.value);

  static ReferenceType fromString(String value) {
    return ReferenceType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ArgumentError('Invalid ReferenceType: $value'),
    );
  }
}

enum UnitType {
  piece('piece'), // 個数管理（厳密）
  gram('gram'); // グラム管理（目安）

  final String value;
  const UnitType(this.value);

  static UnitType fromString(String value) {
    return UnitType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ArgumentError('Invalid UnitType: $value'),
    );
  }
}

enum StockLevel {
  sufficient('sufficient'), // 在庫あり（緑）
  low('low'), // 在庫少（黄）
  critical('critical'); // 緊急（赤）

  final String value;
  const StockLevel(this.value);

  static StockLevel fromString(String value) {
    return StockLevel.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ArgumentError('Invalid StockLevel: $value'),
    );
  }
}