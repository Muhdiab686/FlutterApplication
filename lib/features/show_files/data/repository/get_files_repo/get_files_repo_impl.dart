import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/features/show_files/data/models/get_files_model/get_files_model.dart';
import 'package:final_project/features/show_files/data/repository/get_files_repo/get_files_repo.dart';

class GetFilesRepoImpl implements GetFilesRepo {
  final ApiService apiService;

  GetFilesRepoImpl(this.apiService);

  @override
  Future<Either<Failure, GetFilesModel>> getFiles(
      {required String token, required int id}) async {
    try {
      var data = await apiService.getFiles(token: token, id: id);
      GetFilesModel getFilesModel = GetFilesModel.fromJson(data);
      return right(getFilesModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
