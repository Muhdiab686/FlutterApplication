import 'package:final_project/features/users/presentation/views/widgets/user_list.dart';
import 'package:flutter/material.dart';

class UserBody extends StatelessWidget {
  const UserBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: UserList(),
    );
  }
}
