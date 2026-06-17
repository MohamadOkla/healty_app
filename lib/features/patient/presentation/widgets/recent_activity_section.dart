import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class RecentActivitySection extends StatelessWidget {
  const RecentActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    const activities = [
      (
        Icons.science_rounded,
        'تمت إضافة نتيجة تحليل جديدة',
        AppRoutes.patientLaboratoryDetails,
      ),
      (
        Icons.medication_rounded,
        'تم تحديث الوصفة الطبية',
        AppRoutes.patientPrescriptionDetails,
      ),
      (
        Icons.event_available_rounded,
        'تم تأكيد موعدك القادم',
        AppRoutes.patientAppointmentDetails,
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('آخر النشاطات', style: AppTextStyles.titleMedium),
          const SizedBox(height: AppSpacing.md),
          ...activities.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: InkWell(
                onTap: () => context.go(item.$3),
                borderRadius: BorderRadius.circular(AppRadius.md),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor:
                            AppColors.secondary.withValues(alpha: 0.14),
                        child:
                            Icon(item.$1, color: AppColors.primary, size: 20),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Text(item.$2, style: AppTextStyles.bodyMedium),
                      ),
                      const Icon(Icons.chevron_left_rounded),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
