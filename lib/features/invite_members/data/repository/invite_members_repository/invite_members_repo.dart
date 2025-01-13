import 'package:dartz/dartz.dart';
import 'package:final_project/core/errors/failures.dart';

abstract class InviteMembersRepo {
  Future<Either<Failure, String>> invite({
    required List<int> membersIds,
    required int groupId,
    required String token
  });
}
