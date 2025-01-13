import 'package:equatable/equatable.dart';
import 'package:final_project/features/verify_code/data/model/resend_model/resend_model.dart';
import 'package:final_project/features/verify_code/data/repository/resend_repository/resend_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'resend_state.dart';

class ResendCubit extends Cubit<ResendState> {
  final ResendRepo resendRepo;
  ResendCubit(this.resendRepo) : super(ResendInitial());

  Future<void> resend({required String email}) async {
    emit(ResendLoading());
    var data = await resendRepo.resend(email: email);
    data.fold((l) {
      emit(ResendFailure(l.eerMessage));
    }, (r) {
      emit(ResendSuccess(r));
    });
  }
}
