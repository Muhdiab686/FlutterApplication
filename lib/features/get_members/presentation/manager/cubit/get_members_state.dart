part of 'get_members_cubit.dart';

sealed class GetMembersState extends Equatable {
  const GetMembersState();

  @override
  List<Object> get props => [];
}

final class GetMembersInitial extends GetMembersState {}

final class GetMembersLoading extends GetMembersState {}

final class GetMembersFailure extends GetMembersState {
  final String errMessage;

  const GetMembersFailure(this.errMessage);
}

final class GetMembersSuccess extends GetMembersState {
  final GetMembersModel getMembersModel;

  const GetMembersSuccess(this.getMembersModel);
}
