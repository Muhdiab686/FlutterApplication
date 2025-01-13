import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/features/show_groups/data/models/get_groups_model/get_groups_model.dart';
import 'package:final_project/features/show_groups/data/repository/get_groups_repo.dart';

class GetGroupsRepoImpl implements GetGroupsRepo {
  final ApiService _apiService;

  GetGroupsRepoImpl(this._apiService);

  @override
  Future<Either<Failure, GetGroupsModel>> getGroups(
      {required String token}) async {
    try {
      var data = await _apiService.getGroups(token: token);
      GetGroupsModel getGroupsModel = GetGroupsModel.fromJson(data);

      return right(getGroupsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
