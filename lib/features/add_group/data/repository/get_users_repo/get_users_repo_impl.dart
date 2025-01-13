import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/features/add_group/data/models/get_users_model/get_users_model.dart';
import 'package:final_project/features/add_group/data/repository/get_users_repo/get_users_repo.dart';

class GetUsersRepoImpl implements GetUsersRepo {
  final ApiService _apiService;

  GetUsersRepoImpl(this._apiService);
  @override
  Future<Either<Failure, GetUsersModel>> getUsers(
      {required String token, String? query}) async {
    try {
      var data = await _apiService.getUsers(token: token, query: query);
      GetUsersModel getUsersModel = GetUsersModel.fromJson(data);
      return right(getUsersModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
