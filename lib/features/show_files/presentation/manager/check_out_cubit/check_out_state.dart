part of 'check_out_cubit.dart';

sealed class CheckOutState extends Equatable {
  const CheckOutState();

  @override
  List<Object> get props => [];
}

final class CheckOutInitial extends CheckOutState {}

final class CheckOutFailure extends CheckOutState {
  final String errMessage;

  const CheckOutFailure(this.errMessage);
}

final class CheckOutLoading extends CheckOutState {}

final class CheckOutSuccess extends CheckOutState {
  final String message;

  const CheckOutSuccess(this.message);
}
