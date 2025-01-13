import 'package:final_project/core/utils/service_locator.dart';
import 'package:final_project/core/utils/shared_pref.dart';
import 'package:final_project/core/widgets/custom_error_widget.dart';
import 'package:final_project/core/widgets/custom_progress_indicator.dart';
import 'package:final_project/core/widgets/custom_text_form_field.dart';
import 'package:final_project/features/add_group/data/repository/create_group/create_group_repo_impl.dart';
import 'package:final_project/features/add_group/presentation/manager/create_group_cubit/create_group_cubit.dart';
import 'package:final_project/features/add_group/presentation/manager/get_users_cubit/get_users_cubit.dart';
import 'package:final_project/features/add_group/presentation/views/widgets/add_group_button.dart';
import 'package:final_project/features/add_group/presentation/views/widgets/user_list_view.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddGroupBody extends StatefulWidget {
  const AddGroupBody({super.key});

  @override
  State<AddGroupBody> createState() => _AddGroupBodyState();
}

class _AddGroupBodyState extends State<AddGroupBody> {
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  List<int> selectedUsers = []; // قائمة المستخدمين المحددين

  @override
  void dispose() {
    _groupNameController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void toggleUserSelection(int userId) {
    setState(() {
      if (selectedUsers.contains(userId)) {
        selectedUsers.remove(userId); // إزالة التحديد إذا كان موجودًا
      } else {
        selectedUsers.add(userId); // إضافة التحديد إذا لم يكن موجودًا
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateGroupCubit(getIt.get<CreateGroupRepoImpl>()),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            CustomTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).groupNameRequired;
                }
                return null;
              },
              controller: _groupNameController,
              label: S.of(context).groupName,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: S.of(context).searchUsers,
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    return;
                  }
                  context
                      .read<GetUsersCubit>()
                      .getUsers(token: prefs.getString('token')!, query: value);
                });
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<GetUsersCubit, GetUsersState>(
              builder: (context, state) {
                if (state is GetUsersSuccess) {
                  return Expanded(
                    child: UserListView(
                      users: state.getUsersModel.user!,
                      selectedUsers: selectedUsers, // تمرير المستخدمين المحددين
                      onSelectUser: toggleUserSelection, // تحديث التحديد
                    ),
                  );
                }
                if (state is GetUsersFailure) {
                  return ErrorWidgetWithRetry(errorMessage: state.errMessage);
                } else {
                  return const CustomProgressIndicator();
                }
              },
            ),
            const SizedBox(height: 20),
            BlocConsumer<CreateGroupCubit, CreateGroupState>(
              listener: (context, state) {
                if (state is CreateGroupSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                  // إعادة تعيين الحقول بعد النجاح
                  _groupNameController.clear();
                  setState(() {
                    selectedUsers.clear();
                  });
                }
                if (state is CreateGroupFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errMessage)),
                  );
                }
              },
              builder: (context, state) {
                return AddGroupButton(
                  onAddGroup: () {
                    if (_groupNameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(S.of(context).groupNameRequired)),
                      );
                      return;
                    }

                    if (selectedUsers.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(S.of(context).noUsersSelected)),
                      );
                      return;
                    }

                    context.read<CreateGroupCubit>().createGroup(
                          groupName: _groupNameController.text,
                          userIds: selectedUsers,
                          token: prefs.getString('token')!,
                        );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
