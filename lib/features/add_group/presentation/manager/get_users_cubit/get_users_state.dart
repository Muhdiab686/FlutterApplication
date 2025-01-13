part of 'get_users_cubit.dart';

sealed class GetUsersState extends Equatable {
  const GetUsersState();

  @override
  List<Object> get props => [];
}

final class GetUsersInitial extends GetUsersState {}

final class GetUsersFailure extends GetUsersState {
  final String errMessage;

  const GetUsersFailure(this.errMessage);
}

final class GetUsersSuccess extends GetUsersState {
  final GetUsersModel getUsersModel;

  const GetUsersSuccess(this.getUsersModel);
}

final class GetUsersLoading extends GetUsersState {}
