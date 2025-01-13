import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/features/show_files/data/models/get_changed_model/get_changed_model.dart';
import 'package:final_project/features/show_files/data/repository/get_changed_repository/get_changed_repo.dart';

class GetChangedRepoImpl implements GetChangedRepo {
  final ApiService apiService;

  GetChangedRepoImpl(this.apiService);
  @override
  Future<Either<Failure, GetChangedModel>> getChanged(
      {required String token, required int id, required File file}) async {
    try {
      var data = await apiService.getChanged(
        id: id,
        token: token,
        file: file,
      );
      GetChangedModel getChangedModel = GetChangedModel.fromJson(data);
      return right(getChangedModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
