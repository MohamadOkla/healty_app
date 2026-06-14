import 'package:flutter/material.dart';

class DoctorUiModel {
  const DoctorUiModel({
    required this.id,
    required this.name,
    required this.specialty,
    required this.hospital,
    required this.rating,
    required this.experience,
    required this.earliestAvailable,
    required this.icon,
  });

  final String id;
  final String name;
  final String specialty;
  final String hospital;
  final double rating;
  final String experience;
  final String earliestAvailable;
  final IconData icon;
}
