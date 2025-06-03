abstract class CoreBaseModel {
  static String tableName() {
    throw UnimplementedError('Subclasses must implement tableName()');
  }

  Map<String, dynamic> toJson();
}