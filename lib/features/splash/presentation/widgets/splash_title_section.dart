import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';

class SplashTitleSection extends StatelessWidget {
  const SplashTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppStrings.appNameAr,
            style: AppTextStyles.headlineLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            AppStrings.appNameEn,
            style: AppTextStyles.bodyMedium,
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
          ),
          SizedBox(height: 20),
          Text(
            AppStrings.ministryName,
            style: AppTextStyles.titleMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
