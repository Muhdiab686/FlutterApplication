import 'package:final_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class AddGroupButton extends StatelessWidget {
  final VoidCallback onAddGroup;

  const AddGroupButton({super.key, required this.onAddGroup});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onAddGroup,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        S.of(context).add,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
    );
  }
}
