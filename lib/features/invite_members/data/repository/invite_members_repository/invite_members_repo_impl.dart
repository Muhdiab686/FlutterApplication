import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/features/invite_members/data/repository/invite_members_repository/invite_members_repo.dart';

class InviteMembersRepoImpl implements InviteMembersRepo {
  final ApiService apiService;

  InviteMembersRepoImpl(this.apiService);

  @override
  Future<Either<Failure, String>> invite(
      {required List<int> membersIds,
      required int groupId,
      required String token}) async {
    try {
      var data = await apiService.invite(
        token: token,
        groupId: groupId,
        membersIds: membersIds,
      );
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
