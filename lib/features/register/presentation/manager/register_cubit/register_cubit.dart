import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/features/register/data/model/user_register_model/user_register_model.dart';
import 'package:final_project/features/register/data/repository/user_register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final UserRegisterRepo userRegisterRepo;
  RegisterCubit(this.userRegisterRepo) : super(RegisterInitial());

  Future<void> register(
      {required String name,
      required String password,
      required String email}) async {
    emit(RegisterLoading());
    var data = await userRegisterRepo.register(
        name: name, email: email, password: password);

    data.fold((l) {
      emit(RegisterFailure(l.toString()));
    }, (r) {
      emit(RegisterSuccess(r));
    });
  }
}
