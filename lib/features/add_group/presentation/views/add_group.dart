import 'package:final_project/core/utils/service_locator.dart';
import 'package:final_project/core/utils/shared_pref.dart';
import 'package:final_project/features/add_group/data/repository/get_users_repo/get_users_repo_impl.dart';
import 'package:final_project/features/add_group/presentation/manager/get_users_cubit/get_users_cubit.dart';
import 'package:final_project/features/add_group/presentation/views/widgets/add_group_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddGroupScreen extends StatelessWidget {
  const AddGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){
        Navigator.of(context).pop();
      }, icon: Icon(Icons.arrow_back,),),),
      body: BlocProvider(
        create: (context) => GetUsersCubit(getIt.get<GetUsersRepoImpl>())
          ..getUsers(token: prefs.getString('token')!),
        child: const AddGroupBody(),
      ),
    );
  }
}
