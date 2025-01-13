import 'package:equatable/equatable.dart';

class Datum extends Equatable {
	final int? id;
	final int? userId;
	final int? groupsId;
	final String? filePath;
	final String? fileName;
	final String? status;
	final DateTime? createdAt;
	final DateTime? updatedAt;

	const Datum({
		this.id, 
		this.userId, 
		this.groupsId, 
		this.filePath, 
		this.fileName, 
		this.status, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Datum.fromJson(Map<String, dynamic> json) => Datum(
				id: json['id'] as int?,
				userId: json['user_id'] as int?,
				groupsId: json['groups_id'] as int?,
				filePath: json['file_path'] as String?,
				fileName: json['file_name'] as String?,
				status: json['status'] as String?,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'user_id': userId,
				'groups_id': groupsId,
				'file_path': filePath,
				'file_name': fileName,
				'status': status,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				userId,
				groupsId,
				filePath,
				fileName,
				status,
				createdAt,
				updatedAt,
		];
	}
}
