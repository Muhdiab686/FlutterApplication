part of 'approve_requests_files_cubit.dart';

sealed class ApproveRequestsFilesState extends Equatable {
  const ApproveRequestsFilesState();

  @override
  List<Object> get props => [];
}

final class ApproveRequestsFilesInitial extends ApproveRequestsFilesState {}

final class ApproveRequestsFilesFailure extends ApproveRequestsFilesState {
  final String errMessage;

  const ApproveRequestsFilesFailure(this.errMessage);
}

final class ApproveRequestsFilesSuccess extends ApproveRequestsFilesState {
  final String message;

  const ApproveRequestsFilesSuccess(this.message);
}

final class ApproveRequestsFilesLoading extends ApproveRequestsFilesState {}
