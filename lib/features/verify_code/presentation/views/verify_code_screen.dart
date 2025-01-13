import 'package:final_project/core/utils/service_locator.dart';
import 'package:final_project/core/widgets/custom_text_form_field.dart';
import 'package:final_project/features/verify_code/data/repository/resend_repository/resend_repo_impl.dart';
import 'package:final_project/features/verify_code/data/repository/verify_repository/verify_repo_impl.dart';
import 'package:final_project/features/verify_code/presentation/manager/resend_cubit/resend_cubit.dart';
import 'package:final_project/features/verify_code/presentation/manager/verify_cubit/verify_cubit.dart';
import 'package:final_project/features/verify_code/presentation/views/widgets/next_button.dart';
import 'package:final_project/features/verify_code/presentation/views/widgets/resend_code_button.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key, required this.email});
  final String email;

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final TextEditingController _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              S.of(context).verification,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).codeRequired;
                } else {
                  return null;
                }
              },
              controller: _codeController,
              label: S.of(context).code,
            ),
            const SizedBox(height: 20),
            BlocProvider(
              create: (context) => ResendCubit(getIt.get<ResendRepoImpl>()),
              child: ResendCodeButton(
                email: widget.email,
              ),
            ),
            const SizedBox(height: 40),
            BlocProvider(
              create: (context) => VerifyCubit(getIt.get<VerifyRepoImpl>()),
              child: NextButton(
                code: _codeController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
