import 'package:equatable/equatable.dart';
import 'package:final_project/features/get_requests_files/data/respository/approve_request_file_repository/approve_request_file_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'approve_requests_files_state.dart';

class ApproveRequestsFilesCubit extends Cubit<ApproveRequestsFilesState> {
  final ApproveRequestFileRepo approveRequestFileRepo;
  ApproveRequestsFilesCubit(this.approveRequestFileRepo)
      : super(ApproveRequestsFilesInitial());

  Future<void> approve({
    required String token,
    required int id,
  }) async {
    emit(ApproveRequestsFilesLoading());
    var data = await approveRequestFileRepo.approve(token: token, id: id);
    data.fold((l) {
      emit(ApproveRequestsFilesFailure(l.eerMessage));
    }, (r) {
      emit(ApproveRequestsFilesSuccess(r));
    });
  }
}
