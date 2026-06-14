import 'package:equatable/equatable.dart';

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object?> get props => [];
}

final class SplashInitial extends SplashState {
  const SplashInitial();
}

final class SplashCompleted extends SplashState {
  const SplashCompleted(this.targetRoute);

  final String targetRoute;

  @override
  List<Object?> get props => [targetRoute];
}
