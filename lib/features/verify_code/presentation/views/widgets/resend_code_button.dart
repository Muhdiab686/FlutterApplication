import 'package:final_project/core/widgets/custom_error_widget.dart';
import 'package:final_project/core/widgets/custom_progress_indicator.dart';
import 'package:final_project/features/verify_code/presentation/manager/resend_cubit/resend_cubit.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResendCodeButton extends StatelessWidget {
  final String email;

  const ResendCodeButton({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResendCubit, ResendState>(
      listener: (context, state) {
        if (state is ResendSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("${state.resendModel.message}"),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is ResendFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMesssage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return state is ResendFailure
            ? ErrorWidgetWithRetry(
                errorMessage: state.errMesssage,
                onRetry: () {
                  context.read<ResendCubit>().resend(email: email);
                },
              )
            : state is ResendLoading
                ? const CustomProgressIndicator()
                : TextButton(
                    onPressed: () {
                      context.read<ResendCubit>().resend(email: email);
                    },
                    child: Text(
                      S.of(context).resendCode,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
      },
    );
  }
}
