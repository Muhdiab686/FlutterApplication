import 'package:dartz/dartz.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/features/get_members/data/models/get_members_model/get_members_model.dart';

abstract class GetMembersRepo {
  Future<Either<Failure, GetMembersModel>> getMembers({required String token,required int id});
}
