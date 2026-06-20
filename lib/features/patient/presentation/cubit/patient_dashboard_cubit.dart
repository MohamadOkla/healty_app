import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_routes.dart';
import '../models/appointment_model.dart';
import '../models/health_summary_model.dart';
import '../models/quick_action_model.dart';
import 'patient_dashboard_state.dart';

class PatientDashboardCubit extends Cubit<PatientDashboardState> {
  PatientDashboardCubit()
      : super(
          const PatientDashboardState(
            healthSummary: HealthSummaryModel(
              status: 'حالتك الصحية مستقرة',
              lastVisit: 'منذ 12 يوماً',
              score: 0.92,
              upcomingAppointments: 2,
              activePrescriptions: 4,
              newResults: 1,
            ),
            quickActions: [
              QuickActionModel(
                title: 'حجز موعد',
                icon: Icons.add_circle_rounded,
                route: AppRoutes.patientBookAppointment,
              ),
              QuickActionModel(
                title: 'السجل الطبي',
                icon: Icons.assignment_rounded,
                route: AppRoutes.patientMedicalRecords,
              ),
              QuickActionModel(
                title: 'الوصفات',
                icon: Icons.medication_rounded,
                route: AppRoutes.patientPrescriptions,
              ),
              QuickActionModel(
                title: 'التحاليل',
                icon: Icons.science_rounded,
                route: AppRoutes.patientLaboratory,
              ),
              QuickActionModel(
                title: 'الاستشارات',
                icon: Icons.forum_rounded,
                route: AppRoutes.patientConsultations,
              ),
              QuickActionModel(
                title: 'الإشعارات',
                icon: Icons.notifications_rounded,
                route: AppRoutes.patientNotifications,
              ),
            ],
            upcomingAppointment: AppointmentModel(
              doctorName: 'د. أحمد خالد',
              specialty: 'قلبية',
              day: 'الثلاثاء',
              time: '10:30 صباحاً',
            ),
          ),
        );
}
