part of 'verify_cubit.dart';

sealed class VerifyState extends Equatable {
  const VerifyState();

  @override
  List<Object> get props => [];
}

final class VerifyInitial extends VerifyState {}

final class VerifyFailure extends VerifyState {
  final String errMessage;

  const VerifyFailure(this.errMessage);
}

final class VerifySuccess extends VerifyState {
  final VerifyModel verifyModel;

  const VerifySuccess(this.verifyModel);
}

final class VerifyLoading extends VerifyState {}
