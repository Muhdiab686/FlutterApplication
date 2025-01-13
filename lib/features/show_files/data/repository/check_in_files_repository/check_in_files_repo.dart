import 'package:dartz/dartz.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/features/show_files/data/models/check_in_files_model/check_in_files_model.dart';

abstract class CheckInFilesRepo {
  Future<Either<Failure, CheckInFilesModel>> checkInFiles(
      {required String token, required List<int> idsList});
}
