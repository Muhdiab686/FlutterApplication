import 'package:dartz/dartz.dart';
import 'package:final_project/core/errors/failures.dart';

abstract class ApproveRequestFileRepo {
  Future<Either<Failure, String>> approve({required String token ,required int id,});
}
