import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/errors/failures.dart';
import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/features/show_files/data/repository/check_out_without_file_repository/check_out_without_file_repo.dart';

class CheckOutWithoutFileRepoImpl implements CheckOutWithoutFileRepo {
  final ApiService apiService;

  CheckOutWithoutFileRepoImpl(this.apiService);
  @override
  Future<Either<Failure, String>> checkoutWithoutFile(
      {required String token, required int id}) async {
    try {
      var data = await apiService.checkoutWithoutFile(id: id, token: token);
      String message = data['message'];
      return right(message);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
