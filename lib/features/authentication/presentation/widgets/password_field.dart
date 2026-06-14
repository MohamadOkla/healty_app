import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.isPasswordVisible != current.isPasswordVisible,
      builder: (context, state) {
        return AppTextField(
          label: 'كلمة المرور',
          obscureText: !state.isPasswordVisible,
          textInputAction: TextInputAction.done,
          prefixIcon: const Icon(
            Icons.lock_outline_rounded,
            color: AppColors.primary,
          ),
          suffixIcon: IconButton(
            tooltip: state.isPasswordVisible
                ? 'إخفاء كلمة المرور'
                : 'إظهار كلمة المرور',
            onPressed: context.read<LoginCubit>().togglePasswordVisibility,
            icon: Icon(
              state.isPasswordVisible
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: AppColors.textGrey,
            ),
          ),
          validator: (value) {
            if ((value ?? '').isEmpty) {
              return 'يرجى إدخال كلمة المرور';
            }
            if ((value ?? '').length < 6) {
              return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
            }
            return null;
          },
        );
      },
    );
  }
}
