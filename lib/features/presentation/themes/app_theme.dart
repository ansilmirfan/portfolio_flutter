import 'package:flutter/material.dart';
import 'package:portfolio/features/presentation/themes/color/app_colors.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(colorScheme: colorScheme);
  //color scheme
  static final colorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    secondary: AppColors.grey,
    onSecondary: AppColors.white,

    surface: AppColors.bgColor,
    onSurface: AppColors.white,
    error: Colors.red,
    onError: AppColors.white,
  );
}
