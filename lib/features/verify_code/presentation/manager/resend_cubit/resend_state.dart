part of 'resend_cubit.dart';

sealed class ResendState extends Equatable {
  const ResendState();

  @override
  List<Object> get props => [];
}

final class ResendInitial extends ResendState {}

final class ResendFailure extends ResendState {
  final String errMesssage;

  const ResendFailure(this.errMesssage);
}

final class ResendSuccess extends ResendState {
  final ResendModel resendModel;

  const ResendSuccess(this.resendModel);
}

final class ResendLoading extends ResendState {}
