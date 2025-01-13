import 'package:final_project/core/utils/app_router.dart';
import 'package:final_project/core/utils/shared_pref.dart';
import 'package:final_project/core/widgets/custom_error_widget.dart';
import 'package:final_project/core/widgets/custom_progress_indicator.dart';
import 'package:final_project/features/show_groups/presentation/manager/cubit/get_groups_cubit.dart';
import 'package:final_project/features/show_groups/presentation/views/widgets/group_tile.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GroupListBody extends StatelessWidget {
  const GroupListBody({super.key});

  Future<void> _refreshGroups(BuildContext context) async {
    // استدعاء الكيوبت لجلب المجموعات
    await context
        .read<GetGroupsCubit>()
        .getGroups(token: prefs.getString('token')!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetGroupsCubit, GetGroupsState>(
      builder: (context, state) {
        if (state is GetGroupsFailure) {
          // عرض ودجت خطأ مع إمكانية إعادة المحاولة
          return ErrorWidgetWithRetry(
            errorMessage: state.errMessage,
            onRetry: () => _refreshGroups(context),
          );
        }

        if (state is GetGroupsSuccess) {
          // عرض قائمة المجموعات إذا كانت البيانات موجودة
          return RefreshIndicator(
            onRefresh: () => _refreshGroups(context),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: state.getGroupsModel.data!.isEmpty
                  ? Center(
                      child: Text(S.of(context).noGroupsAvailable),
                    )
                  : ListView.builder(
                      itemCount: state.getGroupsModel.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            GoRouter.of(context).push(AppRouter.kFilesPage,
                                extra: state.getGroupsModel.data![index].id);
                          },
                          child: GroupTile(
                            user: state.getGroupsModel.data![index],
                          ),
                        );
                      },
                    ),
            ),
          );
        }

        // في حالة انتظار البيانات
        return const CustomProgressIndicator();
      },
    );
  }
}
