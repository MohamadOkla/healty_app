import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_card.dart';

class ProfileSectionCard extends StatelessWidget {
  const ProfileSectionCard({
    super.key,
    required this.title,
    required this.items,
  });

  final String title;
  final List<ProfileSectionItem> items;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          ...items.map(
            (item) => ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(item.icon, color: AppColors.primary),
              title: Text(item.title, style: AppTextStyles.bodyMedium),
              subtitle: item.subtitle == null
                  ? null
                  : Text(item.subtitle!, style: AppTextStyles.bodyMedium),
              trailing: item.onTap == null
                  ? null
                  : const Icon(Icons.chevron_left_rounded),
              onTap: item.onTap,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileSectionItem {
  const ProfileSectionItem({
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
}
