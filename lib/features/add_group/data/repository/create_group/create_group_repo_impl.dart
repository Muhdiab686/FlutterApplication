import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/features/add_group/data/repository/create_group/create_group_repo.dart';

class CreateGroupRepoImpl implements CreateGroupRepo {
  final ApiService _apiService;

  CreateGroupRepoImpl(this._apiService);

  @override
  Future<Either<Failure, String>> createGroup(
      {required String nameGroup,
      required List<int> userIds,
      required String token}) async {
    try {
      var data = await _apiService.createGroup(
          token: token, name: nameGroup, userIds: userIds);
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
