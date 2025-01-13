import 'package:dartz/dartz.dart';
import 'package:final_project/core/errors/failures.dart';

abstract class CreateGroupRepo {
  Future<Either<Failure, String>> createGroup(
      {required String nameGroup,
      required List<int> userIds,
      required String token});
}
