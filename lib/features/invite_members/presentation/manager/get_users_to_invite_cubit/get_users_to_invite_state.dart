part of 'get_users_to_invite_cubit.dart';

sealed class GetUsersToInviteState extends Equatable {
  const GetUsersToInviteState();

  @override
  List<Object> get props => [];
}

final class GetUsersToInviteInitial extends GetUsersToInviteState {}

final class GetUsersToInviteLoading extends GetUsersToInviteState {}

final class GetUsersToInviteFailure extends GetUsersToInviteState {
  final String errMessage;

  const GetUsersToInviteFailure(this.errMessage);
}

final class GetUsersToInviteSuccess extends GetUsersToInviteState {
  final GetUsersToInviteModel getUsersToInviteModel;

  const GetUsersToInviteSuccess(this.getUsersToInviteModel);
}
