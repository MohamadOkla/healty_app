import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_text_field.dart';
import 'password_strength_indicator.dart';

class RegisterCredentialsForm extends StatelessWidget {
  const RegisterCredentialsForm({
    super.key,
    required this.password,
    required this.onPasswordChanged,
  });

  final String password;
  final ValueChanged<String> onPasswordChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          label: 'كلمة المرور',
          prefixIcon:
              const Icon(Icons.lock_outline_rounded, color: AppColors.primary),
          obscureText: true,
          onChanged: onPasswordChanged,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: AppSpacing.sm),
        PasswordStrengthIndicator(password: password),
        const SizedBox(height: AppSpacing.md),
        const AppTextField(
          label: 'تأكيد كلمة المرور',
          prefixIcon:
              Icon(Icons.verified_user_outlined, color: AppColors.primary),
          obscureText: true,
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }
}
