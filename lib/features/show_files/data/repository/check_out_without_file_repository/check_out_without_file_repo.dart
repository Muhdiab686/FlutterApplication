import 'package:dartz/dartz.dart';
import 'package:final_project/core/errors/failures.dart';

abstract class CheckOutWithoutFileRepo {
  Future<Either<Failure, String>> checkoutWithoutFile({
    required String token,
    required int id,
  });
}
