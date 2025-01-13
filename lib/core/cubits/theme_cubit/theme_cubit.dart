import 'package:final_project/core/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  void toggleTheme(bool isDarkMode) {
    emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    // قم بحفظ الثيم في SharedPreferences
    prefs.setBool('isDarkMode', isDarkMode);
  }
}
