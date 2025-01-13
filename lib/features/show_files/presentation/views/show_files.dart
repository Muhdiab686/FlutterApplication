import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:final_project/core/utils/app_router.dart';
import 'package:final_project/core/utils/service_locator.dart';
import 'package:final_project/core/utils/shared_pref.dart';
import 'package:final_project/core/widgets/custom_progress_indicator.dart';
import 'package:final_project/features/show_files/data/repository/get_files_repo/get_files_repo_impl.dart';
import 'package:final_project/features/show_files/data/repository/upload_files_repo/upload_files_repo_impl.dart';
import 'package:final_project/features/show_files/presentation/manager/get_files_cubit/get_files_cubit.dart';
import 'package:final_project/features/show_files/presentation/manager/upload_file_cubit/upload_file_cubit.dart';
import 'package:final_project/features/show_files/presentation/views/widgets/files_body.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FilesScreen extends StatefulWidget {
  final int id;

  const FilesScreen({super.key, required this.id});

  @override
  State<FilesScreen> createState() => _FilesScreenState();
}

class _FilesScreenState extends State<FilesScreen> {
  File? selectedFile; // المتغير الذي سيحتوي على الملف المختار

  Future<void> selectFile() async {
    try {
      // اختيار الملف باستخدام FilePicker
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['txt', 'pdf'], // السماح بملفات النصوص و PDF فقط
      );

      if (result != null) {
        setState(() {
          selectedFile = File(result.files.single.path!); // تخزين الملف
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick file: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadFileCubit(getIt.get<UploadFilesRepoImpl>()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon: Icon(Icons.arrow_back,),),
          title: Text(
            S.of(context).files,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(
                  AppRouter.kFilesRequest,
                  extra: widget.id,
                );
              },
              icon: const Icon(
                Icons.upload,
              ),
            ),
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(
                  AppRouter.kUsersToInvite,
                  extra: widget.id,
                );
              },
              icon: const Icon(
                Icons.group_add,
              ),
            ),
            IconButton(
              onPressed: () {

              },
              icon: const Icon(
                Icons.notifications,
              ),
            ),
          ],
        ),
        body: BlocProvider(
          create: (context) => GetFilesCubit(getIt.get<GetFilesRepoImpl>())
            ..getFiles(token: prefs.getString('token')!, id: widget.id),
          child: FilesBody(
            groupId: widget.id,
          ),
        ),
        floatingActionButton: BlocConsumer<UploadFileCubit, UploadFileState>(
          listener: (context, state) {
            if (state is UploadFileSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            } else if (state is UploadFileFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errMessage)),
              );
            }
          },
          builder: (context, state) {
            if (state is UploadFileLoading) {
              return const CustomProgressIndicator();
            }

            return FloatingActionButton(
              onPressed: () async {
                if (selectedFile == null) {
                  // إذا لم يتم اختيار ملف، افتح نافذة اختيار الملف
                  await selectFile();
                } else {
                  // إذا تم اختيار ملف، ارفع الملف
                  context.read<UploadFileCubit>().uploadFile(
                        token: prefs.getString('token')!,
                        id: widget.id,
                        file: selectedFile!,
                      );

                  setState(() {
                    selectedFile = null; // إعادة تعيين الملف بعد الرفع
                  });
                }
              },
              child:
                  Icon(selectedFile == null ? Icons.add : Icons.cloud_upload),
            );
          },
        ),
      ),
    );
  }
}
