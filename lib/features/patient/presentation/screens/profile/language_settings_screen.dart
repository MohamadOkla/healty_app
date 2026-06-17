import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_routes.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../cubit/profile_cubit.dart';
import '../../cubit/profile_state.dart';

class LanguageSettingsScreen extends StatelessWidget {
  const LanguageSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'رجوع',
          onPressed: () => context.go(AppRoutes.patientProfile),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: const Text('تغيير اللغة'),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              RadioListTile<String>(
                value: 'العربية',
                groupValue: state.language,
                onChanged: (value) => _changeLanguage(context, value),
                title: const Text('العربية'),
              ),
              RadioListTile<String>(
                value: 'English',
                groupValue: state.language,
                onChanged: (value) => _changeLanguage(context, value),
                title: const Text('English'),
              ),
            ],
          );
        },
      ),
    );
  }

  void _changeLanguage(BuildContext context, String? value) {
    if (value == null) return;
    context.read<ProfileCubit>().changeLanguage(value);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم تغيير اللغة')),
    );
  }
}
