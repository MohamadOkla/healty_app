import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../widgets/auth_back_app_bar.dart';
import '../widgets/auth_success_card.dart';
import '../widgets/login_background.dart';

class AccountCreatedScreen extends StatelessWidget {
  const AccountCreatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginBackground(
      child: SafeArea(
        child: Column(
          children: [
            AuthBackAppBar(
              title: 'اكتمل التسجيل',
              onBackPressed: () =>
                  context.go('${AppRoutes.login}?role=patient'),
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: AuthSuccessCard(
                    title: 'تم إنشاء الحساب بنجاح',
                    message:
                        'يمكنك الآن تسجيل الدخول والوصول إلى خدماتك الطبية.',
                    buttonText: 'الانتقال إلى تسجيل الدخول',
                    onPressed: () =>
                        context.go('${AppRoutes.login}?role=patient'),
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
