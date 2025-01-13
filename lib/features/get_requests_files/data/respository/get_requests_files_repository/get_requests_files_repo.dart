import 'package:dartz/dartz.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/features/get_requests_files/data/models/get_requests_files_model/get_requests_files_model.dart';

abstract class GetRequestsFilesRepo {
  Future<Either<Failure, GetRequestsFilesModel>> getRequestsFiles({required int id,required String token,});
}
