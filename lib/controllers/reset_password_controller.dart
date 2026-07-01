import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:society_app/routing/app_routes.dart';

class ResetPasswordController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController passwordController =
  TextEditingController();

  final TextEditingController confirmPasswordController =
  TextEditingController();

  final GetStorage box = GetStorage();

  RxBool isPasswordVisible = true.obs;

  RxBool isConfirmPasswordVisible = true.obs;

  void togglePassword() {
    isPasswordVisible.value =
    !isPasswordVisible.value;
  }

  void toggleConfirmPassword() {
    isConfirmPasswordVisible.value =
    !isConfirmPasswordVisible.value;
  }

  void resetPassword() {

    final bool isValid =
        formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    Get.snackbar(
      "Success",
      "Password reset successfully.",
      snackPosition: SnackPosition.BOTTOM,
    );

    Get.offAllNamed(
      Routes.login,
    );
  }

  @override
  void onClose() {
    passwordController.dispose();

    confirmPasswordController.dispose();

    super.onClose();
  }
}