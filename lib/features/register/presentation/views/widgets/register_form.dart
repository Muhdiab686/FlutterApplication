import 'package:final_project/core/utils/service_locator.dart';
import 'package:final_project/core/widgets/custom_text_form_field.dart';
import 'package:final_project/features/register/data/repository/user_register_repo_impl.dart';
import 'package:final_project/features/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:final_project/features/register/presentation/views/widgets/register_button.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).register,
            style: theme.textTheme.headlineLarge,
          ),
          const SizedBox(height: 10),
          Text(
            S.of(context).welcome,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.textTheme.bodyMedium?.color?.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            controller: _name,
            label: S.of(context).name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).nameRequired;
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            controller: _email,
            label: S.of(context).email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).emailRequired;
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).passwordRequired;
              } else {
                return null;
              }
            },
            controller: _password,
            label: S.of(context).password,
          ),
          const SizedBox(height: 40),
          BlocProvider(
            create: (context) =>
                RegisterCubit(getIt.get<UserRegisterRepoImpl>()),
            child: RegisterButton(
              nameController: _name,
              emailController: _email,
              passwordController: _password,
              formKey: formKey,
            ),
          ),
        ],
      ),
    );
  }
}
