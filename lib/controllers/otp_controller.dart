import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:society_app/routing/app_routes.dart';

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
      Get.snackbar(
        "Error",
        "Please enter complete OTP",
      );
      return;
    }

    String storedOtp =
        box.read('otp') ?? '';

    String expiryString =
        box.read('otpExpiry') ?? '';

    if (expiryString.isEmpty) {
      Get.snackbar(
        "Error",
        "OTP Not Found",
      );
      return;
    }

    DateTime expiry =
    DateTime.parse(expiryString);

    if (DateTime.now().isAfter(expiry)) {
      Get.snackbar(
        "Expired",
        "OTP has expired. Please request a new OTP.",
      );
      return;
    }

    if (enteredOtp == storedOtp) {
      Get.snackbar(
        "Success",
        "OTP Verified Successfully",
      );
      Get.toNamed(
        Routes.resetPassword,
      );
    } else {
      Get.snackbar(
        "Error",
        "Invalid OTP",
      );
    }
  }

  void resendOtp() {
    String otp =
    (100000 + Random().nextInt(900000))
        .toString();
    box.write('otp', otp);
    print("Resent OTP : $otp");
    box.write(
      'otpExpiry',
      DateTime.now()
          .add(
        const Duration(minutes: 2),
      ).toIso8601String(),
    );
    clearOtpFields();
    Get.snackbar(
      "Success",
      "OTP Resent Successfully",
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