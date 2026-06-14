import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_text_field.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      label: 'البريد الإلكتروني',
      hint: 'name@example.com',
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      prefixIcon: const Icon(
        Icons.mail_outline_rounded,
        color: AppColors.primary,
      ),
      validator: (value) {
        final email = value?.trim() ?? '';
        if (email.isEmpty) {
          return 'يرجى إدخال البريد الإلكتروني';
        }
        if (!email.contains('@') || !email.contains('.')) {
          return 'يرجى إدخال بريد إلكتروني صحيح';
        }
        return null;
      },
    );
  }
}
