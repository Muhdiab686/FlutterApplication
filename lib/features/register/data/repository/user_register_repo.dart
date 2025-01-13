import 'package:dartz/dartz.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/features/register/data/model/user_register_model/user_register_model.dart';

abstract class UserRegisterRepo {
  Future<Either<Failure, UserRegisterModel>> register(
      {required String name, required String email, required String password});
}
