import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> submit() async {
    if (state.isLoading) {
      return;
    }

    emit(state.copyWith(isLoading: true));
    await Future<void>.delayed(const Duration(milliseconds: 700));
    if (!isClosed) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
