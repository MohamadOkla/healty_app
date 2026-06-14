import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_shadows.dart';

class PatientBottomNavigation extends StatelessWidget {
  const PatientBottomNavigation({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.xl),
          boxShadow: AppShadows.medium,
        ),
        child: NavigationBar(
          selectedIndex: selectedIndex,
          backgroundColor: Colors.transparent,
          elevation: 0,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_rounded),
              label: 'الرئيسية',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month_rounded),
              label: 'المواعيد',
            ),
            NavigationDestination(
              icon: Icon(Icons.add_circle_rounded),
              label: 'حجز',
            ),
            NavigationDestination(
              icon: Icon(Icons.notifications_rounded),
              label: 'الإشعارات',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_rounded),
              label: 'حسابي',
            ),
          ],
          onDestinationSelected: (index) {
            final routes = [
              AppRoutes.patientDashboard,
              AppRoutes.patientAppointments,
              AppRoutes.patientAppointments,
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
