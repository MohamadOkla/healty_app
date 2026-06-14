import 'package:equatable/equatable.dart';

import '../models/doctor_ui_model.dart';

class BookAppointmentState extends Equatable {
  const BookAppointmentState({
    this.selectedSpecialty,
    this.selectedHospital,
    this.selectedVisitType,
    this.selectedDoctor,
    this.selectedDate,
    this.selectedTime,
  });

  final String? selectedSpecialty;
  final String? selectedHospital;
  final String? selectedVisitType;
  final DoctorUiModel? selectedDoctor;
  final DateTime? selectedDate;
  final String? selectedTime;

  bool get canContinueFromBooking =>
      selectedSpecialty != null &&
      selectedHospital != null &&
      selectedVisitType != null;

  bool get canContinueFromDoctor => selectedDoctor != null;

  bool get canConfirm => selectedDate != null && selectedTime != null;

  BookAppointmentState copyWith({
    String? selectedSpecialty,
    String? selectedHospital,
    String? selectedVisitType,
    DoctorUiModel? selectedDoctor,
    DateTime? selectedDate,
    String? selectedTime,
    bool clearTime = false,
  }) {
    return BookAppointmentState(
      selectedSpecialty: selectedSpecialty ?? this.selectedSpecialty,
      selectedHospital: selectedHospital ?? this.selectedHospital,
      selectedVisitType: selectedVisitType ?? this.selectedVisitType,
      selectedDoctor: selectedDoctor ?? this.selectedDoctor,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime: clearTime ? null : selectedTime ?? this.selectedTime,
    );
  }

  @override
  List<Object?> get props => [
        selectedSpecialty,
        selectedHospital,
        selectedVisitType,
        selectedDoctor,
        selectedDate,
        selectedTime,
      ];
}
