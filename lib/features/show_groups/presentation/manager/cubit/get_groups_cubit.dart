import 'package:equatable/equatable.dart';
import 'package:final_project/features/show_groups/data/models/get_groups_model/get_groups_model.dart';
import 'package:final_project/features/show_groups/data/repository/get_groups_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_groups_state.dart';

class GetGroupsCubit extends Cubit<GetGroupsState> {
  final GetGroupsRepo getGroupsRepo;
  GetGroupsCubit(this.getGroupsRepo) : super(GetGroupsInitial());

  Future<void> getGroups({required String token}) async {
    emit(GetGroupsLoading());
    var data = await getGroupsRepo.getGroups(token: token);
    data.fold((l) {
      emit(GetGroupsFailure(l.eerMessage));
    }, (r) {
      emit(GetGroupsSuccess(r));
    });
  }
}
