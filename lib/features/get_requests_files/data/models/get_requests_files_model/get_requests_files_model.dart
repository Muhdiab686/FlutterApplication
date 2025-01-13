import 'package:equatable/equatable.dart';

import 'datum.dart';

class GetRequestsFilesModel extends Equatable {
	final List<Datum>? data;

	const GetRequestsFilesModel({this.data});

	factory GetRequestsFilesModel.fromJson(Map<String, dynamic> json) {
		return GetRequestsFilesModel(
			data: (json['data'] as List<dynamic>?)
						?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'data': data?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [data];
}
