import 'package:equatable/equatable.dart';
import 'package:final_project/features/get_members/data/get_members_repository/get_members_repo.dart';
import 'package:final_project/features/get_members/data/models/get_members_model/get_members_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_members_state.dart';

class GetMembersCubit extends Cubit<GetMembersState> {
  final GetMembersRepo getMembersRepo;
  GetMembersCubit(this.getMembersRepo) : super(GetMembersInitial());

  Future<void> getMembers({required String token, required int id}) async {
    emit(GetMembersLoading());
    var data = await getMembersRepo.getMembers(token: token, id: id);
    data.fold((l) {
      emit(GetMembersFailure(l.eerMessage));
    }, (r) {
      emit(GetMembersSuccess(r));
    });
  }
}
