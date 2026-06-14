import '../constants/app_routes.dart';

abstract final class UserRoleHelper {
  static const patient = 'patient';
  static const doctor = 'doctor';
  static const hospitalAdmin = 'hospitalAdmin';
  static const ministryAdmin = 'ministryAdmin';

  static String normalize(String? role) {
    return switch (role) {
      'hospital_admin' => hospitalAdmin,
      'ministry_admin' => ministryAdmin,
      'hospitalAdmin' => hospitalAdmin,
      'ministryAdmin' => ministryAdmin,
      'doctor' => doctor,
      _ => patient,
    };
  }

  static bool canSelfRegister(String? role) {
    final normalizedRole = normalize(role);
    return normalizedRole == patient || normalizedRole == doctor;
  }

  static bool isDoctor(String? role) => normalize(role) == doctor;

  static String loginRouteFor(String? role) {
    return Uri(
      path: AppRoutes.login,
      queryParameters: {'role': normalize(role)},
    ).toString();
  }

  static String registerRouteFor(String? role) {
    return Uri(
      path: AppRoutes.register,
      queryParameters: {'role': normalize(role)},
    ).toString();
  }

  static String otpRouteForRegister(String? role) {
    return Uri(
      path: AppRoutes.otp,
      queryParameters: {
        'purpose': 'register',
        'role': normalize(role),
      },
    ).toString();
  }

  static String accountCreatedRouteFor(String? role) {
    return Uri(
      path: AppRoutes.accountCreated,
      queryParameters: {'role': normalize(role)},
    ).toString();
  }

  static String dashboardRouteFor(String? role) {
    return switch (normalize(role)) {
      doctor => AppRoutes.doctor,
      hospitalAdmin => AppRoutes.hospitalAdmin,
      ministryAdmin => AppRoutes.ministryAdmin,
      _ => AppRoutes.patientDashboard,
    };
  }
}
