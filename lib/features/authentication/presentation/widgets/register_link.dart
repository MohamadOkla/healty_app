import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_text_styles.dart';

class RegisterLink extends StatelessWidget {
  const RegisterLink({super.key, this.selectedRole});

  final String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text('ليس لديك حساب؟', style: AppTextStyles.bodyMedium),
        TextButton(
          onPressed: () {
            context.go(
              Uri(
                path: AppRoutes.register,
                queryParameters: {
                  if (selectedRole != null) 'role': selectedRole!,
                },
              ).toString(),
            );
          },
          child: Text(
            'إنشاء حساب',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
