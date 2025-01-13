import 'package:equatable/equatable.dart';

import 'datum.dart';

class GetFilesModel extends Equatable {
  final List<Datum>? data;

  const GetFilesModel({this.data});

  factory GetFilesModel.fromJson(Map<String, dynamic> json) => GetFilesModel(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [data];
}
