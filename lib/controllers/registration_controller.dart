import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society_app/constants/app_strings.dart';
import 'package:society_app/routing/app_routes.dart';
import 'package:society_app/utils/common_snackbar.dart';
import 'package:society_app/utils/validation_helper.dart';

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

  final RxList<String> cityItems = <String>[].obs;

  final RxList<String> stateItems = <String>[].obs;

  final RxList<String> societyItems = <String>[].obs;

  final RxList<String> filteredSelectionItems = <String>[].obs;

  final RxString selectedSelectionItem = ''.obs;

  late TextEditingController currentSelectionController;

  final RxBool hasMinLength = false.obs;

  final RxBool hasUpperCase = false.obs;

  final RxBool hasLowerCase = false.obs;

  final RxBool hasNumber = false.obs;

  final RxBool hasSpecialCharacter = false.obs;

  final FocusNode passwordFocusNode = FocusNode();

  final RxBool showPasswordRules = false.obs;


  @override
  void onInit() {
    super.onInit();
    passwordFocusNode.addListener(() {
      showPasswordRules.value = passwordFocusNode.hasFocus;
    });
  loadSelectionItems();
  }

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


  void validatePasswordRules(String password) {
    hasMinLength.value =
        password.length >= 8 && password.length <= 20;

    hasUpperCase.value =
        RegExp(r'[A-Z]').hasMatch(password);

    hasLowerCase.value =
        RegExp(r'[a-z]').hasMatch(password);

    hasNumber.value =
        RegExp(r'[0-9]').hasMatch(password);

    hasSpecialCharacter.value =
        RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password);
  }

  String getFormattedDate() {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    final now = DateTime.now();
    return "${months[now.month - 1]} ${now.day}, ${now.year}";
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

    final fieldsToValidate = <TextEditingController>[
      cityController,
      stateController,
      societyController,
    ];

    if (selectedRole.value == AppStrings.resident) {
      fieldsToValidate.addAll([
        towerController,
        flatController,
      ]);
    }
    if(!ValidationHelper.validateSocietyInfoFields(fieldsToValidate)) {
        CommonSnackbar.show(
          type: SnackbarType.warning,
          message: AppStrings.fillSocietyDetails,
        );
        return;
    }
    CommonSnackbar.show(
      type: SnackbarType.success,
      message: AppStrings.registrationSuccess,
    );
    Get.toNamed(
      Routes.approvalPending,
      arguments: {
        "fullName": fullNameController.text.trim(),
        "mobileNumber": mobileController.text.trim(),
        "email": emailController.text.trim(),
        "role": selectedRole.value,
        "registeredOn": getFormattedDate(),
      },
    );
  }

  void loadSelectionItems() {
    cityItems.assignAll([
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

    stateItems.assignAll([
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

    societyItems.assignAll([
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
  }

  void searchSelection(String value) {

    List<String> sourceList = [];

    switch (selectionType.value) {

      case AppStrings.city:
        sourceList = cityItems;
        break;

      case AppStrings.state:
        sourceList = stateItems;
        break;

      case AppStrings.society:
        sourceList = societyItems;
        break;
    }

    if (value.trim().isEmpty) {
      filteredSelectionItems.assignAll(sourceList);
      return;
    }

    filteredSelectionItems.assignAll(
      sourceList.where(
            (item) =>
            item.toLowerCase().contains(value.toLowerCase()),
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

    searchController.clear();

    switch (type) {

      case AppStrings.city:
        filteredSelectionItems.assignAll(cityItems);
        break;

      case AppStrings.state:
        filteredSelectionItems.assignAll(stateItems);
        break;

      case AppStrings.society:
        filteredSelectionItems.assignAll(societyItems);
        break;
    }

    selectedSelectionItem.value = controller.text;
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
    switch (selectionType.value) {

      case AppStrings.city:
        filteredSelectionItems.assignAll(cityItems);
        break;

      case AppStrings.state:
        filteredSelectionItems.assignAll(stateItems);
        break;

      case AppStrings.society:
        filteredSelectionItems.assignAll(societyItems);
        break;
    }
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
    passwordFocusNode.dispose();
    super.onClose();
  }
}