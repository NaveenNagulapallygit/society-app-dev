import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society_app/constants/app_strings.dart';
import 'package:society_app/routing/app_routes.dart';
import 'package:society_app/utils/common_snackbar.dart';
import 'package:society_app/utils/shared_preference_service.dart';

class ForgotPasswordController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController mobileEmailController =
  TextEditingController();


  Future<void> sendOtp() async {

    final bool isValid =
        formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    String otp =
    (100000 + Random().nextInt(900000))
        .toString();
    await SharedPreferenceService.setString(
        AppStrings.storageOtp,
        otp
    );

    await SharedPreferenceService.setString(
        AppStrings.otpExpiry,
        DateTime.now().add(
            Duration(minutes: 2),
        ).toIso8601String(),
    );
    debugPrint("Generated OTP : $otp");

    CommonSnackbar.show(
        type: SnackbarType.success,
        message: AppStrings.otpSentSuccessfully
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