import 'package:dartz/dartz.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/features/verify_code/data/model/verify_model.dart';

abstract class VerifyRepo {
  Future<Either<Failure, VerifyModel>> verify(
      {required String token, required String code});
}
