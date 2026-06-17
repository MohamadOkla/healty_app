import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_spacing.dart';

class PatientBottomNavigation extends StatelessWidget {
  const PatientBottomNavigation({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.xl),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.08)),
          boxShadow: AppShadows.medium,
        ),
        child: NavigationBar(
          selectedIndex: selectedIndex,
          backgroundColor: Colors.transparent,
          elevation: 0,
          height: 76,
          indicatorColor: AppColors.primary.withValues(alpha: 0.12),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_rounded),
              selectedIcon: Icon(Icons.home_rounded, color: AppColors.primary),
              label: 'الرئيسية',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month_rounded),
              selectedIcon: Icon(
                Icons.calendar_month_rounded,
                color: AppColors.primary,
              ),
              label: 'المواعيد',
            ),
            NavigationDestination(
              icon: Icon(Icons.add_circle_rounded),
              selectedIcon: Icon(
                Icons.add_circle_rounded,
                color: AppColors.primary,
              ),
              label: 'حجز',
            ),
            NavigationDestination(
              icon: Icon(Icons.notifications_rounded),
              selectedIcon: Icon(
                Icons.notifications_rounded,
                color: AppColors.primary,
              ),
              label: 'الإشعارات',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_rounded),
              selectedIcon: Icon(
                Icons.person_rounded,
                color: AppColors.primary,
              ),
              label: 'حسابي',
            ),
          ],
          onDestinationSelected: (index) {
            final routes = [
              AppRoutes.patientDashboard,
              AppRoutes.patientAppointments,
              AppRoutes.patientBookAppointment,
              AppRoutes.patientNotifications,
              AppRoutes.patientProfile,
            ];
            context.go(routes[index]);
          },
        ),
      ),
    );
  }
}
