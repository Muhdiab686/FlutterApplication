import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/features/get_requests_files/data/respository/approve_request_file_repository/approve_request_file_repo.dart';

class ApproveRequestRepoFileImpl implements ApproveRequestFileRepo {
  final ApiService apiService;

  ApproveRequestRepoFileImpl(this.apiService);

  @override
  Future<Either<Failure, String>> approve(
      {required String token, required int id}) async {
    try {
      var data = await apiService.approve(token: token, id: id);
      String message = data['message'];
      return right(message);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
