import 'package:final_project/features/add_group/presentation/views/add_group.dart';
import 'package:final_project/features/get_members/presentation/views/show_members_screen.dart';
import 'package:final_project/features/get_requests_files/presentation/views/files_requests_screen.dart';
import 'package:final_project/features/invite_members/presentation/views/users_to_invite_screen.dart';
import 'package:final_project/features/login/presentation/views/login_screen.dart';
import 'package:final_project/features/register/presentation/views/register_screen.dart';
import 'package:final_project/features/show_files/presentation/views/backup_files_screen.dart';
import 'package:final_project/features/show_files/presentation/views/check_out_screen.dart';
import 'package:final_project/features/show_files/presentation/views/show_files.dart';
import 'package:final_project/features/show_files/presentation/views/widgets/get_changed_screen.dart';
import 'package:final_project/features/show_groups/presentation/views/groups_screen.dart';
import 'package:final_project/features/splash/presentation/views/splash_screen.dart';
import 'package:final_project/features/users/presentation/views/user_screen.dart';
import 'package:final_project/features/verify_code/presentation/views/verify_code_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kLoginPage = '/login-screen';
  static const kRegisterPage = '/register-screen';
  static const kVerifyCodePage = '/verify-screen';
  static const kAddGroupPage = '/add-group-screen';
  static const kGroupPage = '/group-screen';
  static const kUserPage = '/user-screen';
  static const kFilesPage = '/files-screen';
  static const kCheckOutPage = '/checkout-screen';
  static const kgetChangedScreen = '/getChanged-screen';
  static const kBacupFilesScreen = '/backupfiles-screen';
  static const kShowMembers = '/members-screen';
  static const kFilesRequest = '/request-screen';
  static const kUsersToInvite = '/users-to-invite-screen';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: kLoginPage,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: kRegisterPage,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRouter.kVerifyCodePage,
        builder: (context, state) {
          final String email = state.extra as String;
          return VerifyCodeScreen(email: email); // تمرير القيم إلى الصفحة الهدف
        },
      ),
      GoRoute(
        path: kAddGroupPage,
        builder: (context, state) => const AddGroupScreen(),
      ),
      GoRoute(
        path: kGroupPage,
        builder: (context, state) => const GroupScreen(),
      ),
      GoRoute(
        path: kUserPage,
        builder: (context, state) {
          final int id = state.extra as int;
          return UserScreen(id: id);
        },
      ),
      GoRoute(
        path: kFilesPage,
        builder: (context, state) {
          final int id = state.extra as int;
          return FilesScreen(id: id);
        },
      ),
      GoRoute(
        path: kCheckOutPage,
        builder: (context, state) {
          final int id = state.extra as int;
          return CheckOutScreen(id: id);
        },
      ),
      GoRoute(
        path: kgetChangedScreen,
        builder: (context, state) {
          final int id = state.extra as int;
          return GetChangedScreen(id: id);
        },
      ),
      GoRoute(
        path: kBacupFilesScreen,
        builder: (context, state) {
          final int id = state.extra as int;
          return BackupFilesScreen(
            id: id,
          );
        },
      ),
      GoRoute(
        path: kShowMembers,
        builder: (context, state) {
          final int id = state.extra as int;
          return  ShowMembersScreen(id:id);
        },
      )

      ,
      GoRoute(
        path: kFilesRequest,
        builder: (context, state) {
          final int id = state.extra as int;
          return  FileRequestScreen(id:id);
        },
      ),
      
      GoRoute(
        path: kUsersToInvite,
        builder: (context, state) {
          final int id = state.extra as int;
          return  UsersToInviteScreen(id:id);
        },
      )
    ],
  );
}
