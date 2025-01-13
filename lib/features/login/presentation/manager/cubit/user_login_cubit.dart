import 'package:equatable/equatable.dart';
import 'package:final_project/features/login/data/model/user_login_model/user_login_model.dart';
import 'package:final_project/features/login/data/repository/user_login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_login_state.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  final UserLoginRepo userLoginRepo;
  UserLoginCubit(this.userLoginRepo) : super(UserLoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(UserLoginLoading());
    var data = await userLoginRepo.login(email: email, password: password);
    data.fold((l) {
      emit(UserLoginFailure(l.eerMessage));
    }, (r) {
      emit(UserLoginSuccess(r));
    });
  }
}
