import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society_app/constants/app_strings.dart';
import 'package:society_app/routing/app_routes.dart';
import 'package:society_app/utils/common_snackbar.dart';
import 'package:society_app/utils/shared_preference_service.dart';

class OtpController extends GetxController {

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
    SharedPreferenceService.getString(
      AppStrings.storageOtp,
    );

    String expiryString =
    SharedPreferenceService.getString(
      AppStrings.otpExpiry,
    );

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

  Future<void> resendOtp() async {
    String otp =
    (100000 + Random().nextInt(900000))
        .toString();

    await SharedPreferenceService.setString(
      AppStrings.storageOtp,
      otp,
    );
    debugPrint("Resent OTP : $otp");
    await SharedPreferenceService.setString(
      AppStrings.otpExpiry,
      DateTime.now().add(
         Duration(minutes: 2),
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