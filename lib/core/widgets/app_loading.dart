import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../theme/app_sizes.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key, this.size = AppSizes.iconLg});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: size,
        child: const CircularProgressIndicator(
          color: AppColors.primary,
          strokeWidth: 3,
        ),
      ),
    );
  }
}
