import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_button.dart';
import '../widgets/patient_bottom_navigation.dart';
import '../widgets/patient_logout_dialog.dart';
import '../widgets/profile_section_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
        title: const Text('حسابي'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          const _ProfileHeader(),
          const SizedBox(height: AppSpacing.lg),
          ProfileSectionCard(
            title: 'الحساب',
            items: [
              ProfileSectionItem(
                icon: Icons.edit_rounded,
                title: 'تعديل الملف الشخصي',
                onTap: () => context.go(AppRoutes.patientEditProfile),
              ),
              ProfileSectionItem(
                icon: Icons.lock_reset_rounded,
                title: 'تغيير كلمة المرور',
                onTap: () => context.go(AppRoutes.patientChangePassword),
              ),
              ProfileSectionItem(
                icon: Icons.notifications_active_rounded,
                title: 'إعدادات الإشعارات',
                onTap: () => context.go(AppRoutes.patientNotifications),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          const ProfileSectionCard(
            title: 'المعلومات الصحية',
            items: [
              ProfileSectionItem(
                icon: Icons.bloodtype_rounded,
                title: 'فصيلة الدم',
                subtitle: 'O+',
              ),
              ProfileSectionItem(
                icon: Icons.cake_rounded,
                title: 'العمر',
                subtitle: '32 سنة',
              ),
              ProfileSectionItem(
                icon: Icons.wc_rounded,
                title: 'الجنس',
                subtitle: 'ذكر',
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          ProfileSectionCard(
            title: 'التطبيق',
            items: [
              const ProfileSectionItem(
                icon: Icons.language_rounded,
                title: 'اللغة',
                subtitle: 'العربية',
              ),
              ProfileSectionItem(
                icon: Icons.help_outline_rounded,
                title: 'المساعدة',
                onTap: () => context.go(AppRoutes.patientHelp),
              ),
              ProfileSectionItem(
                icon: Icons.info_outline_rounded,
                title: 'حول التطبيق',
                onTap: () => context.go(AppRoutes.patientAbout),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton(
            text: 'تسجيل الخروج',
            icon: Icons.logout_rounded,
            isOutlined: true,
            onPressed: () => showPatientLogoutDialog(context),
          ),
          const SizedBox(height: AppSpacing.xxl),
        ],
      ),
      bottomNavigationBar: const PatientBottomNavigation(selectedIndex: 4),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 48,
          backgroundColor: AppColors.secondary.withValues(alpha: 0.18),
          child: const Icon(
            Icons.person_rounded,
            color: AppColors.primary,
            size: 52,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text('محمد أحمد', style: AppTextStyles.headlineLarge),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'mohammad.health@example.com',
          style: AppTextStyles.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          '+966 55 123 4567',
          style: AppTextStyles.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
