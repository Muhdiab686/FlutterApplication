import 'package:final_project/core/utils/service_locator.dart';
import 'package:final_project/core/utils/shared_pref.dart';
import 'package:final_project/core/widgets/custom_error_widget.dart';
import 'package:final_project/core/widgets/custom_progress_indicator.dart';
import 'package:final_project/features/get_requests_files/data/respository/approve_request_file_repository/approve_request_repo_file_impl.dart';
import 'package:final_project/features/get_requests_files/data/respository/get_requests_files_repository/get_requests_files_repo_impl.dart';
import 'package:final_project/features/get_requests_files/presentation/manager/approve_request_files_cubit/approve_requests_files_cubit.dart';
import 'package:final_project/features/get_requests_files/presentation/manager/get_request_files_cubit/get_request_files_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileRequestScreen extends StatelessWidget {
  final int id;
  const FileRequestScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetRequestFilesCubit(getIt.get<GetRequestsFilesRepoImpl>())
                ..getRequestFiles(token: prefs.getString('token')!, id: id),
        ),
        BlocProvider(
          create: (context) => ApproveRequestsFilesCubit(
              getIt.get<ApproveRequestRepoFileImpl>()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back,),),),
        body: BlocBuilder<GetRequestFilesCubit, GetRequestFilesState>(
          builder: (context, state) {
            if (state is GetRequestFilesSuccess) {
              return ListView.builder(
                itemCount: state.getRequestsFilesModel.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final file = state.getRequestsFilesModel.data![index];
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(file.id.toString()),
                      ),
                      title: Text(file.fileName.toString()),
                      subtitle: Text(
                          'Status: ${file.status}\nCreated: ${file.createdAt!.toLocal()}'),
                      trailing: file.status == 'pending'
                          ? SizedBox(
                              width: 120,
                              child: ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<ApproveRequestsFilesCubit>()
                                      .approve(
                                        token: prefs.getString('token')!,
                                        id: file.id!,
                                      )
                                      .then((_) {
                                    // إعادة تحديث الحالة بعد الموافقة
                                    context
                                        .read<GetRequestFilesCubit>()
                                        .getRequestFiles(
                                            token: prefs.getString('token')!,
                                            id: id);
                                  });
                                },
                                child: const Text('Approve'),
                              ),
                            )
                          : const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                    ),
                  );
                },
              );
            } else if (state is GetRequestFilesFailure) {
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
