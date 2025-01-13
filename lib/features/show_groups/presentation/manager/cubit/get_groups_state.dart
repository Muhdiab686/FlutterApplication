part of 'get_groups_cubit.dart';

sealed class GetGroupsState extends Equatable {
  const GetGroupsState();

  @override
  List<Object> get props => [];
}

final class GetGroupsInitial extends GetGroupsState {}

final class GetGroupsFailure extends GetGroupsState {
  final String errMessage;

  const GetGroupsFailure(this.errMessage);
}

final class GetGroupsSuccess extends GetGroupsState {
  final GetGroupsModel getGroupsModel;

  const GetGroupsSuccess(this.getGroupsModel);
}

final class GetGroupsLoading extends GetGroupsState {}
