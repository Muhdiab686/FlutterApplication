import 'package:dartz/dartz.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/features/show_groups/data/models/get_groups_model/get_groups_model.dart';

abstract class GetGroupsRepo {
  Future<Either<Failure, GetGroupsModel>> getGroups({required String token});
}
