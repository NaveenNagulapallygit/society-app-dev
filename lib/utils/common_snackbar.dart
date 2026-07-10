import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society_app/constants/app_colors.dart';
import 'package:society_app/constants/app_strings.dart';

enum SnackbarType {
   success,
   error,
  warning,
}

class CommonSnackbar {
  CommonSnackbar._();

  static void show({
    required SnackbarType type,
    required String message
  }) {
    Get.snackbar(
      getTitle(type),
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: getbackGroundColor(type),
      colorText: Colors.white,
      margin: EdgeInsets.all(15),
      borderRadius: 10,
      duration: Duration(seconds: 3),
    );
   }

   static String getTitle(SnackbarType type) {
    switch (type) {
      case SnackbarType.success:
        return AppStrings.success;
      case SnackbarType.error:
        return AppStrings.error;
      case SnackbarType.warning:
        return AppStrings.warning;
    }
   }

   static Color getbackGroundColor(SnackbarType type) {
    switch (type) {
      case SnackbarType.success:
        return AppColors.success;
      case SnackbarType.error:
        return AppColors.error;
      case SnackbarType.warning:
        return AppColors.warning;
    }
   }
 }
