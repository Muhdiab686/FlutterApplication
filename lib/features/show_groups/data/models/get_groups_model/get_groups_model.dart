import 'package:equatable/equatable.dart';

import 'datum.dart';

class GetGroupsModel extends Equatable {
  final List<Datum>? data;
  final String? message;

  const GetGroupsModel({this.data, this.message});

  factory GetGroupsModel.fromJson(Map<String, dynamic> json) {
    return GetGroupsModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'message': message,
      };

  @override
  List<Object?> get props => [data, message];
}
