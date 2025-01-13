import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:final_project/features/show_files/data/models/get_changed_model/get_changed_model.dart';
import 'package:final_project/features/show_files/data/repository/get_changed_repository/get_changed_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_changed_state.dart';

class GetChangedCubit extends Cubit<GetChangedState> {
  final GetChangedRepo getChangedRepo;
  GetChangedCubit(this.getChangedRepo) : super(GetChangedInitial());

  Future<void> getChanged({
    required File file,
    required String token,
    required int id,
  }) async {
    emit(GetChangedLoading());
    var data = await getChangedRepo.getChanged(
      token: token,
      id: id,
      file: file,
    );
    data.fold((l) {
      emit(GetChangedFailure(l.eerMessage));
    }, (r) {
      emit(GetChangedSuccess(r));
    });
  }
}
