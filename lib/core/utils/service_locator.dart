import 'package:dio/dio.dart';
import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/features/add_group/data/repository/create_group/create_group_repo_impl.dart';
import 'package:final_project/features/add_group/data/repository/get_users_repo/get_users_repo_impl.dart';
import 'package:final_project/features/get_members/data/get_members_repository/get_members_repo_impl.dart';
import 'package:final_project/features/get_requests_files/data/respository/approve_request_file_repository/approve_request_repo_file_impl.dart';
import 'package:final_project/features/get_requests_files/data/respository/get_requests_files_repository/get_requests_files_repo_impl.dart';
import 'package:final_project/features/invite_members/data/repository/get_users_to_invite_repository/get_users_to_invite_repo_impl.dart';
import 'package:final_project/features/invite_members/data/repository/invite_members_repository/invite_members_repo_impl.dart';
import 'package:final_project/features/login/data/repository/user_login_repo_impl.dart';
import 'package:final_project/features/register/data/repository/user_register_repo_impl.dart';
import 'package:final_project/features/show_files/data/repository/backup_files_repository/backup_files_repo_impl.dart';
import 'package:final_project/features/show_files/data/repository/check_in_files_repository/check_in_files_repo_impl.dart';
import 'package:final_project/features/show_files/data/repository/check_out_file_repository/check_out_repo_impl.dart';
import 'package:final_project/features/show_files/data/repository/check_out_without_file_repository/check_out_without_file_repo_impl.dart';
import 'package:final_project/features/show_files/data/repository/get_changed_repository/get_changed_repo_impl.dart';
import 'package:final_project/features/show_files/data/repository/get_files_repo/get_files_repo_impl.dart';
import 'package:final_project/features/show_files/data/repository/upload_files_repo/upload_files_repo_impl.dart';
import 'package:final_project/features/show_groups/data/repository/get_groups_repo_impl.dart';
import 'package:final_project/features/users/data/repository/get_users_in_group_repo_impl.dart';
import 'package:final_project/features/verify_code/data/repository/resend_repository/resend_repo_impl.dart';
import 'package:final_project/features/verify_code/data/repository/verify_repository/verify_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton(
    UserRegisterRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton(
    UserLoginRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton(
    ResendRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton(
    VerifyRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton(
    GetGroupsRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton(
    GetUsersRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton(
    CreateGroupRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton(
    GetUsersInGroupRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton(
    GetFilesRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton(
    UploadFilesRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton(
    CheckInFilesRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton(
    CheckOutRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton(
    CheckOutWithoutFileRepoImpl(
      getIt.get<ApiService>(),
    ),
  );




  getIt.registerSingleton(
    GetChangedRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton(
    BackupFilesRepoImpl(
      getIt.get<ApiService>(),
    ),
  );



   getIt.registerSingleton(
    GetMembersRepoImpl(
      getIt.get<ApiService>(),
    ),
  );


   getIt.registerSingleton(
    GetRequestsFilesRepoImpl(
      getIt.get<ApiService>(),
    ),
  );


  getIt.registerSingleton(
    ApproveRequestRepoFileImpl(
      getIt.get<ApiService>(),
    ),
  );


  getIt.registerSingleton(
    GetUsersToInviteRepoImpl(
      getIt.get<ApiService>(),
    ),
  );


  getIt.registerSingleton(
    InviteMembersRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
