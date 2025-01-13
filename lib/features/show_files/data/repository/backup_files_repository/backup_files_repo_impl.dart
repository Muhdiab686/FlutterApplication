import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/features/show_files/data/models/backup_files_model/backup_files_model.dart';
import 'package:final_project/features/show_files/data/repository/backup_files_repository/backup_files_repo.dart';

class BackupFilesRepoImpl implements BackupFilesRepo {
  final ApiService _apiService;

  BackupFilesRepoImpl(this._apiService);

  @override
  Future<Either<Failure, List<BackupFilesModel>>> backupFiles({
    required String token,
    required int id,
  }) async {
    try {
      // استدعاء API
      var data = await _apiService.backupFiles(id: id, token: token);

      // تحويل قائمة JSON إلى قائمة من الكائنات
      List<BackupFilesModel> backupFilesList = (data as List)
          .map((item) => BackupFilesModel.fromJson(item))
          .toList();

      return right(backupFilesList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
