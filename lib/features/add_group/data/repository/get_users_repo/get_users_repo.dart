import 'package:dartz/dartz.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/features/add_group/data/models/get_users_model/get_users_model.dart';

abstract class GetUsersRepo {
  Future<Either<Failure, GetUsersModel>> getUsers(
      {required String token, String? query});
}
