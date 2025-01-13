import 'package:equatable/equatable.dart';

class BackupFilesModel extends Equatable {
	final int? fileId;
	final int? backupId;
	final String? path;
	final String? downloadLink;
	final String? createdAt;

	const BackupFilesModel({
		this.fileId, 
		this.backupId, 
		this.path, 
		this.downloadLink, 
		this.createdAt, 
	});

	factory BackupFilesModel.fromJson(Map<String, dynamic> json) {
		return BackupFilesModel(
			fileId: json['file_id'] as int?,
			backupId: json['backup_id'] as int?,
			path: json['path'] as String?,
			downloadLink: json['download_link'] as String?,
			createdAt: json['created_at'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'file_id': fileId,
				'backup_id': backupId,
				'path': path,
				'download_link': downloadLink,
				'created_at': createdAt,
			};

	@override
	List<Object?> get props {
		return [
				fileId,
				backupId,
				path,
				downloadLink,
				createdAt,
		];
	}
}
