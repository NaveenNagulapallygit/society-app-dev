import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:society_app/constants/app_strings.dart';
import 'package:society_app/routing/app_routes.dart';
import 'package:society_app/utils/common_snackbar.dart';

class OtpController extends GetxController {

  final box = GetStorage();

  final List<TextEditingController> otpControllers =
  List.generate(
    6,
        (_) => TextEditingController(),
  );

  String getOtp() {
    return otpControllers
        .map((controller) => controller.text)
        .join();
  }

  void verifyOtp() {
    String enteredOtp = getOtp();
    if (enteredOtp.length != 6) {
      CommonSnackbar.show(
          type: SnackbarType.error,
          message: AppStrings.enterCompleteOtp,
      );
      return;
    }

    String storedOtp =
        box.read(AppStrings.otp) ?? '';

    String expiryString =
        box.read(AppStrings.otpExpiry) ?? '';

    if (expiryString.isEmpty) {
      CommonSnackbar.show(
          type: SnackbarType.error,
          message: AppStrings.otpNotFound,
      );
      return;
    }

    DateTime expiry =
    DateTime.parse(expiryString);

    if (DateTime.now().isAfter(expiry)) {
      CommonSnackbar.show(
          type: SnackbarType.warning,
          message: AppStrings.otpExpired,
      );
      return;
    }

    if (enteredOtp == storedOtp) {
      CommonSnackbar.show(
          type: SnackbarType.success,
          message: AppStrings.otpVerifiedSuccessfully,
      );
      Get.toNamed(
        Routes.resetPassword,
      );
    } else {
      CommonSnackbar.show(
          type: SnackbarType.error,
          message: AppStrings.invalidOtp,
      );
    }
  }

  void resendOtp() {
    String otp =
    (100000 + Random().nextInt(900000))
        .toString();
    box.write(AppStrings.otp, otp);
    print("Resent OTP : $otp");
    box.write(
      AppStrings.otpExpiry,
      DateTime.now()
          .add(
        const Duration(minutes: 2),
      ).toIso8601String(),
    );
    clearOtpFields();
    CommonSnackbar.show(
        type: SnackbarType.success,
        message: AppStrings.otpResendSuccessfully,
    );
  }

  void clearOtpFields() {
    for (var controller in otpControllers) {
      controller.clear();
    }
  }

  @override
  void onClose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    super.onClose();
  }
}