import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:final_project/core/errors/failures.dart';

abstract class CheckOutRepo {
  Future<Either<Failure, String>> checkout({
    required String token,
    required File file,
    required int id,
  });
}
