import 'package:equatable/equatable.dart';

import 'user.dart';

class UserLoginModel extends Equatable {
  final User? user;
  final String? accessToken;
  final String? refreshToken;

  const UserLoginModel({this.user, this.accessToken, this.refreshToken});

  factory UserLoginModel.fromJson(Map<String, dynamic> json) {
    return UserLoginModel(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'access_token': accessToken,
        'refresh_token': refreshToken,
      };

  @override
  List<Object?> get props => [user, accessToken, refreshToken];
}
