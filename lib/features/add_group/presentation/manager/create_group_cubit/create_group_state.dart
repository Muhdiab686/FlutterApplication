part of 'create_group_cubit.dart';

sealed class CreateGroupState extends Equatable {
  const CreateGroupState();

  @override
  List<Object> get props => [];
}

final class CreateGroupInitial extends CreateGroupState {}

final class CreateGroupFailure extends CreateGroupState {
  final String errMessage;

  const CreateGroupFailure(this.errMessage);
}

final class CreateGroupSuccess extends CreateGroupState {
  final String message;

  const CreateGroupSuccess(this.message);
}

final class CreateGroupLoading extends CreateGroupState {}
