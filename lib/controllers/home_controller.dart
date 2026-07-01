import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:society_app/routing/app_routes.dart';

class HomeController extends GetxController {
  final box = GetStorage();
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

  void logoutDueToTimeout() {
    box.remove('isLoggedIn');
    Get.offAllNamed(Routes.login);
    Get.snackbar(
      "Session Expired",
      "Please login again",
    );

  }

  void logout() {
    sessionTimer?.cancel();
    box.remove('isLoggedIn');
    Get.offAllNamed(Routes.login);
  }

  @override
  void onClose() {
    sessionTimer?.cancel();
    super.onClose();
  }

}