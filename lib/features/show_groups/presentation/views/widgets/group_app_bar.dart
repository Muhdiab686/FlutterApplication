import 'package:final_project/core/cubits/language_cubit/languages_cubit.dart';
import 'package:final_project/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:final_project/core/utils/app_router.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(S.of(context).group),
      actions: [
        PopupMenuButton<String>(
          icon: const Icon(Icons.language),
          onSelected: (value) {
            context.read<LanguageCubit>().changeLanguage(value);
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'en',
              child: Text(S.of(context).english),
            ),
            PopupMenuItem(
              value: 'ar',
              child: Text(S.of(context).arabic),
            ),
          ],
        ),
        IconButton(
          icon: Icon(
            context.read<ThemeCubit>().state == ThemeMode.dark
                ? Icons.dark_mode
                : Icons.light_mode,
          ),
          onPressed: () {
            bool isDarkMode =
                context.read<ThemeCubit>().state == ThemeMode.light;
            context.read<ThemeCubit>().toggleTheme(isDarkMode);
          },
        ),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kAddGroupPage);
          },
          icon: const Icon(
            Icons.create,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
