import 'package:equatable/equatable.dart';
import 'package:final_project/features/show_files/data/models/get_files_model/get_files_model.dart';
import 'package:final_project/features/show_files/data/repository/get_files_repo/get_files_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_files_state.dart';

class GetFilesCubit extends Cubit<GetFilesState> {
  final GetFilesRepo getFilesRepo;
  GetFilesCubit(this.getFilesRepo) : super(GetFilesInitial());

  Future<void> getFiles({required String token, required int id}) async {
    emit(GetFilesLoading());
    var data = await getFilesRepo.getFiles(token: token, id: id);
    data.fold((l) {
      emit(GetFilesFailure(l.eerMessage));
    }, (r) {
      emit(GetFilesSuccess(r));
    });
  }
}
