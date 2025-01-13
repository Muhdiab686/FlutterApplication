part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterFailure extends RegisterState {
  final String errMessage;

  const RegisterFailure(this.errMessage);
}

final class RegisterSuccess extends RegisterState {
  final UserRegisterModel registerModel;

  const RegisterSuccess(this.registerModel);
}

final class RegisterLoading extends RegisterState {}
