class HealthSummaryModel {
  const HealthSummaryModel({
    required this.status,
    required this.lastVisit,
    required this.score,
    required this.upcomingAppointments,
    required this.activePrescriptions,
    required this.newResults,
  });

  final String status;
  final String lastVisit;
  final double score;
  final int upcomingAppointments;
  final int activePrescriptions;
  final int newResults;
}
