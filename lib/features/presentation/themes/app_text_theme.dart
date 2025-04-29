import 'package:flutter/material.dart';
import 'package:portfolio/features/presentation/themes/color/app_colors.dart';

class AppTextTheme {
  static TextStyle body = TextStyle(
    fontFamily: 'FiraCode',
    fontSize: 16,
    color: AppColors.grey,
    fontWeight: FontWeight.normal,
  );

  static TextStyle bodyBoldWhite = TextStyle(
    fontFamily: 'FiraCode',
    fontSize: 16,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle bodyBoldPrimary = TextStyle(
    fontFamily: 'FiraCode',
    fontSize: 16,
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
  );
  static TextStyle boldTitle = TextStyle(
    fontFamily: 'FiraCode',
    fontSize: 32,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle boldTitlePrimary = TextStyle(
    fontFamily: 'FiraCode',
    fontSize: 32,
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
  );
  static TextStyle thinTitle = TextStyle(
    fontFamily: 'FiraCode',
    fontSize: 32,
    color: AppColors.white,
    fontWeight: FontWeight.w500,
  );
}
