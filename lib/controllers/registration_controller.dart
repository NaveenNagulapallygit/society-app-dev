import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society_app/constants/app_strings.dart';
import 'package:society_app/routing/app_routes.dart';
import 'package:society_app/utils/common_snackbar.dart';

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

  final TextEditingController cityController =
  TextEditingController();

  final TextEditingController stateController =
  TextEditingController();

  final TextEditingController societyController =
  TextEditingController();

  final TextEditingController towerController =
  TextEditingController();

  final TextEditingController flatController =
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

    if (role != AppStrings.resident) {
      residentType.value = '';
      residentTypeError.value = '';
      isOccupant.value = false;
      flatController.clear();
      towerController.clear();
    }
  }

  void selectResidentType(String type) {
    residentType.value = type;
    residentTypeError.value = '';
    // isOccupant.value = false;
  }

  bool validateRegistration() {
    roleError.value = '';
    residentTypeError.value = '';

    final bool isFormValid =
        formKey.currentState?.validate() ?? false;

    return isFormValid &&
        roleError.value.isEmpty &&
        residentTypeError.value.isEmpty;
  }

  Future<void> openSelection({
    required String title,
    required String type,
    required TextEditingController controller,
  }) async {
    final result = await Get.toNamed(
      Routes.selection,
      arguments: {
        "title": title,
        "type": type,
      } ,
    );
  }

  void continueRegistration() {
    if (!validateRegistration()) {
      return;
    }
    if (selectedRole.value.isEmpty) {
      CommonSnackbar.show(
          type: SnackbarType.error,
          message: AppStrings.chooseRoleToCompleteInfo,
      );
      return;
    }
    if (selectedRole.value == AppStrings.resident &&
        residentType.value.isEmpty) {
      CommonSnackbar.show(
          type: SnackbarType.warning,
          message: AppStrings.specifyOwnerOrTenant,
      );
      return;
    }
    CommonSnackbar.show(
        type: SnackbarType.success,
        message: AppStrings.registrationSuccess,
    );
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    societyController.dispose();
    cityController.dispose();
    stateController.dispose();
    flatController.dispose();
    towerController.dispose();
    super.onClose();
  }
}