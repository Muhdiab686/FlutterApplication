import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/features/invite_members/data/models/get_users_to_invite_model/get_users_to_invite_model.dart';
import 'package:final_project/features/invite_members/data/repository/get_users_to_invite_repository/get_users_to_invite_repo.dart';

class GetUsersToInviteRepoImpl implements GetUsersToInviteRepo {
  final ApiService apiService;

  GetUsersToInviteRepoImpl(this.apiService);

  @override
  Future<Either<Failure, GetUsersToInviteModel>> getUsersIn(
      {required String token, required int id}) async {
    try {
      var data = await apiService.getUsersIn(token: token, id: id);
      GetUsersToInviteModel getUsersToInviteModel =
          GetUsersToInviteModel.fromJson(data);
      return right(getUsersToInviteModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
