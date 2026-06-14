import 'package:flutter/material.dart';

class RoleUiModel {
  const RoleUiModel({
    required this.id,
    required this.englishTitle,
    required this.arabicTitle,
    required this.description,
    required this.icon,
  });

  final String id;
  final String englishTitle;
  final String arabicTitle;
  final String description;
  final IconData icon;
}
