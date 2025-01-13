import 'package:equatable/equatable.dart';
import 'package:final_project/features/show_files/data/models/check_in_files_model/check_in_files_model.dart';
import 'package:final_project/features/show_files/data/repository/check_in_files_repository/check_in_files_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'check_in_files_state.dart';

class CheckInFilesCubit extends Cubit<CheckInFilesState> {
  final CheckInFilesRepo checkInFilesRepo;
  CheckInFilesCubit(this.checkInFilesRepo) : super(CheckInFilesInitial());

  Future<void> checkInFiles(
      {required String token, required List<int> list}) async {
    emit(CheckInFilesLoading());
    var data = await checkInFilesRepo.checkInFiles(token: token, idsList: list);
    data.fold((l) {
      emit(CheckInFilesFailure(l.eerMessage));
    }, (r) {
      emit(CheckInFilesSuccess(r));
    });
  }
}
