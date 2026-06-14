import 'package:equatable/equatable.dart';

import '../models/appointment_status.dart';
import '../models/appointment_ui_model.dart';

class AppointmentsState extends Equatable {
  const AppointmentsState({
    required this.appointments,
    this.selectedStatus = AppointmentStatus.confirmed,
    this.isLoading = false,
  });

  final List<AppointmentUiModel> appointments;
  final AppointmentStatus selectedStatus;
  final bool isLoading;

  List<AppointmentUiModel> get visibleAppointments {
    return appointments
        .where((appointment) => appointment.status == selectedStatus)
        .toList(growable: false);
  }

  int get upcomingCount => 2;

  int get previousCount => 12;

  int get canceledCount => 1;

  AppointmentUiModel get selectedAppointment => appointments.first;

  AppointmentsState copyWith({
    List<AppointmentUiModel>? appointments,
    AppointmentStatus? selectedStatus,
    bool? isLoading,
  }) {
    return AppointmentsState(
      appointments: appointments ?? this.appointments,
      selectedStatus: selectedStatus ?? this.selectedStatus,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [appointments, selectedStatus, isLoading];
}
