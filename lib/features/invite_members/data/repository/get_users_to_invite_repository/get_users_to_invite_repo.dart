import 'package:dartz/dartz.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/features/invite_members/data/models/get_users_to_invite_model/get_users_to_invite_model.dart';

abstract class GetUsersToInviteRepo {
  Future<Either<Failure, GetUsersToInviteModel>> getUsersIn({required String token,required int id,});
}
