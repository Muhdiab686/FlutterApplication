import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/features/get_requests_files/data/respository/get_requests_files_repository/get_requests_files_repo.dart';
import 'package:final_project/features/get_requests_files/data/models/get_requests_files_model/get_requests_files_model.dart';

class GetRequestsFilesRepoImpl implements GetRequestsFilesRepo {
  final ApiService apiService;

  GetRequestsFilesRepoImpl(this.apiService);
  @override
  Future<Either<Failure, GetRequestsFilesModel>> getRequestsFiles(
      {required int id, required String token}) async {
    try {
      var data = await apiService.getRequestsFiles(token: token, id: id);
      GetRequestsFilesModel getRequestsFilesModel =
          GetRequestsFilesModel.fromJson(data);
      return right(getRequestsFilesModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
