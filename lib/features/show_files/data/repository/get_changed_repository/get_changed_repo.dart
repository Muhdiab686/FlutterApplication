import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/features/show_files/data/models/get_changed_model/get_changed_model.dart';

abstract class GetChangedRepo {
  Future<Either<Failure, GetChangedModel>> getChanged({required String token,required int id,required File file,});
}
