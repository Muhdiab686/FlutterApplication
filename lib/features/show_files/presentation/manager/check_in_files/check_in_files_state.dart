part of 'check_in_files_cubit.dart';

sealed class CheckInFilesState extends Equatable {
  const CheckInFilesState();

  @override
  List<Object> get props => [];
}

final class CheckInFilesInitial extends CheckInFilesState {}

final class CheckInFilesSuccess extends CheckInFilesState {
  final CheckInFilesModel checkInFilesModel;

  const CheckInFilesSuccess(this.checkInFilesModel);
}

final class CheckInFilesFailure extends CheckInFilesState {
  final String errMessage;

  const CheckInFilesFailure(this.errMessage);
}

final class CheckInFilesLoading extends CheckInFilesState {}
