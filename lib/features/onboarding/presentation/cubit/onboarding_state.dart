import 'package:equatable/equatable.dart';

enum OnboardingStatus { active, completed }

class OnboardingState extends Equatable {
  const OnboardingState({
    this.currentIndex = 0,
    this.status = OnboardingStatus.active,
  });

  final int currentIndex;
  final OnboardingStatus status;

  bool get isLastPage => currentIndex == 2;

  OnboardingState copyWith({
    int? currentIndex,
    OnboardingStatus? status,
  }) {
    return OnboardingState(
      currentIndex: currentIndex ?? this.currentIndex,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [currentIndex, status];
}
