import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppSettingsState extends Equatable {
  const AppSettingsState({
    this.locale = const Locale('ar'),
    this.themeMode = ThemeMode.light,
  });

  final Locale locale;
  final ThemeMode themeMode;

  bool get isArabic => locale.languageCode == 'ar';
  bool get isDarkMode => themeMode == ThemeMode.dark;
  TextDirection get textDirection =>
      isArabic ? TextDirection.rtl : TextDirection.ltr;

  AppSettingsState copyWith({
    Locale? locale,
    ThemeMode? themeMode,
  }) {
    return AppSettingsState(
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object?> get props => [locale, themeMode];
}
