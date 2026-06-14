import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_loading_indicator.dart';
import '../animations/splash_animation_wrapper.dart';
import '../cubit/splash_cubit.dart';
import '../cubit/splash_state.dart';
import '../widgets/splash_background.dart';
import '../widgets/splash_logo.dart';
import '../widgets/splash_title_section.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..start(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashCompleted) {
            context.go(state.targetRoute);
          }
        },
        child: const SplashBackground(
          child: SplashAnimationWrapper(
            child: _SplashContent(),
          ),
        ),
      ),
    );
  }
}

class _SplashContent extends StatelessWidget {
  const _SplashContent();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          Spacer(),
          SplashLogo(),
          SizedBox(height: 28),
          SplashTitleSection(),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 32),
            child: _SplashLoadingSection(),
          ),
        ],
      ),
    );
  }
}

class _SplashLoadingSection extends StatelessWidget {
  const _SplashLoadingSection();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 36,
      child: Center(
        child: AppLoadingIndicator(),
      ),
    );
  }
}
