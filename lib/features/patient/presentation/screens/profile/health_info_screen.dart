import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_routes.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../cubit/profile_cubit.dart';
import '../../cubit/profile_state.dart';

class HealthInfoScreen extends StatelessWidget {
  const HealthInfoScreen({super.key});

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
        title: const Text('المعلومات الصحية'),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final items = [
            ('فصيلة الدم', state.bloodType, Icons.bloodtype_rounded),
            ('العمر', state.age, Icons.cake_rounded),
            ('الجنس', state.gender, Icons.wc_rounded),
            ('الطول', state.height, Icons.height_rounded),
            ('الوزن', state.weight, Icons.monitor_weight_rounded),
            ('الحساسية', state.allergies, Icons.warning_amber_rounded),
            (
              'الأمراض المزمنة',
              state.chronicDiseases,
              Icons.health_and_safety_rounded
            ),
          ];
          return ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              AppCard(
                child: Column(
                  children: items
                      .map(
                        (item) => ListTile(
                          leading: Icon(item.$3, color: AppColors.primary),
                          title: Text(item.$1),
                          subtitle: Text(item.$2),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              AppButton(
                text: 'تعديل المعلومات الصحية',
                icon: Icons.edit_rounded,
                onPressed: () => _showEditSheet(context, state),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showEditSheet(BuildContext context, ProfileState state) {
    final bloodController = TextEditingController(text: state.bloodType);
    final heightController = TextEditingController(text: state.height);
    final weightController = TextEditingController(text: state.weight);
    final allergiesController = TextEditingController(text: state.allergies);

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) => Padding(
        padding: EdgeInsets.only(
          left: AppSpacing.md,
          right: AppSpacing.md,
          top: AppSpacing.md,
          bottom: MediaQuery.viewInsetsOf(sheetContext).bottom + AppSpacing.md,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTextField(controller: bloodController, label: 'فصيلة الدم'),
              const SizedBox(height: AppSpacing.md),
              AppTextField(controller: heightController, label: 'الطول'),
              const SizedBox(height: AppSpacing.md),
              AppTextField(controller: weightController, label: 'الوزن'),
              const SizedBox(height: AppSpacing.md),
              AppTextField(controller: allergiesController, label: 'الحساسية'),
              const SizedBox(height: AppSpacing.lg),
              AppButton(
                text: 'حفظ',
                onPressed: () async {
                  await context.read<ProfileCubit>().saveHealthInfo(
                        bloodType: bloodController.text,
                        age: state.age,
                        gender: state.gender,
                        height: heightController.text,
                        weight: weightController.text,
                        allergies: allergiesController.text,
                        chronicDiseases: state.chronicDiseases,
                      );
                  if (!context.mounted) return;
                  sheetContext.pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('تم تحديث المعلومات الصحية'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
