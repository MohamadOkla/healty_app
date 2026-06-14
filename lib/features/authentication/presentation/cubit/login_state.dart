import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  const LoginState({
    this.isPasswordVisible = false,
    this.isLoading = false,
  });

  final bool isPasswordVisible;
  final bool isLoading;

  LoginState copyWith({
    bool? isPasswordVisible,
    bool? isLoading,
  }) {
    return LoginState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [isPasswordVisible, isLoading];
}
