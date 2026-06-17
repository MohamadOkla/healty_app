import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';
import 'password_strength_indicator.dart';

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
          inputFormatters: Validators.passwordInputFormatters,
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
          validator: Validators.validatePassword,
        );
      },
    );
  }
}
