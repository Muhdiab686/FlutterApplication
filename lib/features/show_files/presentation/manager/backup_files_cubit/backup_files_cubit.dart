import 'package:equatable/equatable.dart';
import 'package:final_project/features/show_files/data/models/backup_files_model/backup_files_model.dart';
import 'package:final_project/features/show_files/data/repository/backup_files_repository/backup_files_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'backup_files_state.dart';

class BackupFilesCubit extends Cubit<BackupFilesState> {
  final BackupFilesRepo backupFilesRepo;
  BackupFilesCubit(this.backupFilesRepo) : super(BackupFilesInitial());

  Future<void> backupFiles({required String token, required int id}) async {
    emit(BackupFilesLoading());
    var data = await backupFilesRepo.backupFiles(token: token, id: id);
    data.fold((l) {
      emit(BackupFilesFailure(l.eerMessage));
    }, (r) {
      emit(BackupFilesSuccess(r));
    });
  }
}
