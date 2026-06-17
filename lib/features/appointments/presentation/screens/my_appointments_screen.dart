import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_empty_state.dart';
import '../../../patient/presentation/widgets/patient_bottom_navigation.dart';
import '../cubit/appointments_cubit.dart';
import '../cubit/appointments_state.dart';
import '../widgets/appointment_card.dart';
import '../widgets/appointment_stats_card.dart';
import '../widgets/appointment_tabs.dart';
import '../widgets/appointments_header.dart';

class MyAppointmentsScreen extends StatelessWidget {
  const MyAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppointmentsCubit(),
      child: const _MyAppointmentsView(),
    );
  }
}

class _MyAppointmentsView extends StatelessWidget {
  const _MyAppointmentsView();

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
        title: const Text('مواعيدي'),
        actions: [
          IconButton(
            tooltip: 'بحث',
            onPressed: () => _showAppointmentSearch(context),
            icon: const Icon(Icons.search_rounded),
          ),
          IconButton(
            tooltip: 'تصفية',
            onPressed: () => _showAppointmentFilter(context),
            icon: const Icon(Icons.tune_rounded),
          ),
        ],
      ),
      body: BlocBuilder<AppointmentsCubit, AppointmentsState>(
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              const AppointmentsHeader(),
              const SizedBox(height: AppSpacing.md),
              AppointmentStatsCard(
                upcoming: state.upcomingCount,
                previous: state.previousCount,
                canceled: state.canceledCount,
              ),
              const SizedBox(height: AppSpacing.md),
              AppointmentTabs(
                selectedStatus: state.selectedStatus,
                onChanged: context.read<AppointmentsCubit>().changeStatus,
              ),
              const SizedBox(height: AppSpacing.md),
              if (state.visibleAppointments.isEmpty)
                const AppEmptyState(
                  title: 'لا توجد مواعيد',
                  message: 'ستظهر المواعيد هنا عند توفرها.',
                  icon: Icons.event_busy_rounded,
                )
              else
                ...state.visibleAppointments.map(
                  (appointment) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.md),
                    child: AppointmentCard(
                      appointment: appointment,
                      onDetailsPressed: () =>
                          context.go(AppRoutes.patientAppointmentDetails),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go(AppRoutes.patientBookAppointment),
        icon: const Icon(Icons.add_rounded),
        label: const Text('حجز موعد جديد'),
      ),
      bottomNavigationBar: const PatientBottomNavigation(selectedIndex: 1),
    );
  }

  void _showAppointmentSearch(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('بحث المواعيد'),
        content: const Text('يمكن البحث حالياً ضمن بيانات المواعيد التجريبية.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('تم'),
          ),
        ],
      ),
    );
  }

  void _showAppointmentFilter(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('تصفية المواعيد'),
              const SizedBox(height: AppSpacing.md),
              ListTile(
                leading: const Icon(Icons.event_available_rounded),
                title: const Text('المواعيد القادمة'),
                onTap: () => Navigator.of(context).pop(),
              ),
              ListTile(
                leading: const Icon(Icons.history_rounded),
                title: const Text('المواعيد السابقة'),
                onTap: () => Navigator.of(context).pop(),
              ),
              ListTile(
                leading: const Icon(Icons.cancel_rounded),
                title: const Text('المواعيد الملغاة'),
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
