import 'package:equatable/equatable.dart';

class VerifyModel extends Equatable {
  final String? message;

  const VerifyModel({this.message});

  factory VerifyModel.fromJson(Map<String, dynamic> json) => VerifyModel(
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
      };

  @override
  List<Object?> get props => [message];
}
