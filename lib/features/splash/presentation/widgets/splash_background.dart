import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class SplashBackground extends StatelessWidget {
  const SplashBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.background,
              Color(0xFFE6FFFA),
              AppColors.white,
            ],
          ),
        ),
        child: SizedBox.expand(child: child),
      ),
    );
  }
}
