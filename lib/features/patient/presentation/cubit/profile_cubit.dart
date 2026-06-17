import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  Future<void> saveProfile({
    required String fullName,
    required String phone,
    required String email,
    required String province,
    required String city,
    required String address,
  }) async {
    emit(state.copyWith(isLoading: true));
    await Future<void>.delayed(const Duration(milliseconds: 450));
    if (isClosed) return;
    emit(
      state.copyWith(
        fullName: fullName,
        phone: phone,
        email: email,
        province: province,
        city: city,
        address: address,
        isLoading: false,
      ),
    );
  }

  Future<void> saveHealthInfo({
    required String bloodType,
    required String age,
    required String gender,
    required String height,
    required String weight,
    required String allergies,
    required String chronicDiseases,
  }) async {
    emit(state.copyWith(isLoading: true));
    await Future<void>.delayed(const Duration(milliseconds: 350));
    if (isClosed) return;
    emit(
      state.copyWith(
        bloodType: bloodType,
        age: age,
        gender: gender,
        height: height,
        weight: weight,
        allergies: allergies,
        chronicDiseases: chronicDiseases,
        isLoading: false,
      ),
    );
  }

  Future<void> updatePassword() async {
    emit(state.copyWith(isLoading: true));
    await Future<void>.delayed(const Duration(milliseconds: 450));
    if (!isClosed) {
      emit(state.copyWith(isLoading: false));
    }
  }

  void toggleAppointmentNotifications(bool value) {
    emit(state.copyWith(appointmentNotifications: value));
  }

  void toggleLaboratoryNotifications(bool value) {
    emit(state.copyWith(laboratoryNotifications: value));
  }

  void togglePrescriptionNotifications(bool value) {
    emit(state.copyWith(prescriptionNotifications: value));
  }

  void toggleGeneralNotifications(bool value) {
    emit(state.copyWith(generalNotifications: value));
  }

  void toggleAppointmentReminder(bool value) {
    emit(state.copyWith(appointmentReminder: value));
  }

  void changeLanguage(String language) {
    emit(state.copyWith(language: language));
  }

  void toggleCurrentPasswordVisibility() {
    emit(
      state.copyWith(
        isCurrentPasswordVisible: !state.isCurrentPasswordVisible,
      ),
    );
  }

  void toggleNewPasswordVisibility() {
    emit(state.copyWith(isNewPasswordVisible: !state.isNewPasswordVisible));
  }

  void toggleConfirmPasswordVisibility() {
    emit(
      state.copyWith(
        isConfirmPasswordVisible: !state.isConfirmPasswordVisible,
      ),
    );
  }
}
