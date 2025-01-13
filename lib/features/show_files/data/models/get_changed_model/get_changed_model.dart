import 'package:equatable/equatable.dart';

import 'change.dart';

class GetChangedModel extends Equatable {
  final String? fileId;
  final List<Change>? changes;

  const GetChangedModel({this.fileId, this.changes});

  factory GetChangedModel.fromJson(Map<String, dynamic> json) {
    return GetChangedModel(
      fileId: json['file_id'] as String?,
      changes: (json['changes'] as List<dynamic>?)
          ?.map((e) => Change.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'file_id': fileId,
        'changes': changes?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [fileId, changes];
}
