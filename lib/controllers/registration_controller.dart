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

    if (role != 'Resident') {
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

  Future<void> openCitySelection() async {
    final result = await Get.toNamed(
      Routes.selection,
      arguments: {
        "title": "Select City",
        "type": "city",
      },
    );

    if (result != null) {
      cityController.text = result;
    }
  }

  Future<void> openStateSelection() async {
    final result = await Get.toNamed(
      Routes.selection,
      arguments: {
        "title": "Select State",
        "type": "state",
      },
    );

    if (result != null) {
      stateController.text = result;
    }
  }

  Future<void> openSocietySelection() async {
    final result = await Get.toNamed(
      Routes.selection,
      arguments: {
        "title": "Select Society",
        "type": "society",
      },
    );

    if (result != null) {
      societyController.text = result;
    }
  }

  void continueRegistration() {
    if (!validateRegistration()) {
      return;
    }
    if (selectedRole.value.isEmpty) {
      Get.snackbar(
        "Error",
        "Please choose a role to complete your information form.",
        snackPosition: SnackPosition.TOP,
      );
      return;
    }
    if (selectedRole.value == 'Resident' &&
        residentType.value.isEmpty) {
      Get.snackbar(
        "Selection Required",
        "Please specify if you are an Owner or a Tenant.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
    Get.snackbar(
      "Success",
      "Registration and Society Details saved successfully!",
      snackPosition: SnackPosition.TOP,
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