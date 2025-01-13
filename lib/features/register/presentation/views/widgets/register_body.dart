import 'package:final_project/core/widgets/center_logo.dart';
import 'package:final_project/features/register/presentation/views/widgets/login_prompt.dart';
import 'package:final_project/features/register/presentation/views/widgets/register_form.dart';
import 'package:flutter/material.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment:MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(30),
          child: Container(

            width: 500,

            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:Theme.of(context).cardColor.withOpacity(0.4),),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),

                SizedBox(height: 30),
                LoginPrompt(),
                SizedBox(height: 20),
                RegisterForm(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
