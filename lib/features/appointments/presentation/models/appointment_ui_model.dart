import 'appointment_status.dart';

class AppointmentUiModel {
  const AppointmentUiModel({
    required this.id,
    required this.doctorName,
    required this.specialty,
    required this.hospital,
    required this.department,
    required this.day,
    required this.date,
    required this.time,
    required this.appointmentNumber,
    required this.status,
    required this.notes,
    required this.instructions,
  });

  final String id;
  final String doctorName;
  final String specialty;
  final String hospital;
  final String department;
  final String day;
  final String date;
  final String time;
  final String appointmentNumber;
  final AppointmentStatus status;
  final String notes;
  final List<String> instructions;
}
