import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/doctor_ui_model.dart';
import '../models/time_slot_ui_model.dart';
import 'book_appointment_state.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentState> {
  BookAppointmentCubit() : super(const BookAppointmentState());

  static const specialties = [
    'قلبية',
    'جلدية',
    'عظمية',
    'أطفال',
    'داخلية',
    'عيون',
  ];

  static const hospitals = [
    'مشفى دمشق الجامعي',
    'مشفى المواساة',
    'مشفى الأسد الجامعي',
  ];

  static const visitTypes = [
    'كشف جديد',
    'متابعة',
    'استشارة',
  ];

  static const doctors = [
    DoctorUiModel(
      id: 'd1',
      name: 'د. أحمد خالد',
      specialty: 'قلبية',
      hospital: 'مشفى دمشق الجامعي',
      rating: 4.8,
      experience: '12 سنة خبرة',
      earliestAvailable: 'غداً 10:30 صباحاً',
      icon: Icons.monitor_heart_rounded,
    ),
    DoctorUiModel(
      id: 'd2',
      name: 'د. رانيا يوسف',
      specialty: 'جلدية',
      hospital: 'مشفى المواساة',
      rating: 4.7,
      experience: '9 سنوات خبرة',
      earliestAvailable: 'الأحد 09:00 صباحاً',
      icon: Icons.health_and_safety_rounded,
    ),
    DoctorUiModel(
      id: 'd3',
      name: 'د. سامر علي',
      specialty: 'عظمية',
      hospital: 'مشفى الأسد الجامعي',
      rating: 4.6,
      experience: '10 سنوات خبرة',
      earliestAvailable: 'الخميس 01:00 مساءً',
      icon: Icons.accessibility_new_rounded,
    ),
    DoctorUiModel(
      id: 'd4',
      name: 'د. ليلى حسن',
      specialty: 'أطفال',
      hospital: 'مشفى دمشق الجامعي',
      rating: 4.9,
      experience: '14 سنة خبرة',
      earliestAvailable: 'الإثنين 11:15 صباحاً',
      icon: Icons.child_care_rounded,
    ),
    DoctorUiModel(
      id: 'd5',
      name: 'د. نور الدين حمدان',
      specialty: 'داخلية',
      hospital: 'مشفى المواساة',
      rating: 4.8,
      experience: '11 سنة خبرة',
      earliestAvailable: 'الثلاثاء 12:30 مساءً',
      icon: Icons.medical_services_rounded,
    ),
    DoctorUiModel(
      id: 'd6',
      name: 'د. ميساء العلي',
      specialty: 'عيون',
      hospital: 'مشفى الأسد الجامعي',
      rating: 4.7,
      experience: '8 سنوات خبرة',
      earliestAvailable: 'الأربعاء 09:30 صباحاً',
      icon: Icons.visibility_rounded,
    ),
  ];

  static const timeSlots = [
    TimeSlotUiModel(label: '09:00', period: 'صباحاً'),
    TimeSlotUiModel(label: '09:30', period: 'صباحاً'),
    TimeSlotUiModel(label: '10:00', period: 'صباحاً', isAvailable: false),
    TimeSlotUiModel(label: '10:30', period: 'صباحاً'),
    TimeSlotUiModel(label: '12:30', period: 'مساءً'),
    TimeSlotUiModel(label: '01:00', period: 'مساءً'),
    TimeSlotUiModel(label: '01:30', period: 'مساءً'),
    TimeSlotUiModel(label: '02:00', period: 'مساءً', isAvailable: false),
  ];

  bool get canContinueFromBookStep => state.canContinueFromBooking;
  bool get canContinueFromDoctorStep => state.canContinueFromDoctor;
  bool get canConfirmBooking => state.canConfirm;

  void selectSpecialty(String specialty) {
    final shouldClearDoctor = state.selectedDoctor != null &&
        state.selectedDoctor!.specialty != specialty;
    emit(
      state.copyWith(
        selectedSpecialty: specialty,
        clearDoctor: shouldClearDoctor,
      ),
    );
  }

  void selectHospital(String hospital) {
    emit(state.copyWith(selectedHospital: hospital));
  }

  void selectVisitType(String visitType) {
    emit(state.copyWith(selectedVisitType: visitType));
  }

  void selectDoctor(DoctorUiModel doctor) {
    emit(state.copyWith(selectedDoctor: doctor));
  }

  void selectDate(DateTime date) {
    emit(state.copyWith(selectedDate: date, clearTime: true));
  }

  void selectTime(String time) {
    emit(state.copyWith(selectedTime: time));
  }

  void resetBooking() {
    emit(const BookAppointmentState());
  }

  void searchDoctors(String query) {
    emit(state.copyWith(doctorSearchQuery: query));
  }

  List<DoctorUiModel> get visibleDoctors {
    final query = state.doctorSearchQuery.trim().toLowerCase();
    return doctors.where((doctor) {
      final matchesSpecialty = state.selectedSpecialty == null ||
          doctor.specialty == state.selectedSpecialty;
      final matchesSearch = query.isEmpty ||
          doctor.name.toLowerCase().contains(query) ||
          doctor.specialty.toLowerCase().contains(query) ||
          doctor.hospital.toLowerCase().contains(query);
      return matchesSpecialty && matchesSearch;
    }).toList(growable: false);
  }
}
