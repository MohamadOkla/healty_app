import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_spacing.dart';
import '../cubit/role_selection_cubit.dart';
import '../cubit/role_selection_state.dart';
import '../widgets/role_card.dart';
import '../widgets/role_continue_button.dart';
import '../widgets/role_selection_background.dart';
import '../widgets/role_selection_header.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RoleSelectionCubit(),
      child: const RoleSelectionBackground(
        child: _RoleSelectionContent(),
      ),
    );
  }
}

class _RoleSelectionContent extends StatelessWidget {
  const _RoleSelectionContent();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth =
              constraints.maxWidth >= 700 ? 560.0 : double.infinity;

          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  children: [
                    const RoleSelectionHeader(),
                    const SizedBox(height: AppSpacing.lg),
                    Expanded(
                      child:
                          BlocBuilder<RoleSelectionCubit, RoleSelectionState>(
                        builder: (context, state) {
                          return ListView.separated(
                            itemCount: RoleSelectionCubit.roles.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: AppSpacing.md),
                            itemBuilder: (context, index) {
                              final role = RoleSelectionCubit.roles[index];
                              return RoleCard(
                                role: role,
                                isSelected: state.selectedRole?.id == role.id,
                                onTap: () => context
                                    .read<RoleSelectionCubit>()
                                    .selectRole(role),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    const RoleContinueButton(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
