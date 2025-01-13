import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/features/verify_code/data/model/verify_model.dart';
import 'package:final_project/features/verify_code/data/repository/verify_repository/verify_repo.dart';

class VerifyRepoImpl implements VerifyRepo {
  final ApiService apiService;

  VerifyRepoImpl(this.apiService);
  @override
  Future<Either<Failure, VerifyModel>> verify(
      {required String token, required String code}) async {
    try {
      var data = await apiService.verify(code: code, token: token);
      VerifyModel verifyModel = VerifyModel.fromJson(data);
      return right(verifyModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
