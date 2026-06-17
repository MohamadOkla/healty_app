import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../models/health_summary_model.dart';
import 'health_progress_indicator.dart';

class HealthSummaryCard extends StatelessWidget {
  const HealthSummaryCard({super.key, required this.summary});

  final HealthSummaryModel summary;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.xl),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.86),
            borderRadius: BorderRadius.circular(AppRadius.xl),
            border: Border.all(color: AppColors.white.withValues(alpha: 0.80)),
            boxShadow: AppShadows.soft,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'حالتك الصحية مستقرة',
                          style: AppTextStyles.titleMedium,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          'آخر زيارة: ${summary.lastVisit}',
                          style: AppTextStyles.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  HealthProgressIndicator(value: summary.score),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              Row(
                children: [
                  _SummaryStat(
                    label: 'مواعيد قادمة',
                    value: '${summary.upcomingAppointments}',
                    icon: Icons.calendar_month_rounded,
                    route: AppRoutes.patientAppointments,
                  ),
                  _SummaryStat(
                    label: 'وصفات نشطة',
                    value: '${summary.activePrescriptions}',
                    icon: Icons.medication_rounded,
                    route: AppRoutes.patientPrescriptions,
                  ),
                  _SummaryStat(
                    label: 'نتيجة جديدة',
                    value: '${summary.newResults}',
                    icon: Icons.science_rounded,
                    route: AppRoutes.patientLaboratory,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SummaryStat extends StatelessWidget {
  const _SummaryStat({
    required this.label,
    required this.value,
    required this.icon,
    required this.route,
  });

  final String label;
  final String value;
  final IconData icon;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => context.go(route),
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
          child: Column(
            children: [
              Icon(icon, color: AppColors.primary),
              const SizedBox(height: AppSpacing.xs),
              Text(value, style: AppTextStyles.titleMedium),
              Text(
                label,
                style: AppTextStyles.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
