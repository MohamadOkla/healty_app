import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_spacing.dart';
import '../models/quick_action_model.dart';
import 'quick_action_card.dart';

class QuickActionsGrid extends StatelessWidget {
  const QuickActionsGrid({super.key, required this.actions});

  final List<QuickActionModel> actions;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: actions.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppSpacing.md,
        crossAxisSpacing: AppSpacing.md,
        childAspectRatio: 1.35,
      ),
      itemBuilder: (context, index) {
        final action = actions[index];
        return QuickActionCard(
          action: action,
          onTap: () => context.go(action.route),
        );
      },
    );
  }
}
