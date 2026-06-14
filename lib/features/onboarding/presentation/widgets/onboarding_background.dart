import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class OnboardingBackground extends StatelessWidget {
  const OnboardingBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.background,
              Color(0xFFE6FFFA),
              AppColors.white,
            ],
          ),
        ),
        child: Stack(
          children: [
            const Positioned(
              top: -120,
              left: -80,
              child: _BackgroundCircle(size: 280),
            ),
            const Positioned(
              bottom: -140,
              right: -100,
              child: _BackgroundCircle(size: 320),
            ),
            SizedBox.expand(child: child),
          ],
        ),
      ),
    );
  }
}

class _BackgroundCircle extends StatelessWidget {
  const _BackgroundCircle({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.secondary.withValues(alpha: 0.10),
      ),
    );
  }
}
