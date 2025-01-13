part of 'get_files_cubit.dart';

sealed class GetFilesState extends Equatable {
  const GetFilesState();

  @override
  List<Object> get props => [];
}

final class GetFilesInitial extends GetFilesState {}

final class GetFilesFailure extends GetFilesState {
  final String errMessage;

  const GetFilesFailure(this.errMessage);
}

final class GetFilesSuccess extends GetFilesState {
  final GetFilesModel getFilesModel;

  const GetFilesSuccess(this.getFilesModel);
}

final class GetFilesLoading extends GetFilesState {}
