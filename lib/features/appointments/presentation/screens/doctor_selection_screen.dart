import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../cubit/book_appointment_cubit.dart';
import '../cubit/book_appointment_state.dart';
import '../widgets/booking_step_indicator.dart';
import '../widgets/doctor_card.dart';
import '../widgets/specialty_filter_chip.dart';

class DoctorSelectionScreen extends StatelessWidget {
  const DoctorSelectionScreen({super.key, required this.cubit});

  final BookAppointmentCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: cubit, child: const _DoctorSelectionView());
  }
}

class _DoctorSelectionView extends StatelessWidget {
  const _DoctorSelectionView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'رجوع',
          onPressed: () => context.go(
            AppRoutes.patientBookAppointment,
            extra: context.read<BookAppointmentCubit>(),
          ),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: const Text('اختيار الطبيب'),
      ),
      body: BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
        builder: (context, state) {
          final cubit = context.read<BookAppointmentCubit>();
          final doctors = BookAppointmentCubit.doctors.where((doctor) {
            return state.selectedSpecialty == null ||
                doctor.specialty == state.selectedSpecialty;
          }).toList();

          return ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              const BookingStepIndicator(currentStep: 2),
              const SizedBox(height: AppSpacing.lg),
              const AppTextField(
                hint: 'ابحث عن طبيب أو مشفى',
                prefixIcon: Icon(Icons.search_rounded),
              ),
              const SizedBox(height: AppSpacing.md),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: BookAppointmentCubit.specialties
                      .map(
                        (specialty) => SpecialtyFilterChip(
                          label: specialty,
                          isSelected: state.selectedSpecialty == specialty,
                          onSelected: () => cubit.selectSpecialty(specialty),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              ...doctors.map(
                (doctor) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.md),
                  child: DoctorCard(
                    doctor: doctor,
                    isSelected: state.selectedDoctor?.id == doctor.id,
                    onTap: () => cubit.selectDoctor(doctor),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              AppButton(
                text: 'متابعة لاختيار الموعد',
                icon: Icons.arrow_back_rounded,
                onPressed: state.canContinueFromDoctor
                    ? () => context.go(
                          AppRoutes.patientSelectDateTime,
                          extra: cubit,
                        )
                    : null,
              ),
            ],
          );
        },
      ),
    );
  }
}
