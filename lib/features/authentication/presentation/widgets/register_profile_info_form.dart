import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_text_field.dart';

class RegisterProfileInfoForm extends StatelessWidget {
  const RegisterProfileInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          decoration: _inputDecoration('الجنس', Icons.wc_rounded),
          items: const [
            DropdownMenuItem(value: 'male', child: Text('ذكر')),
            DropdownMenuItem(value: 'female', child: Text('أنثى')),
          ],
          onChanged: (_) {},
        ),
        const SizedBox(height: AppSpacing.md),
        const AppTextField(
          label: 'تاريخ الميلاد',
          hint: 'YYYY/MM/DD',
          prefixIcon:
              Icon(Icons.calendar_today_outlined, color: AppColors.primary),
          keyboardType: TextInputType.datetime,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: AppSpacing.md),
        DropdownButtonFormField<String>(
          decoration: _inputDecoration('المحافظة', Icons.location_city_rounded),
          items: const [
            DropdownMenuItem(value: 'riyadh', child: Text('الرياض')),
            DropdownMenuItem(value: 'jeddah', child: Text('جدة')),
            DropdownMenuItem(value: 'dammam', child: Text('الدمام')),
            DropdownMenuItem(value: 'other', child: Text('أخرى')),
          ],
          onChanged: (_) {},
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: AppColors.primary),
      filled: true,
      fillColor: AppColors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
    );
  }
}
