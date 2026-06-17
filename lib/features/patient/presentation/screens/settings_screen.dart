import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widgets/patient_bottom_navigation.dart';
import '../widgets/profile_section_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'رجوع',
          onPressed: () => context.go(AppRoutes.patientDashboard),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: const Text('الإعدادات'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text('تفضيلات التطبيق', style: AppTextStyles.titleMedium),
          const SizedBox(height: AppSpacing.md),
          ProfileSectionCard(
            title: 'عام',
            items: [
              ProfileSectionItem(
                icon: Icons.language_rounded,
                title: 'تغيير اللغة',
                subtitle: 'العربية',
                onTap: () => context.go(AppRoutes.patientLanguage),
              ),
              ProfileSectionItem(
                icon: Icons.dark_mode_rounded,
                title: 'الوضع الليلي',
                subtitle: 'غير مفعل حالياً',
                onTap: () =>
                    _showSnack(context, 'سيتم تفعيل الوضع الليلي لاحقاً'),
              ),
              ProfileSectionItem(
                icon: Icons.notifications_active_rounded,
                title: 'إعدادات الإشعارات',
                onTap: () => context.go(AppRoutes.patientNotificationSettings),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          ProfileSectionCard(
            title: 'قانوني',
            items: [
              ProfileSectionItem(
                icon: Icons.privacy_tip_rounded,
                title: 'سياسة الخصوصية',
                onTap: () => context.go(AppRoutes.patientPrivacyPolicy),
              ),
              ProfileSectionItem(
                icon: Icons.gavel_rounded,
                title: 'شروط الاستخدام',
                onTap: () => context.go(AppRoutes.patientTerms),
              ),
              ProfileSectionItem(
                icon: Icons.info_outline_rounded,
                title: 'حول التطبيق',
                onTap: () => context.go(AppRoutes.patientAbout),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const PatientBottomNavigation(selectedIndex: 4),
    );
  }

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
