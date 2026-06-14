import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_sizes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: AppColors.secondary.withValues(alpha: 0.18),
          child: const Icon(Icons.person_rounded, color: AppColors.primary),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('مرحباً محمد', style: AppTextStyles.titleMedium),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'نتمنى لك يوماً صحياً سعيداً',
                style: AppTextStyles.bodyMedium,
              ),
            ],
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            _HeaderIconButton(
              icon: Icons.notifications_none_rounded,
              semanticLabel: 'الإشعارات، 3 إشعارات جديدة',
              onPressed: () {},
            ),
            PositionedDirectional(
              top: -3,
              end: -3,
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.xs),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFEF4444),
                ),
                child: Text(
                  '3',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: AppSpacing.sm),
        _HeaderIconButton(
          icon: Icons.menu_rounded,
          semanticLabel: 'القائمة',
          onPressed: () {},
        ),
      ],
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  const _HeaderIconButton({
    required this.icon,
    required this.semanticLabel,
    required this.onPressed,
  });

  final IconData icon;
  final String semanticLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticLabel,
      child: Material(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: IconButton(
          iconSize: AppSizes.iconMd,
          color: AppColors.textDark,
          onPressed: onPressed,
          icon: Icon(icon),
        ),
      ),
    );
  }
}
