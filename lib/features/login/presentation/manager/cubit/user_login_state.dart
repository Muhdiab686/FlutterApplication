part of 'user_login_cubit.dart';

sealed class UserLoginState extends Equatable {
  const UserLoginState();

  @override
  List<Object> get props => [];
}

final class UserLoginInitial extends UserLoginState {}

final class UserLoginFailure extends UserLoginState {
  final String errMessage;

  const UserLoginFailure(this.errMessage);
}

final class UserLoginSuccess extends UserLoginState {
  final UserLoginModel userLoginModel;

  const UserLoginSuccess(this.userLoginModel);
}

final class UserLoginLoading extends UserLoginState {}
