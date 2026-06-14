import 'package:equatable/equatable.dart';

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({this.isLoading = false});

  final bool isLoading;

  ForgotPasswordState copyWith({bool? isLoading}) {
    return ForgotPasswordState(isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object?> get props => [isLoading];
}
