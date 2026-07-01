import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:society_app/routing/app_routes.dart';

class ForgotPasswordController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController mobileEmailController =
  TextEditingController();

  final GetStorage box = GetStorage();

  void sendOtp() {

    final bool isValid =
        formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    String otp =
    (100000 + Random().nextInt(900000))
        .toString();

    box.write(
      "otp",
      otp,
    );

    box.write(
      "otpExpiry",
      DateTime.now()
          .add(
        const Duration(
          minutes: 2,
        ),
      )
          .toIso8601String(),
    );

    debugPrint("Generated OTP : $otp");

    Get.snackbar(
      "Success",
      "OTP sent successfully.",
      snackPosition: SnackPosition.BOTTOM,
    );

    Get.toNamed(
      Routes.otpVerification,
    );
  }


  @override
  void onClose() {

    mobileEmailController.dispose();

    super.onClose();
  }
}