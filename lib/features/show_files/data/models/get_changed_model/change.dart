import 'package:equatable/equatable.dart';

class Change extends Equatable {
  final int? id;
  final String? changes;
  final int? fileId;
  final int? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Change({
    this.id,
    this.changes,
    this.fileId,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory Change.fromJson(Map<String, dynamic> json) => Change(
        id: json['id'] as int?,
        changes: json['changes'] as String?,
        fileId: json['file_id'] as int?,
        userId: json['user_id'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'changes': changes,
        'file_id': fileId,
        'user_id': userId,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      changes,
      fileId,
      userId,
      createdAt,
      updatedAt,
    ];
  }
}
