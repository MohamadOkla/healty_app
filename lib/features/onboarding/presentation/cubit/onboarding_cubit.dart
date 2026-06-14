import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/onboarding_model.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState());

  static const List<OnboardingModel> pages = [
    OnboardingModel(
      title: 'رؤية صحية واضحة',
      description:
          'منصة موحدة تساعدك على الوصول إلى الخدمات الطبية ومتابعة بياناتك بسهولة',
      icon: Icons.visibility_rounded,
    ),
    OnboardingModel(
      title: 'خدمات طبية متكاملة',
      description:
          'إدارة المواعيد والسجلات والوصفات والتحاليل في تجربة رقمية موحدة',
      icon: Icons.medical_services_rounded,
    ),
    OnboardingModel(
      title: 'وصول أسهل وأسرع',
      description: 'تابع خدماتك الصحية من أي مكان بواجهة واضحة وسريعة وآمنة',
      icon: Icons.speed_rounded,
    ),
  ];

  void pageChanged(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  void next() {
    if (state.isLastPage) {
      complete();
      return;
    }

    emit(state.copyWith(currentIndex: state.currentIndex + 1));
  }

  void complete() {
    emit(state.copyWith(status: OnboardingStatus.completed));
  }
}
