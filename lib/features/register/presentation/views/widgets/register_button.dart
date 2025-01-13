import 'package:final_project/core/utils/app_router.dart';
import 'package:final_project/core/utils/shared_pref.dart';
import 'package:final_project/core/widgets/custom_error_widget.dart';
import 'package:final_project/core/widgets/custom_progress_indicator.dart';
import 'package:final_project/features/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterButton extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  const RegisterButton({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("${state.registerModel.message}"),
              backgroundColor: Colors.green,
            ),
          );
          setToSharedPreference(
              key: 'token', token: state.registerModel.token!);
          if (emailController.text.isNotEmpty) {
            GoRouter.of(context).push(
              AppRouter.kVerifyCodePage,
              extra: emailController.text,
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(S.of(context).emailRequired),
                backgroundColor: Colors.red,
              ),
            );
          }
        } else if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is RegisterLoading) {
          return const Center(
            child: CustomProgressIndicator(),
          );
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            state is RegisterFailure
                ? ErrorWidgetWithRetry(
                    errorMessage: state.errMessage,
                    onRetry: () {
                      context.read<RegisterCubit>().register(
                            name: nameController.text.trim(),
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                    },
                  )
                : ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<RegisterCubit>().register(
                              name: nameController.text.trim(),
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(S.of(context).invalidInput),
                          ),
                        );
                      }
                    },

                    child: Text(
                      S.of(context).register,
                      style: TextStyle(
                        color: theme.colorScheme.onPrimary,
                        fontSize: 20,
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                S.of(context).or,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.textTheme.bodyMedium?.color?.withOpacity(0.3),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
