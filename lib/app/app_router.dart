import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/app_routes.dart';
import '../features/appointments/presentation/cubit/book_appointment_cubit.dart';
import '../features/appointments/presentation/cubit/book_appointment_state.dart';
import '../features/appointments/presentation/screens/appointment_details_screen.dart';
import '../features/appointments/presentation/screens/book_appointment_screen.dart';
import '../features/appointments/presentation/screens/booking_success_screen.dart';
import '../features/appointments/presentation/screens/date_time_selection_screen.dart';
import '../features/appointments/presentation/screens/doctor_selection_screen.dart';
import '../features/appointments/presentation/screens/my_appointments_screen.dart';
import '../features/authentication/presentation/screens/account_created_screen.dart';
import '../features/authentication/presentation/screens/forgot_password_screen.dart';
import '../features/authentication/presentation/screens/login_screen.dart';
import '../features/authentication/presentation/screens/otp_verification_screen.dart';
import '../features/authentication/presentation/screens/password_changed_screen.dart';
import '../features/authentication/presentation/screens/register_screen.dart';
import '../features/authentication/presentation/screens/reset_password_screen.dart';
import '../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../features/patient/presentation/screens/patient_dashboard_screen.dart';
import '../features/patient/presentation/widgets/patient_bottom_navigation.dart';
import '../features/role_selection/presentation/screens/role_selection_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';

