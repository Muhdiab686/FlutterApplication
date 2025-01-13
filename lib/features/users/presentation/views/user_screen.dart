import 'package:final_project/core/utils/service_locator.dart';
import 'package:final_project/core/utils/shared_pref.dart';
import 'package:final_project/features/users/data/repository/get_users_in_group_repo_impl.dart';
import 'package:final_project/features/users/presentation/manager/cubit/get_users_in_group_cubit.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/user_body.dart';

class UserScreen extends StatelessWidget {
  final int id;
  const UserScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back,),),
        title: Text(
          S.of(context).members,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) =>
            GetUsersInGroupCubit(getIt.get<GetUsersInGroupRepoImpl>())
              ..getUsersInGroup(token: prefs.getString('token')!, id: id),
        child: const UserBody(),
      ),
    );
  }
}
