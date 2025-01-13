part of 'get_users_in_group_cubit.dart';

sealed class GetUsersInGroupState extends Equatable {
  const GetUsersInGroupState();

  @override
  List<Object> get props => [];
}

final class GetUsersInGroupInitial extends GetUsersInGroupState {}

final class GetUsersInGroupFailure extends GetUsersInGroupState {
  final String errMessage;

  const GetUsersInGroupFailure(this.errMessage);
}

final class GetUsersInGroupSuccess extends GetUsersInGroupState {
  final GetUsersInGroupModel getUsersInGroupModel;

  const GetUsersInGroupSuccess(this.getUsersInGroupModel);
}

final class GetUsersInGroupLoading extends GetUsersInGroupState {}
