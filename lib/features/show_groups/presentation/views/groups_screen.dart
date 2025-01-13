import 'package:final_project/core/utils/service_locator.dart';
import 'package:final_project/core/utils/shared_pref.dart';
import 'package:final_project/features/show_groups/data/repository/get_groups_repo_impl.dart';
import 'package:final_project/features/show_groups/presentation/manager/cubit/get_groups_cubit.dart';
import 'package:final_project/features/show_groups/presentation/views/widgets/group_app_bar.dart';
import 'package:final_project/features/show_groups/presentation/views/widgets/group_list_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocProvider(
        create: (context) => GetGroupsCubit(getIt.get<GetGroupsRepoImpl>())
          ..getGroups(token: prefs.getString('token')!),
        child: const GroupListBody(),
      ),
    );
  }
}
