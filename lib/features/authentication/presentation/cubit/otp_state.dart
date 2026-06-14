import 'package:equatable/equatable.dart';

class OtpState extends Equatable {
  const OtpState({
    this.code = '',
    this.remainingSeconds = 30,
    this.isVerifying = false,
  });

  final String code;
  final int remainingSeconds;
  final bool isVerifying;

  bool get isComplete => code.length == 6;
  bool get canResend => remainingSeconds == 0;

  OtpState copyWith({
    String? code,
    int? remainingSeconds,
    bool? isVerifying,
  }) {
    return OtpState(
      code: code ?? this.code,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      isVerifying: isVerifying ?? this.isVerifying,
    );
  }

  @override
  List<Object?> get props => [code, remainingSeconds, isVerifying];
}
