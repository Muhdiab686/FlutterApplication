import 'package:dartz/dartz.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/features/users/data/models/get_users_in_group_model/get_users_in_group_model.dart';

abstract class GetUsersInGroupRepo {
  Future<Either<Failure, GetUsersInGroupModel>> getUsersInGroup(
      {required int id, required String token});
}
