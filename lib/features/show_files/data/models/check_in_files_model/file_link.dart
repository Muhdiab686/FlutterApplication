import 'package:equatable/equatable.dart';

class FileLink extends Equatable {
  final int? fileId;
  final String? downloadUrl;

  const FileLink({this.fileId, this.downloadUrl});

  factory FileLink.fromJson(Map<String, dynamic> json) => FileLink(
        fileId: json['file_id'] as int?,
        downloadUrl: json['download_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'file_id': fileId,
        'download_url': downloadUrl,
      };

  @override
  List<Object?> get props => [fileId, downloadUrl];
}
