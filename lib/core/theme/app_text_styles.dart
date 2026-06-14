import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

abstract final class AppTextStyles {
  static const TextStyle headlineLarge = TextStyle(
    color: AppColors.textDark,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 1.35,
  );

  static const TextStyle titleMedium = TextStyle(
    color: AppColors.textDark,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static const TextStyle bodyMedium = TextStyle(
    color: AppColors.textGrey,
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static const TextTheme textTheme = TextTheme(
    headlineLarge: headlineLarge,
    titleMedium: titleMedium,
    bodyMedium: bodyMedium,
  );
}
