import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_routes.dart';
import '../cubit/onboarding_cubit.dart';
import '../cubit/onboarding_state.dart';
import '../widgets/onboarding_background.dart';
import '../widgets/onboarding_content.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: BlocListener<OnboardingCubit, OnboardingState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == OnboardingStatus.completed) {
            context.go(AppRoutes.roleSelection);
          }
        },
        child: const OnboardingBackground(
          child: OnboardingContent(),
        ),
      ),
    );
  }
}
