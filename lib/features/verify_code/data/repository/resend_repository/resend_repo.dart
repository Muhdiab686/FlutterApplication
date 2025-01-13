import 'package:dartz/dartz.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/features/verify_code/data/model/resend_model/resend_model.dart';

abstract class ResendRepo {
  Future<Either<Failure, ResendModel>> resend({required String email});
}
