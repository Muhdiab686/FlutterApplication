import 'package:final_project/core/utils/service_locator.dart';
import 'package:final_project/features/login/data/repository/user_login_repo_impl.dart';
import 'package:final_project/features/login/presentation/manager/cubit/user_login_cubit.dart';
import 'package:final_project/features/login/presentation/views/widgets/login_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/background.jpg"),fit: BoxFit.cover)
        ),
        child: BlocProvider(
          create: (context) => UserLoginCubit(getIt.get<UserLoginRepoImpl>()),
          child: const LoginBody(),
        ),
      ),
    );
  }
}
