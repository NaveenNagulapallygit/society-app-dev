import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society_app/routing/app_routes.dart';

class RegistrationController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController =
  TextEditingController();

  final TextEditingController emailController =
  TextEditingController();

  final TextEditingController mobileController =
  TextEditingController();

  final TextEditingController passwordController =
  TextEditingController();

  final TextEditingController confirmPasswordController =
  TextEditingController();

  final RxString selectedRole = ''.obs;

  final RxString residentType = ''.obs;

  final RxBool isOccupant = false.obs;

  final RxBool isPasswordVisible = true.obs;

  final RxBool isConfirmPasswordVisible = true.obs;

  final RxString roleError = ''.obs;

  final RxString residentTypeError = ''.obs;


  void togglePassword() {
    isPasswordVisible.toggle();
  }

  void toggleConfirmPassword() {
    isConfirmPasswordVisible.toggle();
  }

  void toggleOccupant(bool value) {
    isOccupant.value = value;
  }

  void selectRole(String role) {
    selectedRole.value = role;

    roleError.value = '';

    if (role != 'Resident') {
      residentType.value = '';
      residentTypeError.value = '';
      isOccupant.value = false;
    }
  }

  void selectResidentType(String type) {
    residentType.value = type;

    residentTypeError.value = '';

    isOccupant.value = false;
  }

  bool validateRegistration() {
    roleError.value = '';
    residentTypeError.value = '';

    final bool isFormValid =
        formKey.currentState?.validate() ?? false;

    if (selectedRole.value.isEmpty) {
      roleError.value = 'Please select a Role';
    }

    if (selectedRole.value == 'Resident' &&
        residentType.value.isEmpty) {
      residentTypeError.value =
      'Please select Owner or Tenant';
    }

    return isFormValid &&
        roleError.value.isEmpty &&
        residentTypeError.value.isEmpty;
  }

  void continueRegistration() {
    if (!validateRegistration()) {
      return;
    }
    Get.toNamed(
        Routes.societyInfo,
      arguments: {
          'role': selectedRole.value,
      }

    );
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.onClose();
  }
}