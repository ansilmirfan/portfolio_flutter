import 'package:flutter/material.dart';
import 'package:portfolio/features/presentation/themes/app_text_theme.dart';
import 'package:portfolio/features/presentation/themes/color/app_colors.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    colorScheme: colorScheme,
    textTheme: textTheme,
    scaffoldBackgroundColor: AppColors.bgColor,
  );
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
  //text theme
  static TextTheme textTheme = TextTheme(
    bodyMedium: AppTextTheme.body,
    bodyLarge: AppTextTheme.bodyBoldWhite,
    bodySmall: AppTextTheme.bodyBoldPrimary,
    headlineLarge: AppTextTheme.boldTitle,
    headlineMedium: AppTextTheme.boldTitlePrimary,
    headlineSmall: AppTextTheme.thinTitle,
  );
}
