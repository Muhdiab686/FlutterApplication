import 'package:equatable/equatable.dart';

import 'file_link.dart';

class CheckInFilesModel extends Equatable {
  final String? message;
  final List<FileLink>? fileLinks;

  const CheckInFilesModel({this.message, this.fileLinks});

  factory CheckInFilesModel.fromJson(Map<String, dynamic> json) {
    return CheckInFilesModel(
      message: json['message'] as String?,
      fileLinks: (json['file_links'] as List<dynamic>?)
          ?.map((e) => FileLink.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'file_links': fileLinks?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [message, fileLinks];
}
