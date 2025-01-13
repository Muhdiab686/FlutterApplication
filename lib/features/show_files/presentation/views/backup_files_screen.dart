import 'package:final_project/core/utils/service_locator.dart';
import 'package:final_project/core/utils/shared_pref.dart';
import 'package:final_project/core/widgets/custom_error_widget.dart';
import 'package:final_project/core/widgets/custom_progress_indicator.dart';
import 'package:final_project/features/show_files/data/repository/backup_files_repository/backup_files_repo_impl.dart';
import 'package:final_project/features/show_files/presentation/manager/backup_files_cubit/backup_files_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BackupFilesScreen extends StatelessWidget {
  const BackupFilesScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BackupFilesCubit(getIt.get<BackupFilesRepoImpl>())
        ..backupFiles(token: prefs.getString('token')!, id: id),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('File List'),
        ),
        body: BlocBuilder<BackupFilesCubit, BackupFilesState>(
          builder: (context, state) {
            if (state is BackupFilesSuccess) {
              return ListView.builder(
                itemCount: state.backupFilesModel.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.file_present),
                    title: Text(state.backupFilesModel[index].path!),
                    subtitle: Text(
                        'Created at: ${state.backupFilesModel[index].createdAt}'),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Download'),
                    ),
                  );
                },
              );
            } else if (state is BackupFilesFailure) {
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
