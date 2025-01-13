import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/features/register/data/model/user_register_model/user_register_model.dart';
import 'package:final_project/features/register/data/repository/user_register_repo.dart';

class UserRegisterRepoImpl implements UserRegisterRepo {
  final ApiService _apiService;

  UserRegisterRepoImpl(this._apiService);
  @override
  Future<Either<Failure, UserRegisterModel>> register(
      {required String name,
      required String email,
      required String password}) async {
    try {
      var data = await _apiService.register(
        email: email,
        name: name,
        password: password,
      );

      UserRegisterModel userRegisterModel = UserRegisterModel.fromJson(data);
      return right(userRegisterModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
