import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society_app/constants/app_strings.dart';
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

  final TextEditingController searchController =
  TextEditingController();

  final RxString selectedRole = ''.obs;

  final RxString residentType = ''.obs;

  final RxBool isOccupant = false.obs;

  final RxBool isPasswordVisible = true.obs;

  final RxBool isConfirmPasswordVisible = true.obs;

  final RxString roleError = ''.obs;

  final RxString residentTypeError = ''.obs;

  final RxInt currentPage = 0.obs;

  final RxString selectionTitle = ''.obs;

  final RxString selectionType = ''.obs;

  final RxList<String> selectionItems = <String>[].obs;

  final RxList<String> filteredSelectionItems = <String>[].obs;

  final RxString selectedSelectionItem = ''.obs;

  late TextEditingController currentSelectionController;


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

  void nextPage() {
    currentPage.value = 1;
  }


  void previousPage() {
    currentPage.value = 0;
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
    nextPage();
  }

  void confirmRegistration() {

    if (stateController.text.trim().isEmpty ||
        cityController.text.trim().isEmpty ||
        societyController.text.trim().isEmpty) {

      CommonSnackbar.show(
        type: SnackbarType.warning,
        message: AppStrings.fillSocietyDetails,
      );
      return;
    }

    if (selectedRole.value == AppStrings.resident) {

      if (towerController.text.trim().isEmpty ||
          flatController.text.trim().isEmpty) {

        CommonSnackbar.show(
          type: SnackbarType.warning,
          message: AppStrings.fillSocietyDetails,
        );
        return;
      }
    }
    CommonSnackbar.show(
      type: SnackbarType.success,
      message: AppStrings.registrationSuccess,
    );
  }

  void loadSelectionItems() {

    switch (selectionType.value) {

      case AppStrings.city:

        selectionItems.assignAll([
          "Hyderabad",
          "Chennai",
          "Coimbatore",
          "Bangalore",
          "Mumbai",
          "Delhi",
          "Pune",
          "Kolkata",
          "Ahmedabad",
          "Jaipur",
        ]);

        break;

      case AppStrings.state:

        selectionItems.assignAll([
          "Telangana",
          "Tamil Nadu",
          "Karnataka",
          "Maharashtra",
          "Delhi",
          "Gujarat",
          "Rajasthan",
          "Kerala",
          "Andhra Pradesh",
          "West Bengal",
        ]);

        break;

      case AppStrings.society:

        selectionItems.assignAll([
          "My Home Bhooja",
          "Prestige High Fields",
          "Aparna Sarovar",
          "Lodha Paradise",
          "Ramky One",
          "Brigade Cornerstone",
          "Sobha Dream Acres",
          "Phoenix Golf Edge",
          "DSR Fortune Prime",
          "Jayabheri Orange County",
        ]);

        break;

      default:
        selectionItems.clear();
        break;
    }
    filteredSelectionItems.assignAll(selectionItems);
  }

  void searchSelection(String value) {
    if (value.trim().isEmpty) {
      filteredSelectionItems.assignAll(selectionItems);
      return;
    }
    filteredSelectionItems.assignAll(

      selectionItems.where(
            (item) => item.toLowerCase().contains(value.toLowerCase()),
      ).toList(),
    );
  }

  void openSelection({
    required String title,
    required String type,
    required TextEditingController controller,
  }) {
    selectionTitle.value = title;
    selectionType.value = type;
    currentSelectionController = controller;
    selectedSelectionItem.value = controller.text;
    searchController.clear();
    loadSelectionItems();
  }

  void confirmSelection() {
    if (selectedSelectionItem.value.isEmpty) {
      CommonSnackbar.show(
        type: SnackbarType.warning,
        message: AppStrings.selectOneItem,
      );
      return;
    }
    currentSelectionController.text =
        selectedSelectionItem.value;
     searchController.clear();
     filteredSelectionItems.assignAll(selectionItems);
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
    searchController.dispose();
    super.onClose();
  }
}