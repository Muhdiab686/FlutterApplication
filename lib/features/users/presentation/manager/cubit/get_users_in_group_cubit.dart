import 'package:equatable/equatable.dart';
import 'package:final_project/features/users/data/models/get_users_in_group_model/get_users_in_group_model.dart';
import 'package:final_project/features/users/data/repository/get_users_in_group_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_users_in_group_state.dart';

class GetUsersInGroupCubit extends Cubit<GetUsersInGroupState> {
  final GetUsersInGroupRepo getUsersInGroupRepo;
  GetUsersInGroupCubit(this.getUsersInGroupRepo)
      : super(GetUsersInGroupInitial());

  Future<void> getUsersInGroup({required String token, required int id}) async {
    emit(GetUsersInGroupLoading());
    var data = await getUsersInGroupRepo.getUsersInGroup(id: id, token: token);
    data.fold((l) {
      emit(GetUsersInGroupFailure(l.eerMessage));
    }, (r) {
      emit(GetUsersInGroupSuccess(r));
    });
  }
}
