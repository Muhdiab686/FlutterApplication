import 'package:final_project/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.validator,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        labelText: label,
        labelStyle: Styles.textStyle16.copyWith(
          color: Theme.of(context).textTheme.bodyLarge!.color,
        ),
      ),
      validator: validator,
    );
  }
}
