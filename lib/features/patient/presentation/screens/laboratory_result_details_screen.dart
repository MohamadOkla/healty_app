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

class LaboratoryResultDetailsScreen extends StatelessWidget {
  const LaboratoryResultDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      padding: EdgeInsets.zero,
      appBar: AppAppBar(
        title: 'تفاصيل نتيجة التحليل',
        leading: IconButton(
          tooltip: 'رجوع',
          onPressed: () {
            if (context.canPop()) {
              context.pop();
              return;
            }
            context.go(AppRoutes.patientLaboratory);
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          const _ResultHeaderCard(),
          const SizedBox(height: AppSpacing.md),
          const _ResultTableCard(),
          const SizedBox(height: AppSpacing.md),
          const _InterpretationCard(),
          const SizedBox(height: AppSpacing.xl),
          AppButton(
            text: 'تحميل PDF',
            icon: Icons.picture_as_pdf_rounded,
            onPressed: () => PdfMockService.createPdf(
              context: context,
              fileName: 'lab_result.pdf',
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            text: 'مشاركة النتيجة',
            icon: Icons.share_rounded,
            isOutlined: true,
            onPressed: () => ShareMockService.showShareSheet(
              context: context,
              title: 'مشاركة نتيجة التحليل',
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            text: 'طلب استشارة',
            icon: Icons.medical_services_rounded,
            isOutlined: true,
            onPressed: () => context.go(AppRoutes.patientRequestConsultation),
          ),
        ],
      ),
    );
  }
}

class _ResultHeaderCard extends StatelessWidget {
  const _ResultHeaderCard();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _TitleRow(),
          SizedBox(height: AppSpacing.md),
          _InfoRow(label: 'اسم التحليل', value: 'CBC + Vitamin D + HbA1c'),
          _InfoRow(label: 'تاريخ التحليل', value: '19 يونيو 2026'),
          _InfoRow(label: 'المخبر أو المشفى', value: 'مخبر مشفى دمشق الجامعي'),
          _InfoRow(label: 'حالة النتيجة', value: 'مكتملة'),
          _InfoRow(
            label: 'ملخص النتيجة',
            value: 'معظم القيم ضمن الطبيعي مع انخفاض بسيط في Vitamin D.',
          ),
        ],
      ),
    );
  }
}

class _TitleRow extends StatelessWidget {
  const _TitleRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.science_rounded, color: AppColors.primary),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(
            'نتيجة التحليل',
            style: AppTextStyles.titleMedium.copyWith(color: AppColors.primary),
          ),
        ),
        const _StatusChip(label: 'طبيعي غالباً', color: AppColors.success),
      ],
    );
  }
}

class _ResultTableCard extends StatelessWidget {
  const _ResultTableCard();

  @override
  Widget build(BuildContext context) {
    const rows = [
      ('Hemoglobin', '14.2 g/dL', '13.5 - 17.5', 'طبيعي', AppColors.success),
      ('WBC', '6.1 x10^9/L', '4.0 - 11.0', 'طبيعي', AppColors.success),
      ('Platelets', '250 x10^9/L', '150 - 450', 'طبيعي', AppColors.success),
      ('Vitamin D', '18 ng/mL', '30 - 100', 'منخفض', AppColors.warning),
      ('HbA1c', '5.4%', 'أقل من 5.7%', 'طبيعي', AppColors.success),
    ];

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('جدول النتائج', style: AppTextStyles.titleMedium),
          const SizedBox(height: AppSpacing.md),
          ...rows.map(
            (row) => _LabResultRow(
              name: row.$1,
              value: row.$2,
              normalRange: row.$3,
              status: row.$4,
              color: row.$5,
            ),
          ),
        ],
      ),
    );
  }
}

class _InterpretationCard extends StatelessWidget {
  const _InterpretationCard();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _SectionText(
            title: 'تفسير مختصر',
            value:
                'لا توجد مؤشرات خطورة واضحة. انخفاض Vitamin D يحتاج متابعة غذائية ودوائية.',
          ),
          SizedBox(height: AppSpacing.md),
          _SectionText(
            title: 'ملاحظات الطبيب',
            value: 'ينصح بإعادة فحص Vitamin D بعد 8 أسابيع من بدء العلاج.',
          ),
          SizedBox(height: AppSpacing.md),
          _SectionText(
            title: 'توصيات',
            value:
                'الالتزام بالمكملات، التعرض الآمن للشمس، ومراجعة الطبيب عند استمرار التعب.',
          ),
        ],
      ),
    );
  }
}

class _LabResultRow extends StatelessWidget {
  const _LabResultRow({
    required this.name,
    required this.value,
    required this.normalRange,
    required this.status,
    required this.color,
  });

  final String name;
  final String value;
  final String normalRange;
  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(name, style: AppTextStyles.titleMedium)),
              _StatusChip(label: status, color: color),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          _InfoRow(label: 'القيمة', value: value),
          _InfoRow(label: 'المجال الطبيعي', value: normalRange),
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
              width: 112, child: Text(label, style: AppTextStyles.bodyMedium)),
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
