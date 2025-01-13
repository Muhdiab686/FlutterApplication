import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/features/show_files/data/models/check_in_files_model/check_in_files_model.dart';
import 'package:final_project/features/show_files/data/repository/check_in_files_repository/check_in_files_repo.dart';

class CheckInFilesRepoImpl implements CheckInFilesRepo {
  final ApiService apiService;

  CheckInFilesRepoImpl(this.apiService);

  @override
  Future<Either<Failure, CheckInFilesModel>> checkInFiles(
      {required String token, required List<int> idsList}) async {
    try {
      var data = await apiService.inCheckFiles(token: token, idsList: idsList);
      print(data);
      CheckInFilesModel checkInFilesModel = CheckInFilesModel.fromJson(data);

      return right(checkInFilesModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
