import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class SpecialtyFilterChip extends StatelessWidget {
  const SpecialtyFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: AppSpacing.sm),
      child: ChoiceChip(
        selected: isSelected,
        onSelected: (_) => onSelected(),
        label: Text(label),
        labelStyle: AppTextStyles.bodyMedium.copyWith(
          color: isSelected ? AppColors.white : AppColors.textDark,
          fontWeight: FontWeight.w700,
        ),
        selectedColor: AppColors.primary,
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.xl),
        ),
      ),
    );
  }
}
