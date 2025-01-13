import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:final_project/core/errors/failures.dart';

abstract class UploadFilesRepo {
  Future<Either<Failure, String>> uploadFile(
      {required String token, required int id, required File file});
}
