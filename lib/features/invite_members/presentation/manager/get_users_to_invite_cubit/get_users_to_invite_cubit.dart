import 'package:equatable/equatable.dart';
import 'package:final_project/features/invite_members/data/models/get_users_to_invite_model/get_users_to_invite_model.dart';
import 'package:final_project/features/invite_members/data/repository/get_users_to_invite_repository/get_users_to_invite_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_users_to_invite_state.dart';

class GetUsersToInviteCubit extends Cubit<GetUsersToInviteState> {
  final GetUsersToInviteRepo getUsersToInviteRepo;
  GetUsersToInviteCubit(this.getUsersToInviteRepo)
      : super(GetUsersToInviteInitial());

  Future<void> getUsersToInvite({
    required String token,
    required int id,
  }) async {
    emit(GetUsersToInviteLoading());
    var data = await getUsersToInviteRepo.getUsersIn(token: token, id: id);
    data.fold((l) {
      emit(GetUsersToInviteFailure(l.eerMessage));
    }, (r) {
      emit(GetUsersToInviteSuccess(r));
    });
  }
}
