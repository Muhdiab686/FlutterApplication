import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/features/login/data/model/user_login_model/user_login_model.dart';
import 'package:final_project/features/login/data/repository/user_login_repo.dart';

class UserLoginRepoImpl implements UserLoginRepo {
  final ApiService _apiService;

  UserLoginRepoImpl(this._apiService);
  @override
  Future<Either<Failure, UserLoginModel>> login(
      {required String email, required String password}) async {
    try {
      var data = await _apiService.login(
        email: email,
        password: password,
      );
      UserLoginModel userLoginModel = UserLoginModel.fromJson(data);
      return right(userLoginModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
