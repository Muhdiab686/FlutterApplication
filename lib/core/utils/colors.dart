import 'package:flutter/cupertino.dart';

/// A class to define a collection of colors for both light and dark themes.
abstract class AppColors {
  // ----- Light Theme Colors -----

  // Primary color for the light theme (soothing blue).
  static const lightPrimaryColor = Color(0xFF3A86FF);

  // Background color for light theme (light gray).
  static const lightBackgroundColor = Color(0xFFF5F5F5);

  // Text color for light theme (dark gray for easy readability).
  static const lightTextColor = Color(0xFF333333);

  // Secondary color for accents in the light theme (a fresh green).
  static const lightSecondaryColor = Color(0xFF4CAF50);

  // Error color for light theme (vibrant red).
  static const lightErrorColor = Color(0xFFEF5350);

  // Button color for the light theme (bright blue for call-to-action).
  static const lightButtonColor = Color(0xFF00BCD4);

  // Accent color for links and highlights in the light theme (soft coral).
  static const lightAccentColor = Color(0xFFFF7043);

  // Color for borders or dividers in light theme (subtle gray).
  static const lightBorderColor = Color(0xFFDDDDDD);

  // ----- Dark Theme Colors -----

  // Primary color for the dark theme (muted blue).
  static const darkPrimaryColor = Color(0xFF1D3D72);

  // Background color for dark theme (dark background with subtle dark gray).
  static const darkBackgroundColor = Color(0xFF121212);

  // Text color for dark theme (light gray for readability on dark backgrounds).
  static const darkTextColor = Color(0xFFE0E0E0);

  // Secondary color for dark theme (a warm yellow-orange for accents).
  static const darkSecondaryColor = Color(0xFFFFC107);

  // Error color for dark theme (bright red for error messages).
  static const darkErrorColor = Color(0xFFEF5350);

  // Button color for dark theme (vibrant blue for calls-to-action).
  static const darkButtonColor = Color(0xFF00BCD4);

  // Accent color for dark theme (soft orange for highlighting).
  static const darkAccentColor = Color(0xFFFF7043);

  // Color for borders or dividers in dark theme (muted gray).
  static const darkBorderColor = Color(0xFF333333);

  // Color for the navigation bar background in dark mode (darker shade of primary).
  static const darkNavBarColor = Color(0xFF0A0A0A);
}
