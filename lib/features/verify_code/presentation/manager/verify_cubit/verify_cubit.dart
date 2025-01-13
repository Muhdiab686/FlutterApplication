import 'package:equatable/equatable.dart';
import 'package:final_project/features/show_groups/presentation/views/groups_screen.dart';
import 'package:final_project/features/verify_code/data/model/verify_model.dart';
import 'package:final_project/features/verify_code/data/repository/verify_repository/verify_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  final VerifyRepo verifyRepo;
  VerifyCubit(this.verifyRepo) : super(VerifyInitial());

  Future<void> verify({required String code, required String token }) async {
    emit(VerifyLoading());
    var data = await verifyRepo.verify(token: token, code: code);
    data.fold((l) {
      emit(VerifyFailure(l.eerMessage));
    }, (r) {
      emit(VerifySuccess(r));
    });
  }
}
