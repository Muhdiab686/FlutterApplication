part of 'get_changed_cubit.dart';

sealed class GetChangedState extends Equatable {
  const GetChangedState();

  @override
  List<Object> get props => [];
}

final class GetChangedInitial extends GetChangedState {}

final class GetChangedFailure extends GetChangedState {
  final String errMessage;

  const GetChangedFailure(this.errMessage);
}

final class GetChangedSuccess extends GetChangedState {
  final GetChangedModel getChangedModel;

  const GetChangedSuccess(this.getChangedModel);
}

final class GetChangedLoading extends GetChangedState {}
