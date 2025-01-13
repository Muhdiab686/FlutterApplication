import 'package:final_project/core/utils/shared_pref.dart';
import 'package:final_project/core/widgets/custom_error_widget.dart';
import 'package:final_project/core/widgets/custom_progress_indicator.dart';
import 'package:final_project/features/verify_code/presentation/manager/verify_cubit/verify_cubit.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../show_groups/presentation/views/groups_screen.dart';

class NextButton extends StatelessWidget {
  final TextEditingController code;

  const NextButton({
    super.key,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyCubit, VerifyState>(
      listener: (context, state) {
        if (state is VerifySuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("${state.verifyModel.message}"),
              backgroundColor: Colors.grey,
            ),
          );
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => GroupScreen(),));

        } else if (state is VerifyFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return state is VerifyFailure
            ? ErrorWidgetWithRetry(
                errorMessage: state.errMessage,
                onRetry: () {
                  context.read<VerifyCubit>().verify(
                      code: code.text.trim(), token: prefs.getString('token')!);
                },
              )
            : state is VerifyLoading
                ? const CustomProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      if (code.text.isNotEmpty) {
                        context.read<VerifyCubit>().verify(
                            code: code.text.trim(),
                            token: prefs.getString('token')!);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      S.of(context).next,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),
                  );
      },
    );
  }
}
