import 'package:final_project/core/utils/app_router.dart';
import 'package:final_project/core/utils/shared_pref.dart';
import 'package:final_project/core/widgets/center_logo.dart';
import 'package:final_project/core/widgets/custom_error_widget.dart';
import 'package:final_project/core/widgets/custom_progress_indicator.dart';
import 'package:final_project/features/login/presentation/manager/cubit/user_login_cubit.dart';
import 'package:final_project/features/login/presentation/views/widgets/login_actions.dart';
import 'package:final_project/features/login/presentation/views/widgets/login_form.dart';
import 'package:final_project/features/login/presentation/views/widgets/login_title.dart';
import 'package:final_project/features/login/presentation/views/widgets/registration_prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(

            width: 500,

            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
                color:Theme.of(context).cardColor.withOpacity(0.4)

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 30),
                RegistrationPrompt(
                  onPressed: () {
                    GoRouter.of(context).pushReplacement(AppRouter.kRegisterPage);
                  },
                ),
                const SizedBox(height: 20),
                const LoginTitle(),
                const SizedBox(height: 10),
                LoginForm(
                  emailController: _emailController,
                  passwordController: _passwordController,
                  onPressed: () {},
                ),
                const SizedBox(height: 40),
                BlocConsumer<UserLoginCubit, UserLoginState>(
                  listener: (context, state) {
                    if (state is UserLoginSuccess) {
                      setToSharedPreference(
                        key: 'token',
                        token: state.userLoginModel.accessToken!,
                      );
                      GoRouter.of(context).push(AppRouter.kGroupPage);
                    } else if (state is UserLoginFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errMessage),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is UserLoginLoading) {
                      return const Center(
                        child: CustomProgressIndicator(),
                      );
                    }
                    return state is UserLoginFailure
                        ? ErrorWidgetWithRetry(
                            errorMessage: state.errMessage,
                            onRetry: () {
                              context.read<UserLoginCubit>().login(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                  );
                            },
                          )
                        : LoginActions(
                            onPressed: () {
                              if (_emailController.text.isNotEmpty &&
                                  _passwordController.text.isNotEmpty) {
                                context.read<UserLoginCubit>().login(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text.trim(),
                                    );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Please fill in both email and password.'),
                                  ),
                                );
                              }
                            },
                          );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
