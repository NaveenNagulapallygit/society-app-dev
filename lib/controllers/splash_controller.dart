import 'dart:async';
import 'package:get/get.dart';
import 'package:society_app/constants/app_strings.dart';
import 'package:society_app/routing/app_routes.dart';
import 'package:society_app/utils/shared_preference_service.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {

    Timer(
      const Duration(seconds: 2),
          () {

            final bool isLoggedIn =
            SharedPreferenceService.getBool(
              AppStrings.storageIsLoggedIn,
            );

        if (isLoggedIn) {
          Get.offAllNamed(
            Routes.home,
          );

        } else {

          Get.offAllNamed(
            Routes.login,
          );

        }
      },
    );
  }
}