abstract final class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splashName,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        name: AppRoutes.onboardingName,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.roleSelection,
        name: AppRoutes.roleSelectionName,
        builder: (context, state) => const RoleSelectionScreen(),
      ),
      GoRoute(
        path: AppRoutes.auth,
        name: AppRoutes.authName,
        redirect: _redirectToLogin,
      ),
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.loginName,
        builder: (context, state) {
          return LoginScreen(selectedRole: state.uri.queryParameters['role']);
        },
      ),
      GoRoute(
        path: AppRoutes.register,
        name: AppRoutes.registerName,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        name: AppRoutes.forgotPasswordName,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.otp,
        name: AppRoutes.otpName,
        builder: (context, state) {
          return OtpVerificationScreen(
            purpose: state.uri.queryParameters['purpose'] ?? 'reset',
          );
        },
      ),
      GoRoute(
        path: AppRoutes.resetPassword,
        name: AppRoutes.resetPasswordName,
        builder: (context, state) => const ResetPasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.accountCreated,
        name: AppRoutes.accountCreatedName,
        builder: (context, state) => const AccountCreatedScreen(),
      ),
      GoRoute(
        path: AppRoutes.passwordChanged,
        name: AppRoutes.passwordChangedName,
        builder: (context, state) => const PasswordChangedScreen(),
      ),
      GoRoute(
        path: AppRoutes.patient,
        name: AppRoutes.patientName,
        redirect: _redirectToPatientDashboard,
      ),
      GoRoute(
        path: AppRoutes.patientDashboard,
        name: AppRoutes.patientDashboardName,
        builder: (context, state) => const PatientDashboardScreen(),
      ),
      GoRoute(
        path: AppRoutes.patientAppointments,
        name: AppRoutes.patientAppointmentsName,
        builder: (context, state) => const MyAppointmentsScreen(),
      ),
      GoRoute(
        path: AppRoutes.patientAppointmentDetails,
        name: AppRoutes.patientAppointmentDetailsName,
        builder: (context, state) => const AppointmentDetailsScreen(),
      ),
      GoRoute(
        path: AppRoutes.patientBookAppointment,
        name: AppRoutes.patientBookAppointmentName,
        builder: (context, state) {
          final cubit = state.extra;
          return BookAppointmentScreen(
            cubit: cubit is BookAppointmentCubit ? cubit : null,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.patientSelectDoctor,
        name: AppRoutes.patientSelectDoctorName,
        builder: (context, state) {
          final cubit = state.extra;
          return DoctorSelectionScreen(
            cubit:
                cubit is BookAppointmentCubit ? cubit : BookAppointmentCubit(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.patientSelectDateTime,
        name: AppRoutes.patientSelectDateTimeName,
        builder: (context, state) {
          final cubit = state.extra;
          return DateTimeSelectionScreen(
            cubit:
                cubit is BookAppointmentCubit ? cubit : BookAppointmentCubit(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.patientBookingSuccess,
        name: AppRoutes.patientBookingSuccessName,
        builder: (context, state) {
          final booking = state.extra;
          return BookingSuccessScreen(
            booking: booking is BookAppointmentState
                ? booking
                : const BookAppointmentState(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.patientMedicalRecords,
        name: AppRoutes.patientMedicalRecordsName,
        builder: (context, state) => const PatientPlaceholderScreen(
          title: 'السجل الطبي',
          selectedIndex: 0,
        ),
      ),
      GoRoute(
        path: AppRoutes.patientPrescriptions,
        name: AppRoutes.patientPrescriptionsName,
        builder: (context, state) =>
            const PatientPlaceholderScreen(title: 'الوصفات', selectedIndex: 0),
      ),
      GoRoute(
        path: AppRoutes.patientLaboratory,
        name: AppRoutes.patientLaboratoryName,
        builder: (context, state) =>
            const PatientPlaceholderScreen(title: 'التحاليل', selectedIndex: 0),
      ),
      GoRoute(
        path: AppRoutes.patientNotifications,
        name: AppRoutes.patientNotificationsName,
        builder: (context, state) => const PatientPlaceholderScreen(
          title: 'الإشعارات',
          selectedIndex: 3,
        ),
      ),
      GoRoute(
        path: AppRoutes.patientProfile,
        name: AppRoutes.patientProfileName,
        builder: (context, state) =>
            const PatientPlaceholderScreen(title: 'حسابي', selectedIndex: 4),
      ),
      GoRoute(
        path: AppRoutes.doctor,
        name: AppRoutes.doctorName,
        redirect: _redirectToOnboarding,
      ),
      GoRoute(
        path: AppRoutes.hospitalAdmin,
        name: AppRoutes.hospitalAdminName,
        redirect: _redirectToOnboarding,
      ),
      GoRoute(
        path: AppRoutes.ministryAdmin,
        name: AppRoutes.ministryAdminName,
        redirect: _redirectToOnboarding,
      ),
      GoRoute(
        path: AppRoutes.appointments,
        name: AppRoutes.appointmentsName,
        redirect: _redirectToOnboarding,
      ),
      GoRoute(
        path: AppRoutes.medicalRecords,
        name: AppRoutes.medicalRecordsName,
        redirect: _redirectToOnboarding,
      ),
      GoRoute(
        path: AppRoutes.prescriptions,
        name: AppRoutes.prescriptionsName,
        redirect: _redirectToOnboarding,
      ),
      GoRoute(
        path: AppRoutes.laboratory,
        name: AppRoutes.laboratoryName,
        redirect: _redirectToOnboarding,
      ),
      GoRoute(
        path: AppRoutes.reports,
        name: AppRoutes.reportsName,
        redirect: _redirectToOnboarding,
      ),
      GoRoute(
        path: AppRoutes.notifications,
        name: AppRoutes.notificationsName,
        redirect: _redirectToOnboarding,
      ),
      GoRoute(
        path: AppRoutes.settings,
        name: AppRoutes.settingsName,
        redirect: _redirectToOnboarding,
      ),
    ],
  );

  static String _redirectToOnboarding(
    BuildContext context,
    GoRouterState state,
  ) {
    return AppRoutes.onboarding;
  }

  static String _redirectToLogin(
    BuildContext context,
    GoRouterState state,
  ) {
    return AppRoutes.login;
  }

  static String _redirectToPatientDashboard(
    BuildContext context,
    GoRouterState state,
  ) {
    return AppRoutes.patientDashboard;
  }
}

class PatientPlaceholderScreen extends StatelessWidget {
  const PatientPlaceholderScreen({
    super.key,
    required this.title,
    required this.selectedIndex,
  });

  final String title;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'رجوع',
          onPressed: () => context.go(AppRoutes.patientDashboard),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: Text(title),
      ),
      body: Center(child: Text(title)),
      bottomNavigationBar:
          PatientBottomNavigation(selectedIndex: selectedIndex),
    );
  }
}
