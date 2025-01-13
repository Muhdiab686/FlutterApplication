import 'package:final_project/core/utils/app_router.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPrompt extends StatelessWidget {
  const LoginPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text(
          S.of(context).haveAccount,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.textTheme.bodyMedium?.color?.withOpacity(0.3),
          ),
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).pushReplacement(AppRouter.kLoginPage);
          },
          child: Text(
            S.of(context).login,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
