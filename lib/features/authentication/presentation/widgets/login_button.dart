import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/widgets/app_button.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return GestureDetector(
          onTapDown: state.isLoading ? null : (_) => _setPressed(true),
          onTapCancel: () => _setPressed(false),
          onTapUp: (_) => _setPressed(false),
          child: AnimatedScale(
            scale: _isPressed ? 0.98 : 1,
            duration: const Duration(milliseconds: 120),
            curve: Curves.easeOut,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.lg),
                boxShadow: AppShadows.soft,
              ),
              child: AppButton(
                text: 'تسجيل الدخول',
                icon: Icons.login_rounded,
                isLoading: state.isLoading,
                onPressed: state.isLoading ? null : widget.onPressed,
              ),
            ),
          ),
        );
      },
    );
  }

  void _setPressed(bool value) {
    if (_isPressed != value) {
      setState(() => _isPressed = value);
    }
  }
}
