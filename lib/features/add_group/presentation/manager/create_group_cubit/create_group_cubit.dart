import 'package:equatable/equatable.dart';
import 'package:final_project/features/add_group/data/repository/create_group/create_group_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_group_state.dart';

class CreateGroupCubit extends Cubit<CreateGroupState> {
  final CreateGroupRepo createGroupRepo;
  CreateGroupCubit(this.createGroupRepo) : super(CreateGroupInitial());

  Future<void> createGroup(
      {required String groupName,
      required List<int> userIds,
      required String token}) async {
    emit(CreateGroupLoading());
    var data = await createGroupRepo.createGroup(
      nameGroup: groupName,
      userIds: userIds,
      token: token,
    );

    data.fold((l) {
      emit(CreateGroupFailure(l.eerMessage));
    }, (r) {
      emit(CreateGroupSuccess(r));
    });
  }
}
