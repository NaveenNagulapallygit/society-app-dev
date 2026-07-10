import 'package:get/get.dart';
import 'package:society_app/bindings/forgot_password_binding.dart';
import 'package:society_app/bindings/home_binding.dart';
import 'package:society_app/bindings/login_binding.dart';
import 'package:society_app/bindings/otp_binding.dart';
import 'package:society_app/bindings/registration_binding.dart';
import 'package:society_app/bindings/reset_password_binding.dart';
import 'package:society_app/bindings/splash_binding.dart';
import 'package:society_app/routing/app_routes.dart';
import 'package:society_app/views/approval_pending_view.dart';
import 'package:society_app/views/forgot_password_view.dart';
import 'package:society_app/views/home_view.dart';
import 'package:society_app/views/login_view.dart';
import 'package:society_app/views/otp_view.dart';
import 'package:society_app/views/registration_view.dart';
import 'package:society_app/views/reset_password_view.dart';
import 'package:society_app/views/splash_view.dart';
class AppPages {
  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: Routes.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: Routes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: Routes.registration,
      page: () => RegistrationView(),
      binding: RegistrationBinding(),
    ),

    GetPage(
      name: Routes.forgotPassword,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),

    GetPage(
      name: Routes.otpVerification,
      page: () => OtpView(),
      binding: OtpBinding(),
    ),

    GetPage(
      name: Routes.resetPassword,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),

    GetPage(
      name: Routes.approvalPending,
      page: () => ApprovalPendingView(),
    ),
  ];
}