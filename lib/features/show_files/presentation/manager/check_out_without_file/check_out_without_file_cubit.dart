import 'package:equatable/equatable.dart';
import 'package:final_project/features/show_files/data/repository/check_out_without_file_repository/check_out_without_file_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'check_out_without_file_state.dart';

class CheckOutWithoutFileCubit extends Cubit<CheckOutWithoutFileState> {
  final CheckOutWithoutFileRepo checkOutWithoutFileRepo;
  CheckOutWithoutFileCubit(this.checkOutWithoutFileRepo)
      : super(CheckOutWithoutFileInitial());

  Future<void> checkoutWithoutFile(
      {required String token, required int id}) async {
    emit(CheckOutWithoutFileLoading());
    var data =
        await checkOutWithoutFileRepo.checkoutWithoutFile(token: token, id: id);
    data.fold((l) {
      emit(CheckOutWithoutFileFailure(l.eerMessage));
    }, (r) {
      emit(CheckOutWithoutFileSuccess(r));
    });
  }
}
