import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'app_text_styles.dart';

abstract final class AppTheme {
  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.white,
    );

    return ThemeData(
      useMaterial3: true,
      splashFactory: NoSplash.splashFactory,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: AppTextStyles.textTheme,
      iconTheme: const IconThemeData(color: AppColors.textDark),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.white),
        actionsIconTheme: IconThemeData(color: AppColors.white),
      ),
      cardTheme: CardThemeData(
        color: AppColors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        indicatorColor: AppColors.primary.withValues(alpha: 0.12),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          return IconThemeData(
            color: states.contains(WidgetState.selected)
                ? AppColors.primary
                : AppColors.textGrey,
          );
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          return AppTextStyles.bodyMedium.copyWith(
            color: states.contains(WidgetState.selected)
                ? AppColors.primary
                : AppColors.textGrey,
            fontSize: 12,
            fontWeight: states.contains(WidgetState.selected)
                ? FontWeight.w700
                : FontWeight.w500,
          );
        }),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: _noFeedbackButtonStyle,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: _noFeedbackButtonStyle,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: _noFeedbackButtonStyle,
      ),
      textButtonTheme: TextButtonThemeData(
        style: _noFeedbackButtonStyle,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
          splashFactory: NoSplash.splashFactory,
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
      ),
    );
  }

  static final ButtonStyle _noFeedbackButtonStyle = ButtonStyle(
    overlayColor: WidgetStateProperty.all(Colors.transparent),
    shadowColor: WidgetStateProperty.all(Colors.transparent),
    surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
    splashFactory: NoSplash.splashFactory,
    elevation: WidgetStateProperty.all(0),
  );
}
