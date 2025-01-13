import 'package:equatable/equatable.dart';
import 'package:final_project/features/invite_members/data/repository/invite_members_repository/invite_members_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'invite_members_state.dart';

class InviteMembersCubit extends Cubit<InviteMembersState> {
  final InviteMembersRepo inviteMembersRepo;
  InviteMembersCubit(this.inviteMembersRepo) : super(InviteMembersInitial());

  Future<void> invite({
    required List<int> membersIds,
    required int groupId,
    required String token,
  }) async {
    emit(InviteMembersLoading());
    var data = await inviteMembersRepo.invite(
        membersIds: membersIds, groupId: groupId, token: token);
    data.fold((l) {
      emit(InviteMembersFailure(l.eerMessage));
    }, (r) {
      emit(InviteMembersSuccess(r));
    });
  }
}
