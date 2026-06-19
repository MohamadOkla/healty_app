import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/services/pdf_mock_service.dart';
import '../../../../core/services/share_mock_service.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_app_bar.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_scaffold.dart';

class PrescriptionDetailsScreen extends StatelessWidget {
  const PrescriptionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      padding: EdgeInsets.zero,
      appBar: AppAppBar(
        title: 'تفاصيل الوصفة',
        leading: IconButton(
          tooltip: 'رجوع',
          onPressed: () {
            if (context.canPop()) {
              context.pop();
              return;
            }
            context.go(AppRoutes.patientPrescriptions);
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          const _PrescriptionHeader(),
          const SizedBox(height: AppSpacing.md),
          const _MedicineListCard(),
          const SizedBox(height: AppSpacing.md),
          const _PrescriptionNotesCard(),
          const SizedBox(height: AppSpacing.xl),
          AppButton(
            text: 'تحميل الوصفة',
            icon: Icons.download_rounded,
            onPressed: () => PdfMockService.createPdf(
              context: context,
              fileName: 'prescription.pdf',
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            text: 'مشاركة الوصفة',
            icon: Icons.share_rounded,
            isOutlined: true,
            onPressed: () => ShareMockService.showShareSheet(
              context: context,
              title: 'مشاركة الوصفة الطبية',
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            text: 'تذكير الدواء',
            icon: Icons.notifications_active_rounded,
            isOutlined: true,
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('تم تفعيل تذكير الدواء بنجاح')),
            ),
          ),
        ],
      ),
    );
  }
}

class _PrescriptionHeader extends StatelessWidget {
  const _PrescriptionHeader();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.medication_rounded, color: AppColors.primary),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  'الوصفة رقم RX-2026-184',
                  style: AppTextStyles.titleMedium
                      .copyWith(color: AppColors.primary),
                ),
              ),
              const _StatusChip(label: 'نشطة', color: AppColors.success),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          const _InfoRow(label: 'اسم الطبيب', value: 'د. أحمد خالد'),
          const _InfoRow(label: 'تاريخ الإصدار', value: '18 يونيو 2026'),
          const _InfoRow(label: 'تاريخ انتهاء الوصفة', value: '18 يوليو 2026'),
        ],
      ),
    );
  }
}

class _MedicineListCard extends StatelessWidget {
  const _MedicineListCard();

  @override
  Widget build(BuildContext context) {
    const medicines = [
      (
        'Atorvastatin 20mg',
        '20mg',
        'مرة يومياً',
        '30 يوم',
        'يؤخذ مساءً بعد الطعام'
      ),
      ('Aspirin 81mg', '81mg', 'مرة يومياً', '30 يوم', 'يؤخذ بعد الإفطار'),
      (
        'Vitamin D',
        '50000 IU',
        'مرة أسبوعياً',
        '8 أسابيع',
        'يؤخذ بعد وجبة رئيسية'
      ),
    ];

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('قائمة الأدوية', style: AppTextStyles.titleMedium),
          const SizedBox(height: AppSpacing.md),
          ...medicines.map(
            (medicine) => _MedicineTile(
              name: medicine.$1,
              dose: medicine.$2,
              frequency: medicine.$3,
              duration: medicine.$4,
              instructions: medicine.$5,
            ),
          ),
        ],
      ),
    );
  }
}

class _PrescriptionNotesCard extends StatelessWidget {
  const _PrescriptionNotesCard();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _SectionText(
            title: 'ملاحظات الطبيب',
            value:
                'الالتزام بالجرعات ومراجعة الطبيب عند ظهور أي أعراض غير معتادة.',
          ),
          SizedBox(height: AppSpacing.md),
          _SectionText(
            title: 'التحذيرات',
            value:
                'تجنب إيقاف الدواء دون استشارة الطبيب. أخبر الطبيب في حال وجود حساسية دوائية.',
          ),
        ],
      ),
    );
  }
}

class _MedicineTile extends StatelessWidget {
  const _MedicineTile({
    required this.name,
    required this.dose,
    required this.frequency,
    required this.duration,
    required this.instructions,
  });

  final String name;
  final String dose;
  final String frequency;
  final String duration;
  final String instructions;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: AppTextStyles.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          _InfoRow(label: 'الجرعة', value: dose),
          _InfoRow(label: 'عدد المرات', value: frequency),
          _InfoRow(label: 'مدة الاستخدام', value: duration),
          _InfoRow(label: 'تعليمات الاستخدام', value: instructions),
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
          horizontal: AppSpacing.md, vertical: AppSpacing.xs),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
      child:
          Text(label, style: AppTextStyles.bodyMedium.copyWith(color: color)),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

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
              width: 110, child: Text(label, style: AppTextStyles.bodyMedium)),
          Expanded(
            child: Text(
              value,
              style:
                  AppTextStyles.bodyMedium.copyWith(color: AppColors.textDark),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionText extends StatelessWidget {
  const _SectionText({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style:
                AppTextStyles.titleMedium.copyWith(color: AppColors.primary)),
        const SizedBox(height: AppSpacing.sm),
        Text(value, style: AppTextStyles.bodyMedium),
      ],
    );
  }
}
