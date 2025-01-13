import 'package:equatable/equatable.dart';
import 'package:final_project/features/add_group/data/models/get_users_model/get_users_model.dart';
import 'package:final_project/features/add_group/data/repository/get_users_repo/get_users_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_users_state.dart';

class GetUsersCubit extends Cubit<GetUsersState> {
  final GetUsersRepo getUsersRepo;
  GetUsersCubit(this.getUsersRepo) : super(GetUsersInitial());
  Future<void> getUsers({required String token, String? query}) async {
    emit(GetUsersLoading());
    var data = await getUsersRepo.getUsers(token: token, query: query);
    data.fold((l) {
      emit(GetUsersFailure(l.eerMessage));
    }, (r) {
      emit(GetUsersSuccess(r));
    });
  }
}
