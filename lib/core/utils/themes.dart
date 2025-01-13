import 'package:final_project/core/utils/colors.dart';
import 'package:flutter/material.dart';

import 'app_constants.dart';

/// Light Mode Theme
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.lightPrimaryColor,
  scaffoldBackgroundColor: AppColors.lightBackgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.lightPrimaryColor,
    foregroundColor: AppColors.lightTextColor,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.lightTextColor, fontSize: 16),
    bodyMedium: TextStyle(color: AppColors.lightTextColor, fontSize: 14),
    headlineLarge: TextStyle(
        color: AppColors.lightTextColor,
        fontSize: 24,
        fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(color: AppColors.lightTextColor, fontSize: 18),
    labelSmall: TextStyle(color: AppColors.lightSecondaryColor, fontSize: 12),
  ),
  colorScheme: const ColorScheme.light(
    surface: AppColors.lightBackgroundColor,
    primary: AppColors.lightPrimaryColor,
    secondary: AppColors.lightSecondaryColor,
    error: AppColors.lightErrorColor,
    onPrimary: Colors.white,
    onSurface: AppColors.lightTextColor,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.lightButtonColor, // Primary button color
    disabledColor: AppColors.lightBorderColor, // Disabled button color
    textTheme: ButtonTextTheme.primary, // Text follows primary theme color
    highlightColor:
        AppColors.lightAccentColor, // Highlight color on interaction
  ),
  dividerColor: AppColors.lightBorderColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.lightButtonColor),
      foregroundColor: WidgetStateProperty.all(AppColors.lightTextColor),
      overlayColor: WidgetStateProperty.all(AppColors.lightAccentColor),
    ),
  ),
);

/// Dark Mode Theme
ThemeData darkTheme = ThemeData(
  fontFamily: Font.poppins,
  primaryColorDark: const Color.fromRGBO(111, 88, 255, 1),
  primaryColor: const Color.fromRGBO(128, 109, 255, 1),
  primaryColorLight: const Color.fromRGBO(159, 84, 252, 1),
  brightness: Brightness.dark,
  primarySwatch: Colors.deepPurple,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(128, 109, 255, 1),
      ).merge(
        ButtonStyle(elevation: MaterialStateProperty.all(0)),
      )),
  canvasColor: const Color.fromRGBO(31, 29, 44, 1),
  cardColor: const Color.fromRGBO(38, 40, 55, 1),
);
