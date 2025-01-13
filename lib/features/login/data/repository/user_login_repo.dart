import 'package:dartz/dartz.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/features/login/data/model/user_login_model/user_login_model.dart';

abstract class UserLoginRepo {
  Future<Either<Failure, UserLoginModel>> login({
    required String email,
    required String password,
  });
}
