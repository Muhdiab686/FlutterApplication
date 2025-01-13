part of 'backup_files_cubit.dart';

sealed class BackupFilesState extends Equatable {
  const BackupFilesState();

  @override
  List<Object> get props => [];
}

final class BackupFilesInitial extends BackupFilesState {}

final class BackupFilesLoading extends BackupFilesState {}

final class BackupFilesFailure extends BackupFilesState {
  final String errMessage;

  const BackupFilesFailure(this.errMessage);
}

final class BackupFilesSuccess extends BackupFilesState {
  final List<BackupFilesModel> backupFilesModel;

  const BackupFilesSuccess(this.backupFilesModel);
}
