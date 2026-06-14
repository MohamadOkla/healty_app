import 'package:equatable/equatable.dart';

class ResetPasswordState extends Equatable {
  const ResetPasswordState({
    this.password = '',
    this.isLoading = false,
  });

  final String password;
  final bool isLoading;

  int get strength {
    var score = 0;
    if (password.length >= 8) score++;
    if (RegExp(r'[A-Z]').hasMatch(password)) score++;
    if (RegExp(r'[0-9]').hasMatch(password)) score++;
    if (RegExp(r'[^A-Za-z0-9]').hasMatch(password)) score++;
    return score;
  }

  ResetPasswordState copyWith({
    String? password,
    bool? isLoading,
  }) {
    return ResetPasswordState(
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [password, isLoading];
}
