import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.currentStep = 0,
    this.isLoading = false,
  });

  final int currentStep;
  final bool isLoading;

  bool get isFirstStep => currentStep == 0;
  bool get isLastStep => currentStep == 2;

  RegisterState copyWith({
    int? currentStep,
    bool? isLoading,
  }) {
    return RegisterState(
      currentStep: currentStep ?? this.currentStep,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [currentStep, isLoading];
}
