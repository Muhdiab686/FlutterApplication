import 'package:dartz/dartz.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/features/show_files/data/models/get_files_model/get_files_model.dart';

abstract class GetFilesRepo {
  Future<Either<Failure, GetFilesModel>> getFiles(
      {required String token, required int id});
}
