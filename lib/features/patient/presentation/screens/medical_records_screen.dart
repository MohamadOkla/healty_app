import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_card.dart';
import '../widgets/patient_bottom_navigation.dart';

class MedicalRecordsScreen extends StatelessWidget {
  const MedicalRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const records = [
      ('زيارة قلبية', 'د. أحمد خالد', '18 يونيو 2026'),
      ('مراجعة جلدية', 'د. رانيا يوسف', '7 يونيو 2026'),
      ('صورة أشعة', 'قسم العظمية', '28 مايو 2026'),
    ];

    return _PatientListScreen(
      title: 'السجل الطبي',
      selectedIndex: 0,
      children: records
          .map(
            (record) => _ListCard(
              icon: Icons.assignment_rounded,
              title: record.$1,
              subtitle: record.$2,
              trailing: record.$3,
              onTap: () => context.go(AppRoutes.patientMedicalRecordDetails),
            ),
          )
          .toList(),
    );
  }
}

class PrescriptionsScreen extends StatelessWidget {
  const PrescriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const prescriptions = [
      ('Atorvastatin 20mg', 'مرة يومياً مساءً', 'نشطة'),
      ('Vitamin D', 'كبسولة أسبوعياً', 'نشطة'),
      ('Aspirin 81mg', 'بعد الطعام', 'سابقة'),
    ];

    return _PatientListScreen(
      title: 'الوصفات',
      selectedIndex: 0,
      children: prescriptions
          .map(
            (prescription) => _ListCard(
              icon: Icons.medication_rounded,
              title: prescription.$1,
              subtitle: prescription.$2,
              trailing: prescription.$3,
              onTap: () => context.go(AppRoutes.patientPrescriptionDetails),
            ),
          )
          .toList(),
    );
  }
}

class LaboratoryResultsScreen extends StatelessWidget {
  const LaboratoryResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const results = [
      ('CBC', 'طبيعي', 'اليوم'),
      ('HbA1c', 'طبيعي', 'أمس'),
      ('Vitamin D', 'منخفض', 'قبل أسبوع'),
    ];

    return _PatientListScreen(
      title: 'التحاليل',
      selectedIndex: 0,
      children: results
          .map(
            (result) => _ListCard(
              icon: Icons.science_rounded,
              title: result.$1,
              subtitle: result.$2,
              trailing: result.$3,
              onTap: () => context.go(AppRoutes.patientLaboratoryDetails),
            ),
          )
          .toList(),
    );
  }
}

class _PatientListScreen extends StatelessWidget {
  const _PatientListScreen({
    required this.title,
    required this.children,
    required this.selectedIndex,
  });

  final String title;
  final List<Widget> children;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'رجوع',
          onPressed: () => context.go(AppRoutes.patientDashboard),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text(title, style: AppTextStyles.headlineLarge),
          const SizedBox(height: AppSpacing.md),
          ...children.map(
            (child) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: child,
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          PatientBottomNavigation(selectedIndex: selectedIndex),
    );
  }
}

class _ListCard extends StatelessWidget {
  const _ListCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primary.withValues(alpha: 0.10),
            child: Icon(icon, color: AppColors.primary),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.titleMedium),
                Text(subtitle, style: AppTextStyles.bodyMedium),
              ],
            ),
          ),
          Text(trailing, style: AppTextStyles.bodyMedium),
          const Icon(Icons.chevron_left_rounded),
        ],
      ),
    );
  }
}
