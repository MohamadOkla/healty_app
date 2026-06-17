import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'patient_logout_dialog.dart';

class PatientDrawer extends StatelessWidget {
  const PatientDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor:
                        AppColors.secondary.withValues(alpha: 0.18),
                    child: const Icon(
                      Icons.person_rounded,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('محمد أحمد', style: AppTextStyles.titleMedium),
                        Text(
                          'mohammad.health@example.com',
                          style: AppTextStyles.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                children: [
                  _DrawerItem(
                    icon: Icons.home_rounded,
                    title: 'الرئيسية',
                    route: AppRoutes.patientDashboard,
                  ),
                  _DrawerItem(
                    icon: Icons.calendar_month_rounded,
                    title: 'مواعيدي',
                    route: AppRoutes.patientAppointments,
                  ),
                  _DrawerItem(
                    icon: Icons.assignment_rounded,
                    title: 'السجل الطبي',
                    route: AppRoutes.patientMedicalRecords,
                  ),
                  _DrawerItem(
                    icon: Icons.medication_rounded,
                    title: 'الوصفات',
                    route: AppRoutes.patientPrescriptions,
                  ),
                  _DrawerItem(
                    icon: Icons.science_rounded,
                    title: 'التحاليل',
                    route: AppRoutes.patientLaboratory,
                  ),
                  _DrawerItem(
                    icon: Icons.notifications_rounded,
                    title: 'الإشعارات',
                    route: AppRoutes.patientNotifications,
                  ),
                  _DrawerItem(
                    icon: Icons.person_rounded,
                    title: 'حسابي',
                    route: AppRoutes.patientProfile,
                  ),
                  _DrawerItem(
                    icon: Icons.settings_rounded,
                    title: 'الإعدادات',
                    route: AppRoutes.patientSettings,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Material(
                color: AppColors.error.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(AppRadius.md),
                child: ListTile(
                  leading: const Icon(
                    Icons.logout_rounded,
                    color: AppColors.error,
                  ),
                  title: Text(
                    'تسجيل الخروج',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.error,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onTap: () => showPatientLogoutDialog(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.route,
  });

  final IconData icon;
  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title, style: AppTextStyles.bodyMedium),
      trailing: const Icon(Icons.chevron_left_rounded),
      onTap: () => context.go(route),
    );
  }
}
