import 'package:flutter/material.dart';
import 'package:final_project/core/utils/styles.dart';
import 'package:final_project/generated/l10n.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).login,
          style: Styles.textStyle18.copyWith(
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          S.of(context).welcome,
          style: Styles.textStyle20.copyWith(
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ),
      ],
    );
  }
}
