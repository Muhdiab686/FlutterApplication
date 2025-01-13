import 'package:equatable/equatable.dart';

import 'user.dart';

class ResendModel extends Equatable {
  final User? user;
  final String? message;

  const ResendModel({this.user, this.message});

  factory ResendModel.fromJson(Map<String, dynamic> json) => ResendModel(
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'message': message,
      };

  @override
  List<Object?> get props => [user, message];
}
