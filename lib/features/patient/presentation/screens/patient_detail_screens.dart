import 'package:flutter/material.dart';

import '../../../../core/constants/app_routes.dart';
import 'patient_info_screen.dart';

class MedicalRecordDetailsScreen extends StatelessWidget {
  const MedicalRecordDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PatientInfoScreen(
      title: 'تفاصيل السجل الطبي',
      description:
          'تشخيص الزيارة، ملاحظات الطبيب، الملفات المرفقة، وخطة المتابعة ستعرض هنا.',
      icon: Icons.assignment_rounded,
      backRoute: AppRoutes.patientMedicalRecords,
    );
  }
}

class PrescriptionDetailsScreen extends StatelessWidget {
  const PrescriptionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PatientInfoScreen(
      title: 'تفاصيل الوصفة',
      description:
          'جرعات الدواء، مدة الاستخدام، التنبيهات، وتعليمات الطبيب ستعرض هنا.',
      icon: Icons.medication_rounded,
      backRoute: AppRoutes.patientPrescriptions,
    );
  }
}

class LaboratoryResultDetailsScreen extends StatelessWidget {
  const LaboratoryResultDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PatientInfoScreen(
      title: 'تفاصيل نتيجة التحليل',
      description:
          'القيم المخبرية، المجال الطبيعي، حالة النتيجة، وملاحظات الطبيب ستعرض هنا.',
      icon: Icons.science_rounded,
      backRoute: AppRoutes.patientLaboratory,
    );
  }
}
