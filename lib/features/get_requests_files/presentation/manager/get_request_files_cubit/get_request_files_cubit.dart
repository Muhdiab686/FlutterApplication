import 'package:equatable/equatable.dart';
import 'package:final_project/features/get_requests_files/data/respository/get_requests_files_repository/get_requests_files_repo.dart';
import 'package:final_project/features/get_requests_files/data/models/get_requests_files_model/get_requests_files_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_request_files_state.dart';

class GetRequestFilesCubit extends Cubit<GetRequestFilesState> {
  final GetRequestsFilesRepo getRequestsFilesRepo;
  GetRequestFilesCubit(this.getRequestsFilesRepo)
      : super(GetRequestFilesInitial());

  Future<void> getRequestFiles({required String token, required int id}) async {
    emit(GetRequestFilesLoading());
    var data =
        await getRequestsFilesRepo.getRequestsFiles(id: id, token: token);
    data.fold((l) {
      emit(GetRequestFilesFailure(l.eerMessage));
    }, (r) {
      emit(GetRequestFilesSuccess(r));
    });
  }
}
