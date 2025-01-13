import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/features/users/data/models/get_users_in_group_model/get_users_in_group_model.dart';
import 'package:final_project/features/users/data/repository/get_users_in_group_repo.dart';

class GetUsersInGroupRepoImpl implements GetUsersInGroupRepo {
  final ApiService apiService;

  GetUsersInGroupRepoImpl(this.apiService);
  @override
  Future<Either<Failure, GetUsersInGroupModel>> getUsersInGroup(
      {required int id, required String token}) async {
    try {
      var data = await apiService.getUsersIn(token: token, id: id);
      GetUsersInGroupModel getUsersInGroupModel =
          GetUsersInGroupModel.fromJson(data);
      return right(getUsersInGroupModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
