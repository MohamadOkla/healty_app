import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

enum AppointmentStatus {
  confirmed('مؤكد', AppColors.success),
  completed('مكتمل', AppColors.primary),
  canceled('ملغى', AppColors.error);

  const AppointmentStatus(this.label, this.color);

  final String label;
  final Color color;
}
