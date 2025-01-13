import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/features/show_files/data/repository/check_out_file_repository/check_out_repo.dart';

class CheckOutRepoImpl implements CheckOutRepo {
  final ApiService apiService;

  CheckOutRepoImpl(this.apiService);

  @override
  Future<Either<Failure, String>> checkout(
      {required String token, required File file, required int id}) async {
    try {
      var data = await apiService.checkout(id: id, file: file, token: token);
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
