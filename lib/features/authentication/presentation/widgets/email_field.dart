import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/validators.dart';
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
      inputFormatters: Validators.emailInputFormatters,
      prefixIcon: const Icon(
        Icons.mail_outline_rounded,
        color: AppColors.primary,
      ),
      validator: Validators.validateEmail,
    );
  }
}
