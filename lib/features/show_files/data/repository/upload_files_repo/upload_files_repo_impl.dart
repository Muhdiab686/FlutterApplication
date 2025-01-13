import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/features/show_files/data/repository/upload_files_repo/upload_files_repo.dart';

class UploadFilesRepoImpl implements UploadFilesRepo {
  final ApiService apiService;

  UploadFilesRepoImpl(this.apiService);
  @override
  Future<Either<Failure, String>> uploadFile(
      {required String token, required int id, required File file}) async {
    try {
      var data = await apiService.uploadFile(
        groupId: id,
        file: file,
        token: token,
      );
      String message = data['message'];
      return right(message);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
