import 'package:final_project/features/register/presentation/views/widgets/register_body.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){
        Navigator.of(context).pop();
      }, icon: Icon(Icons.arrow_back,),),),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/background.jpg"),fit: BoxFit.cover)
          ),
          child: const RegisterBody()),
    );
  }
}
