import 'package:flutter_bloc/flutter_bloc.dart';

import 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(const ForgotPasswordState());

  Future<void> sendCode() async {
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
