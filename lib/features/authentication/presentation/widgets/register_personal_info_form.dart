import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_text_field.dart';

class RegisterPersonalInfoForm extends StatelessWidget {
  const RegisterPersonalInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AppTextField(
          label: 'الاسم الكامل',
          prefixIcon:
              Icon(Icons.person_outline_rounded, color: AppColors.primary),
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: AppSpacing.md),
        AppTextField(
          label: 'رقم الهاتف',
          prefixIcon: Icon(Icons.phone_outlined, color: AppColors.primary),
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: AppSpacing.md),
        AppTextField(
          label: 'البريد الإلكتروني',
          prefixIcon:
              Icon(Icons.mail_outline_rounded, color: AppColors.primary),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        ),
      ],
    );
  }
}
