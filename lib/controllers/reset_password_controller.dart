import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society_app/constants/app_strings.dart';
import 'package:society_app/routing/app_routes.dart';
import 'package:society_app/utils/common_snackbar.dart';

class ResetPasswordController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController passwordController =
  TextEditingController();

  final TextEditingController confirmPasswordController =
  TextEditingController();

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
  CommonSnackbar.show(
      type: SnackbarType.success,
      message: AppStrings.passwordResetSuccessfully,
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