import 'dart:io';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:final_project/core/utils/service_locator.dart';
import 'package:final_project/core/utils/shared_pref.dart';
import 'package:final_project/core/widgets/custom_progress_indicator.dart';
import 'package:final_project/features/show_files/data/repository/get_changed_repository/get_changed_repo_impl.dart';
import 'package:final_project/features/show_files/presentation/manager/get_changed_cubit/get_changed_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetChangedScreen extends StatefulWidget {
  final int id;
  const GetChangedScreen({super.key, required this.id});

  @override
  State<GetChangedScreen> createState() => _GetChangedScreenState();
}

class _GetChangedScreenState extends State<GetChangedScreen> {
  File? selectedFile;

  Future<void> selectFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['txt', 'pdf'],
      );

      if (result != null) {
        setState(() {
          selectedFile = File(result.files.single.path!);
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
      create: (context) => GetChangedCubit(getIt.get<GetChangedRepoImpl>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Checkout Screen"),
        ),
        body: BlocConsumer<GetChangedCubit, GetChangedState>(
          listener: (context, state) {
            if (state is GetChangedFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Error: ${state.errMessage}")),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // عرض الملف المختار
                  if (selectedFile != null) ...[
                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.insert_drive_file),
                        title: Text(selectedFile!.path.split('/').last),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              selectedFile = null;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 20),
                  // زر اختيار الملف
                  ElevatedButton(
                    onPressed: selectFile,
                    child: const Text("Select File"),
                  ),
                  const SizedBox(height: 20),
                  // زر رفع الملف
                  ElevatedButton(
                    onPressed: selectedFile == null
                        ? null
                        : () {
                            context.read<GetChangedCubit>().getChanged(
                                  token: prefs.getString('token')!,
                                  file: selectedFile!,
                                  id: widget.id,
                                );
                          },
                    child: const Text("Upload File"),
                  ),
                  const SizedBox(height: 20),
                  // عرض حالة التحميل أو التغييرات
                  if (state is GetChangedLoading)
                    const CustomProgressIndicator()
                  else if (state is GetChangedSuccess)
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.getChangedModel.changes?.length ?? 0,
                        itemBuilder: (context, index) {
                          final change = state.getChangedModel.changes![index];
                          final changesData = change.changes;
                          Map<String, dynamic> details = {};

                          // التحقق من أن الحقل ليس فارغًا
                          if (changesData != null && changesData.isNotEmpty) {
                            try {
                              details = jsonDecode(changesData);
                            } catch (e) {
                              details = {};
                            }
                          }

                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Change ID: ${change.id}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                  const SizedBox(height: 8),
                                  if (details['added'] != null &&
                                      details['added'].isNotEmpty)
                                    Text("Added: ${details['added'].join(', ')}"),
                                  if (details['removed'] != null &&
                                      details['removed'].isNotEmpty)
                                    Text(
                                        "Removed: ${details['removed'].join(', ')}"),
                                  if (details['modified'] != null &&
                                      details['modified'].isNotEmpty)
                                    ...details['modified']
                                        .map<Widget>((mod) => Text(
                                              "Line ${mod['line_number']}: "
                                              "${mod['old_content']} → ${mod['new_content']}",
                                            ))
                                        .toList(),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  else if (state is GetChangedFailure)
                    Center(
                      child: Text(
                        "Error: ${state.errMessage}",
                        style: const TextStyle(color: Colors.red),
                      ),
                    )
                  else
                    const Center(
                      child: Text("No Data Available."),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
