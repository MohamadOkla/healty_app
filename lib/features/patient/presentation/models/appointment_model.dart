class AppointmentModel {
  const AppointmentModel({
    required this.doctorName,
    required this.specialty,
    required this.day,
    required this.time,
  });

  final String doctorName;
  final String specialty;
  final String day;
  final String time;
}
