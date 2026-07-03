import 'dart:async';
import 'package:get/get.dart';
import 'package:society_app/constants/app_strings.dart';
import 'package:society_app/routing/app_routes.dart';
import 'package:society_app/utils/common_snackbar.dart';
import 'package:society_app/utils/shared_preference_service.dart';

class HomeController extends GetxController {
  Timer? sessionTimer;

  @override
  void onInit() {
    super.onInit();
    startSessionTimer();
  }

  void startSessionTimer() {
    sessionTimer?.cancel();

    sessionTimer = Timer(
      Duration(
          minutes: 15
      ),
      logoutDueToTimeout,
    );
  }

  void resetSessionTimer() {
    startSessionTimer();
  }

  Future<void> logoutDueToTimeout() async {
    await SharedPreferenceService.remove(
        AppStrings.storageIsLoggedIn,
    );
    Get.offAllNamed(Routes.login);
    CommonSnackbar.show(
        type: SnackbarType.warning,
        message: AppStrings.pleaseLoginAgain
    );
  }

  Future<void> logout() async {
    sessionTimer?.cancel();
    await SharedPreferenceService.remove(
        AppStrings.storageIsLoggedIn,
    );
    Get.offAllNamed(Routes.login);
  }

  @override
  void onClose() {
    sessionTimer?.cancel();
    super.onClose();
  }

}