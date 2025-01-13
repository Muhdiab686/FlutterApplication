part of 'check_out_without_file_cubit.dart';

sealed class CheckOutWithoutFileState extends Equatable {
  const CheckOutWithoutFileState();

  @override
  List<Object> get props => [];
}

final class CheckOutWithoutFileInitial extends CheckOutWithoutFileState {}

final class CheckOutWithoutFileFailure extends CheckOutWithoutFileState {
  final String errMessage;

  const CheckOutWithoutFileFailure(this.errMessage);
}

final class CheckOutWithoutFileSuccess extends CheckOutWithoutFileState {
  final String message;

  const CheckOutWithoutFileSuccess(this.message);
}

final class CheckOutWithoutFileLoading extends CheckOutWithoutFileState {}
