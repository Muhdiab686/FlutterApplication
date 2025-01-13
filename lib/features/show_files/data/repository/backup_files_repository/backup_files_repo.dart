import 'package:dartz/dartz.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/features/show_files/data/models/backup_files_model/backup_files_model.dart';

abstract class BackupFilesRepo {
  Future<Either<Failure, List<BackupFilesModel>>> backupFiles({
    required String token,
    required int id,
  });
}
