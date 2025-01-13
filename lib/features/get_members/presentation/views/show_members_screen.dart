import 'package:final_project/core/utils/service_locator.dart';
import 'package:final_project/core/utils/shared_pref.dart';
import 'package:final_project/core/widgets/custom_error_widget.dart';
import 'package:final_project/core/widgets/custom_progress_indicator.dart';
import 'package:final_project/features/get_members/data/get_members_repository/get_members_repo_impl.dart';
import 'package:final_project/features/get_members/presentation/manager/cubit/get_members_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowMembersScreen extends StatelessWidget {
  final int id;
  const ShowMembersScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetMembersCubit(getIt.get<GetMembersRepoImpl>())
        ..getMembers(token: prefs.getString('token')!, id: id),
      child: Scaffold(
        appBar: AppBar(leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back,),),),
        body: BlocBuilder<GetMembersCubit, GetMembersState>(
          builder: (context, state) {
            if (state is GetMembersSuccess) {
              return ListView.builder(
                itemCount: state.getMembersModel.user!.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(
                            state.getMembersModel.user![index].id.toString()),
                      ),
                      title: Text(
                          state.getMembersModel.user![index].name.toString()),
                      subtitle: Text(
                          'Email: ${state.getMembersModel.user![index].email}\nCode: ${state.getMembersModel.user![index].code}'),
                      trailing: Text(
                          state.getMembersModel.user![index].role ?? 'No Role'),
                    ),
                  );
                },
              );
            }
            if (state is GetMembersFailure) {
              return ErrorWidgetWithRetry(errorMessage: state.errMessage);
            } else {
              return const CustomProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
