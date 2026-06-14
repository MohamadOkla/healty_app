import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class RoleSelectionBackground extends StatelessWidget {
  const RoleSelectionBackground({super.key, required this.child});

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
              right: -90,
              child: _GlassCircle(size: 300),
            ),
            const Positioned(
              bottom: -150,
              left: -100,
              child: _GlassCircle(size: 340),
            ),
            SizedBox.expand(child: child),
          ],
        ),
      ),
    );
  }
}

class _GlassCircle extends StatelessWidget {
  const _GlassCircle({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.secondary.withValues(alpha: 0.12),
      ),
    );
  }
}
