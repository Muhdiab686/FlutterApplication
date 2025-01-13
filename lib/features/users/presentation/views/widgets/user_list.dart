import 'package:final_project/core/widgets/custom_error_widget.dart';
import 'package:final_project/core/widgets/custom_progress_indicator.dart';
import 'package:final_project/features/users/presentation/manager/cubit/get_users_in_group_cubit.dart';
import 'package:final_project/features/users/presentation/views/widgets/user_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUsersInGroupCubit, GetUsersInGroupState>(
      builder: (context, state) {
        if (state is GetUsersInGroupFailure) {
          return ErrorWidgetWithRetry(
            errorMessage: state.errMessage,
          );
        }
        if (state is GetUsersInGroupSuccess) {
          return ListView.builder(
            itemCount: state.getUsersInGroupModel.user!.length,
            itemBuilder: (context, index) {
              return UserListItem(
                  user: state.getUsersInGroupModel.user![index]);
            },
          );
        } else {
          return const CustomProgressIndicator();
        }
      },
    );
  }
}
