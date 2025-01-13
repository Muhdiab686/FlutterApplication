import 'package:flutter/material.dart';
import 'package:final_project/core/utils/styles.dart';
import 'package:final_project/generated/l10n.dart';

class RegistrationPrompt extends StatelessWidget {
  final Function() onPressed;
  const RegistrationPrompt({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          S.of(context).member,
          style: Styles.textStyle18.copyWith(
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            S.of(context).register,
            style: Styles.textStyleButtonPrimary.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
