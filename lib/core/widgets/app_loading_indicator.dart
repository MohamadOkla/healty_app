import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key, this.size = 28});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: const CircularProgressIndicator(
        strokeWidth: 3,
        color: AppColors.primary,
      ),
    );
  }
}
