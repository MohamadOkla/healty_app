class TimeSlotUiModel {
  const TimeSlotUiModel({
    required this.label,
    required this.period,
    this.isAvailable = true,
  });

  final String label;
  final String period;
  final bool isAvailable;
}
