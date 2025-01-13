import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/features/verify_code/data/model/resend_model/resend_model.dart';
import 'package:final_project/features/verify_code/data/repository/resend_repository/resend_repo.dart';

class ResendRepoImpl implements ResendRepo {
  final ApiService apiService;

  ResendRepoImpl(this.apiService);
  @override
  Future<Either<Failure, ResendModel>> resend({required String email}) async {
    try {
      var data = await apiService.resend(email: email);
      ResendModel resendModel = ResendModel.fromJson(data);
      return right(resendModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
