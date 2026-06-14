import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  void nextStep() {
    if (!state.isLastStep) {
      emit(state.copyWith(currentStep: state.currentStep + 1));
    }
  }

  void previousStep() {
    if (!state.isFirstStep) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  Future<void> submit() async {
    emit(state.copyWith(isLoading: true));
    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (!isClosed) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
