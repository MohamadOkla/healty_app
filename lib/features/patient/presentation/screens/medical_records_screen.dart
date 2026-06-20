import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_app_bar.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_card.dart';
import '../widgets/patient_bottom_navigation.dart';

class MedicalRecordsScreen extends StatelessWidget {
  const MedicalRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const records = [
      _MedicalRecordItem(
        title: 'زيارة قلبية',
        doctor: 'د. أحمد خالد',
        specialty: 'قلبية',
        diagnosis: 'متابعة ضغط الدم وحالة مستقرة',
        hospital: 'مشفى دمشق الجامعي',
        date: '18 يونيو 2026',
      ),
      _MedicalRecordItem(
        title: 'مراجعة جلدية',
        doctor: 'د. رانيا يوسف',
        specialty: 'جلدية',
        diagnosis: 'تحسس جلدي بسيط',
        hospital: 'مشفى المواساة',
        date: '7 يونيو 2026',
      ),
      _MedicalRecordItem(
        title: 'صورة أشعة',
        doctor: 'قسم العظمية',
        specialty: 'عظمية',
        diagnosis: 'مراجعة صورة الأشعة',
        hospital: 'مشفى الأسد الجامعي',
        date: '28 مايو 2026',
      ),
    ];

    return _PatientListScreen(
      title: 'السجل الطبي',
      selectedIndex: 0,
      children: records
          .map(
            (record) => _MedicalRecordCard(
              record: record,
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
      _PrescriptionItem(
        number: 'RX-2026-184',
        doctor: 'د. أحمد خالد',
        issuedAt: '18 يونيو 2026',
        status: 'نشطة',
        medicinesCount: 3,
      ),
      _PrescriptionItem(
        number: 'RX-2026-155',
        doctor: 'د. رانيا يوسف',
        issuedAt: '7 يونيو 2026',
        status: 'نشطة',
        medicinesCount: 1,
      ),
      _PrescriptionItem(
        number: 'RX-2026-101',
        doctor: 'د. سامر علي',
        issuedAt: '28 مايو 2026',
        status: 'منتهية',
        medicinesCount: 2,
      ),
    ];

    return _PatientListScreen(
      title: 'الوصفات',
      selectedIndex: 0,
      children: prescriptions
          .map(
            (prescription) => _PrescriptionCard(
              prescription: prescription,
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
      _LabResultItem(
        name: 'CBC',
        date: 'اليوم',
        status: 'طبيعي',
        place: 'مخبر مشفى دمشق الجامعي',
        color: AppColors.success,
      ),
      _LabResultItem(
        name: 'HbA1c',
        date: 'أمس',
        status: 'طبيعي',
        place: 'مخبر مشفى المواساة',
        color: AppColors.success,
      ),
      _LabResultItem(
        name: 'Vitamin D',
        date: 'قبل أسبوع',
        status: 'منخفض',
        place: 'مخبر مشفى الأسد الجامعي',
        color: AppColors.warning,
      ),
    ];

    return _PatientListScreen(
      title: 'التحاليل',
      selectedIndex: 0,
      children: results
          .map(
            (result) => _LabResultCard(
              result: result,
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
      appBar: AppAppBar(
        title: title,
        leading: IconButton(
          tooltip: 'رجوع',
          onPressed: () => context.go(AppRoutes.patientDashboard),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text(
            title,
            style: AppTextStyles.headlineLarge.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'تابع بياناتك الطبية بتفاصيل واضحة ومنظمة.',
            style: AppTextStyles.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.lg),
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

class _MedicalRecordCard extends StatelessWidget {
  const _MedicalRecordCard({required this.record, required this.onTap});

  final _MedicalRecordItem record;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardHeader(
            icon: Icons.assignment_rounded,
            title: record.title,
            trailing: record.date,
          ),
          const SizedBox(height: AppSpacing.md),
          _InfoLine(label: 'الطبيب', value: record.doctor),
          _InfoLine(label: 'الاختصاص', value: record.specialty),
          _InfoLine(label: 'التشخيص', value: record.diagnosis),
          _InfoLine(label: 'المشفى', value: record.hospital),
          const SizedBox(height: AppSpacing.md),
          AppButton(
            text: 'عرض التفاصيل',
            icon: Icons.visibility_rounded,
            onPressed: onTap,
          ),
        ],
      ),
    );
  }
}

class _PrescriptionCard extends StatelessWidget {
  const _PrescriptionCard({required this.prescription, required this.onTap});

  final _PrescriptionItem prescription;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final statusColor =
        prescription.status == 'نشطة' ? AppColors.success : AppColors.textGrey;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardHeader(
            icon: Icons.medication_rounded,
            title: prescription.number,
            trailing: prescription.issuedAt,
          ),
          const SizedBox(height: AppSpacing.md),
          _InfoLine(label: 'الطبيب', value: prescription.doctor),
          _InfoLine(
              label: 'عدد الأدوية', value: '${prescription.medicinesCount}'),
          const SizedBox(height: AppSpacing.sm),
          _StatusChip(label: prescription.status, color: statusColor),
          const SizedBox(height: AppSpacing.md),
          AppButton(
            text: 'عرض التفاصيل',
            icon: Icons.visibility_rounded,
            onPressed: onTap,
          ),
        ],
      ),
    );
  }
}

class _LabResultCard extends StatelessWidget {
  const _LabResultCard({required this.result, required this.onTap});

  final _LabResultItem result;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardHeader(
            icon: Icons.science_rounded,
            title: result.name,
            trailing: result.date,
          ),
          const SizedBox(height: AppSpacing.md),
          _InfoLine(label: 'المخبر', value: result.place),
          const SizedBox(height: AppSpacing.sm),
          _StatusChip(label: result.status, color: result.color),
          const SizedBox(height: AppSpacing.md),
          AppButton(
            text: 'عرض التفاصيل',
            icon: Icons.visibility_rounded,
            onPressed: onTap,
          ),
        ],
      ),
    );
  }
}

class _CardHeader extends StatelessWidget {
  const _CardHeader({
    required this.icon,
    required this.title,
    required this.trailing,
  });

  final IconData icon;
  final String title;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.primary.withValues(alpha: 0.10),
          child: Icon(icon, color: AppColors.primary),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Text(title, style: AppTextStyles.titleMedium),
        ),
        Text(trailing, style: AppTextStyles.bodyMedium),
      ],
    );
  }
}

class _InfoLine extends StatelessWidget {
  const _InfoLine({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 88,
            child: Text(label, style: AppTextStyles.bodyMedium),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textDark,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
      child: Text(
        label,
        style: AppTextStyles.bodyMedium.copyWith(color: color),
      ),
    );
  }
}

class _MedicalRecordItem {
  const _MedicalRecordItem({
    required this.title,
    required this.doctor,
    required this.specialty,
    required this.diagnosis,
    required this.hospital,
    required this.date,
  });

  final String title;
  final String doctor;
  final String specialty;
  final String diagnosis;
  final String hospital;
  final String date;
}

class _PrescriptionItem {
  const _PrescriptionItem({
    required this.number,
    required this.doctor,
    required this.issuedAt,
    required this.status,
    required this.medicinesCount,
  });

  final String number;
  final String doctor;
  final String issuedAt;
  final String status;
  final int medicinesCount;
}

class _LabResultItem {
  const _LabResultItem({
    required this.name,
    required this.date,
    required this.status,
    required this.place,
    required this.color,
  });

  final String name;
  final String date;
  final String status;
  final String place;
  final Color color;
}
