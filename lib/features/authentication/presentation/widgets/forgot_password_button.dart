import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_text_styles.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(
        onPressed: () => context.go(AppRoutes.forgotPassword),
        child: Text(
          'نسيت كلمة المرور؟',
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.primary),
        ),
      ),
    );
  }
}
