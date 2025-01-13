part of 'get_request_files_cubit.dart';

sealed class GetRequestFilesState extends Equatable {
  const GetRequestFilesState();

  @override
  List<Object> get props => [];
}

final class GetRequestFilesInitial extends GetRequestFilesState {}

final class GetRequestFilesFailure extends GetRequestFilesState {
  final String errMessage;

  const GetRequestFilesFailure(this.errMessage);
}

final class GetRequestFilesLoading extends GetRequestFilesState {}

final class GetRequestFilesSuccess extends GetRequestFilesState {
  final GetRequestsFilesModel getRequestsFilesModel;

  const GetRequestFilesSuccess(this.getRequestsFilesModel);
}
