import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_sizes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../models/role_ui_model.dart';

class RoleCard extends StatelessWidget {
  const RoleCard({
    super.key,
    required this.role,
    required this.isSelected,
    required this.onTap,
  });

  final RoleUiModel role;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: isSelected,
      label: role.arabicTitle,
      child: AnimatedScale(
        scale: isSelected ? 1.02 : 1,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.white
                  : AppColors.white.withValues(alpha: 0.72),
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(
                color: isSelected
                    ? AppColors.primary
                    : AppColors.textGrey.withValues(alpha: 0.14),
                width: isSelected ? 1.6 : 1,
              ),
              boxShadow: isSelected ? AppShadows.soft : null,
            ),
            child: Row(
              children: [
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    color: AppColors.secondary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(AppRadius.md),
                  ),
                  child: Icon(
                    role.icon,
                    color: AppColors.primary,
                    size: AppSizes.iconLg,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(role.arabicTitle, style: AppTextStyles.titleMedium),
                      const SizedBox(height: AppSpacing.xs),
                      Text(role.description, style: AppTextStyles.bodyMedium),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                AnimatedOpacity(
                  opacity: isSelected ? 1 : 0,
                  duration: const Duration(milliseconds: 180),
                  child: const Icon(
                    Icons.check_circle_rounded,
                    color: AppColors.primary,
                    size: AppSizes.iconLg,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
