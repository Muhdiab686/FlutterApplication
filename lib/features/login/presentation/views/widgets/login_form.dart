import 'package:flutter/material.dart';
import 'package:final_project/core/utils/styles.dart';
import 'package:final_project/core/widgets/custom_text_form_field.dart';
import 'package:final_project/generated/l10n.dart';

class LoginForm extends StatelessWidget {
  final Function() onPressed;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).emailRequired;
            } else {
              return null;
            }
          },
          controller: emailController,
          label: S.of(context).email,
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
          controller: passwordController,
          label: S.of(context).password,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            S.of(context).forgetPassword,
            style: Styles.textStyleButtonPrimary.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
