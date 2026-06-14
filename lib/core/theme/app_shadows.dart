import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

abstract final class AppShadows {
  static List<BoxShadow> get soft => [
        BoxShadow(
          color: AppColors.textDark.withValues(alpha: 0.06),
          blurRadius: 16,
          offset: const Offset(0, 8),
        ),
      ];

  static List<BoxShadow> get medium => [
        BoxShadow(
          color: AppColors.textDark.withValues(alpha: 0.10),
          blurRadius: 24,
          offset: const Offset(0, 12),
        ),
      ];
}
