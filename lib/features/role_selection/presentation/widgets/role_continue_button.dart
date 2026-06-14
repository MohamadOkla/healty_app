import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_routes.dart';
import '../../../../core/widgets/app_button.dart';
import '../cubit/role_selection_cubit.dart';
import '../cubit/role_selection_state.dart';

class RoleContinueButton extends StatelessWidget {
  const RoleContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoleSelectionCubit, RoleSelectionState>(
      builder: (context, state) {
        return AppButton(
          text: 'متابعة',
          icon: Icons.arrow_back_rounded,
          onPressed: state.canContinue
              ? () {
                  final role = state.selectedRole!;
                  context.go(
                    Uri(
                      path: AppRoutes.login,
                      queryParameters: {'role': role.id},
                    ).toString(),
                  );
                }
              : null,
        );
      },
    );
  }
}
