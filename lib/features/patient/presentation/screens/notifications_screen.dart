import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_loading.dart';
import '../widgets/notification_card.dart';
import '../widgets/patient_bottom_navigation.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key, this.showLoading = false});

  final bool showLoading;

  @override
  Widget build(BuildContext context) {
    const todayNotifications = [
      _NotificationItem(
        icon: Icons.notifications_active_rounded,
        title: 'تم تأكيد موعدك القادم',
        description: 'موعدك مع د. أحمد خالد غداً الساعة 10:30 صباحاً.',
        time: 'منذ 10 دقائق',
        color: AppColors.primary,
      ),
      _NotificationItem(
        icon: Icons.medication_rounded,
        title: 'تم تحديث الوصفة الطبية',
        description: 'تمت إضافة تعليمات جديدة على الوصفة النشطة.',
        time: 'منذ ساعة',
        color: AppColors.secondary,
      ),
    ];
    const yesterdayNotifications = [
      _NotificationItem(
        icon: Icons.science_rounded,
        title: 'تمت إضافة نتيجة تحليل جديدة',
        description: 'نتيجة CBC أصبحت متاحة داخل قسم التحاليل.',
        time: 'أمس',
        isRead: true,
        color: AppColors.warning,
      ),
      _NotificationItem(
        icon: Icons.health_and_safety_rounded,
        title: 'تذكير صحي',
        description: 'لا تنس متابعة قياساتك الصحية الأسبوعية.',
        time: 'أمس',
        isRead: true,
        color: AppColors.success,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'رجوع',
          onPressed: () => context.go(AppRoutes.patientDashboard),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: const Text('الإشعارات'),
      ),
      body: showLoading
          ? const AppLoading()
          : todayNotifications.isEmpty && yesterdayNotifications.isEmpty
              ? const AppEmptyState(
                  title: 'لا توجد إشعارات',
                  message: 'ستظهر التنبيهات الطبية المهمة هنا عند توفرها.',
                  icon: Icons.notifications_off_rounded,
                )
              : ListView(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  children: const [
                    _NotificationSection(
                      title: 'اليوم',
                      notifications: todayNotifications,
                    ),
                    SizedBox(height: AppSpacing.lg),
                    _NotificationSection(
                      title: 'أمس',
                      notifications: yesterdayNotifications,
                    ),
                    SizedBox(height: AppSpacing.xxl),
                  ],
                ),
      bottomNavigationBar: const PatientBottomNavigation(selectedIndex: 3),
    );
  }
}

class _NotificationSection extends StatelessWidget {
  const _NotificationSection({
    required this.title,
    required this.notifications,
  });

  final String title;
  final List<_NotificationItem> notifications;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.titleMedium),
        const SizedBox(height: AppSpacing.md),
        ...notifications.map(
          (notification) => Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.md),
            child: NotificationCard(
              icon: notification.icon,
              title: notification.title,
              description: notification.description,
              time: notification.time,
              isRead: notification.isRead,
              color: notification.color,
              onTap: () => context.go(AppRoutes.patientNotificationDetails),
            ),
          ),
        ),
      ],
    );
  }
}

class _NotificationItem {
  const _NotificationItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.time,
    required this.color,
    this.isRead = false,
  });

  final IconData icon;
  final String title;
  final String description;
  final String time;
  final Color color;
  final bool isRead;
}
