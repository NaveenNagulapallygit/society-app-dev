import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society_app/constants/app_strings.dart';
import 'package:society_app/routing/app_routes.dart';
import 'package:society_app/utils/shared_preference_service.dart';

class LoginController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final RxBool isPasswordVisible = true.obs;

  final RxBool rememberMe = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadSavedData();
  }

  void togglePassword() {
    isPasswordVisible.toggle();
  }

  Future<void> toggleRememberMe(bool? value) async {
    rememberMe.value = value ?? false;
    if(!rememberMe.value) {
      await SharedPreferenceService.remove(
          AppStrings.mobile,
      );
      await SharedPreferenceService.remove(
          AppStrings.password.toLowerCase(),
      );
      await SharedPreferenceService.setBool(
          AppStrings.storageRememberMe,
          false,
      );
    }
  }

  Future<void> login() async {

    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }

    final String mobile = mobileController.text.trim();
    final String password = passwordController.text.trim();

    if (rememberMe.value) {

      await SharedPreferenceService.setString(
        AppStrings.mobile,
        mobile,
      );

      await SharedPreferenceService.setString(
        AppStrings.password.toLowerCase(),
        password,
      );

      await SharedPreferenceService.setBool(
        AppStrings.storageRememberMe,
        true,
      );

    } else {

      await SharedPreferenceService.remove(
        AppStrings.mobile,
      );

      await SharedPreferenceService.remove(
        AppStrings.password.toLowerCase(),
      );

      await SharedPreferenceService.setBool(
        AppStrings.storageRememberMe,
        false,
      );
    }

    await SharedPreferenceService.setBool(
      AppStrings.storageIsLoggedIn,
      true,
    );

    Get.offAllNamed(
      Routes.home,
    );
  }

  void loadSavedData() {

    final bool savedRememberMe =
    SharedPreferenceService.getBool(
      AppStrings.storageRememberMe,
    );

    if (savedRememberMe) {

      mobileController.text =
          SharedPreferenceService.getString(
            AppStrings.mobile,
          );

      passwordController.text =
          SharedPreferenceService.getString(
            AppStrings.password.toLowerCase(),
          );

      rememberMe.value = true;
    }
  }

  @override
  void onClose() {
    mobileController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}