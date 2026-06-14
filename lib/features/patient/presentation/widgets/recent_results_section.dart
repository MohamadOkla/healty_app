import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class RecentResultsSection extends StatelessWidget {
  const RecentResultsSection({super.key});

  @override
  Widget build(BuildContext context) {
    const results = [
      ('CBC', 'طبيعي', Color(0xFF22C55E)),
      ('HbA1c', 'طبيعي', Color(0xFF22C55E)),
      ('Vitamin D', 'منخفض', Color(0xFFF59E0B)),
    ];

    return _SectionCard(
      title: 'آخر النتائج',
      children: results.map((result) {
        return _ResultTile(
          name: result.$1,
          status: result.$2,
          color: result.$3,
        );
      }).toList(),
    );
  }
}

class _ResultTile extends StatelessWidget {
  const _ResultTile({
    required this.name,
    required this.status,
    required this.color,
  });

  final String name;
  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        children: [
          Expanded(child: Text(name, style: AppTextStyles.titleMedium)),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            child: Text(
              status,
              style: AppTextStyles.bodyMedium.copyWith(color: color),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          ...children,
        ],
      ),
    );
  }
}
