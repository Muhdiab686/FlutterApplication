part of 'invite_members_cubit.dart';

sealed class InviteMembersState extends Equatable {
  const InviteMembersState();

  @override
  List<Object> get props => [];
}

final class InviteMembersInitial extends InviteMembersState {}

final class InviteMembersLoading extends InviteMembersState {}

final class InviteMembersFailure extends InviteMembersState {
  final String errMessage;

  const InviteMembersFailure(this.errMessage);
}

final class InviteMembersSuccess extends InviteMembersState {
  final String message;

  const InviteMembersSuccess(this.message);
}
