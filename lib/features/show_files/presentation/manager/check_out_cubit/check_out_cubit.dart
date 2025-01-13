import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:final_project/features/show_files/data/repository/check_out_file_repository/check_out_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  final CheckOutRepo checkOutRepo;
  CheckOutCubit(this.checkOutRepo) : super(CheckOutInitial());

  Future<void> checkout({
    required String token,
    required File file,
    required int id,
  }) async {
    emit(CheckOutLoading());
    var data = await checkOutRepo.checkout(token: token, file: file, id: id);
    data.fold((l) {
      emit(CheckOutFailure(l.eerMessage));
    }, (r) {
      emit(CheckOutSuccess(r));
    });
  }
}
