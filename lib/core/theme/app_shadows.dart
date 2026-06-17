import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

abstract final class AppShadows {
  static List<BoxShadow> get soft => [
        BoxShadow(
          color: AppColors.primary.withValues(alpha: 0.08),
          blurRadius: 18,
          offset: const Offset(0, 10),
        ),
        BoxShadow(
          color: AppColors.textDark.withValues(alpha: 0.04),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ];

  static List<BoxShadow> get medium => [
        BoxShadow(
          color: AppColors.primary.withValues(alpha: 0.12),
          blurRadius: 28,
          offset: const Offset(0, 14),
        ),
        BoxShadow(
          color: AppColors.textDark.withValues(alpha: 0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ];
}
