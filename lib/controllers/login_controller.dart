import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:society_app/constants/app_strings.dart';
import 'package:society_app/routing/app_routes.dart';

class LoginController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GetStorage box = GetStorage();

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

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;

    if (!rememberMe.value) {
      box.remove(AppStrings.mobile);
      box.remove(AppStrings.password.toLowerCase());
      box.write('rememberMe', false);
    }
  }

  void login() {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }

    final String mobile = mobileController.text.trim();
    final String password = passwordController.text.trim();

    if (rememberMe.value) {
      box.write(AppStrings.mobile, mobile);
      box.write(AppStrings.password.toLowerCase(), password);
      box.write('rememberMe', true);
    } else {
      box.remove(AppStrings.mobile);
      box.remove(AppStrings.password.toLowerCase());
      box.write('rememberMe', false);
    }

    box.write(AppStrings.isLoggedIn, true);

    Get.offAllNamed(Routes.home);
  }

  void loadSavedData() {
    final bool savedRememberMe = box.read('rememberMe') ?? false;

    if (savedRememberMe) {
      mobileController.text = box.read(AppStrings.mobile) ?? '';
      passwordController.text = box.read(AppStrings.password.toLowerCase()) ?? '';
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