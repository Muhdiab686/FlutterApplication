import 'package:equatable/equatable.dart';

import 'user.dart';

class UserRegisterModel extends Equatable {
  final User? user;
  final String? token;
  final String? message;

  const UserRegisterModel({this.user, this.token, this.message});

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) {
    return UserRegisterModel(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['Token'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'Token': token,
        'message': message,
      };

  @override
  List<Object?> get props => [user, token, message];
}
