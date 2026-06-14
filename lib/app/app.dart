import 'package:flutter/material.dart';

import '../core/constants/app_strings.dart';
import '../core/theme/app_theme.dart';
import 'app_router.dart';

class DigitalHealthSystemApp extends StatelessWidget {
  const DigitalHealthSystemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appNameEn,
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
      locale: const Locale('ar'),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
