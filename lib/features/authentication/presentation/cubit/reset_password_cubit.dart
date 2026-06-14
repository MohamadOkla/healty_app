import 'package:flutter_bloc/flutter_bloc.dart';

import 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(const ResetPasswordState());

  void passwordChanged(String password) {
    emit(state.copyWith(password: password));
  }

  Future<void> submit() async {
    if (state.isLoading) {
      return;
    }

    emit(state.copyWith(isLoading: true));
    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (!isClosed) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
