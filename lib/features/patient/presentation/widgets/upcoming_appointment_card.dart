import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_button.dart';
import '../models/appointment_model.dart';

class UpcomingAppointmentCard extends StatelessWidget {
  const UpcomingAppointmentCard({super.key, required this.appointment});

  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.soft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('الموعد القادم', style: AppTextStyles.titleMedium),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xFFE6FFFA),
                child: Icon(
                  Icons.medical_services_rounded,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(appointment.doctorName,
                        style: AppTextStyles.titleMedium),
                    Text(appointment.specialty,
                        style: AppTextStyles.bodyMedium),
                  ],
                ),
              ),
              Text(
                '${appointment.day}\n${appointment.time}',
                style: AppTextStyles.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          AppButton(
            text: 'عرض التفاصيل',
            isOutlined: true,
            onPressed: () => context.go(AppRoutes.patientAppointmentDetails),
          ),
        ],
      ),
    );
  }
}
