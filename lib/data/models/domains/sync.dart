import '../bases/base.dart';

class SyncRecord extends CoreBaseModel {
  final String? id;
  final String recordType; // 対象テーブル名
  final Map<String, dynamic> payload;
  final bool synced;
  final DateTime timestamp;
  final String? userId;
  final DateTime? completedAt;

  SyncRecord({
    this.id,
    required this.recordType,
    required this.payload,
    required this.synced,
    required this.timestamp,
    this.userId,
    this.completedAt,
  });

  static String tableName() {
    print('Warning: Offline SyncRecord not implemented—returns placeholder `table_name`.');
    return 'sync_records';
  }

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'record_type': recordType,
        'payload': payload,
        'synced': synced,
        'timestamp': timestamp.toIso8601String(),
        'user_id': userId,
        'completed_at': completedAt?.toIso8601String(),
      };

  factory SyncRecord.fromJson(Map<String, dynamic> json) {
    return SyncRecord(
      id: json['id'] as String?,
      recordType: json['record_type'] as String,
      payload: Map<String, dynamic>.from(json['payload'] as Map),
      synced: json['synced'] as bool,
      timestamp: DateTime.parse(json['timestamp'] as String),
      userId: json['user_id'] as String?,
      completedAt: json['completed_at'] != null
          ? DateTime.parse(json['completed_at'] as String)
          : null,
    );
  }
}