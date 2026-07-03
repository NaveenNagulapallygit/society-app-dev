import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:society_app/constants/app_strings.dart';
import 'package:society_app/routing/app_routes.dart';

class SplashController extends GetxController {


  final GetStorage box = GetStorage();

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
            box.read(AppStrings.isLoggedIn) ?? false;

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