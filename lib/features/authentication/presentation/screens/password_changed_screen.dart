import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../widgets/auth_back_app_bar.dart';
import '../widgets/auth_success_card.dart';
import '../widgets/login_background.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginBackground(
      child: SafeArea(
        child: Column(
          children: [
            AuthBackAppBar(
              title: 'تم التحديث',
              onBackPressed: () => context.go(AppRoutes.login),
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: AuthSuccessCard(
                    title: 'تم تحديث كلمة المرور',
                    message: 'استخدم كلمة المرور الجديدة لتسجيل الدخول بأمان.',
                    buttonText: 'تسجيل الدخول',
                    onPressed: () => context.go(AppRoutes.login),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
