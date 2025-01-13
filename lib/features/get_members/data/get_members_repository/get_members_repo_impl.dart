import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/features/get_members/data/get_members_repository/get_members_repo.dart';
import 'package:final_project/features/get_members/data/models/get_members_model/get_members_model.dart';

class GetMembersRepoImpl implements GetMembersRepo {
  final ApiService apiService;

  GetMembersRepoImpl(this.apiService);

  @override
  Future<Either<Failure, GetMembersModel>> getMembers(
      {required String token, required int id}) async {
    try {
      var data = await apiService.getMembers(token: token, id: id);
      GetMembersModel getMembersModel = GetMembersModel.fromJson(data);
      return right(getMembersModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
