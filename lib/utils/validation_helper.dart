import 'package:flutter/cupertino.dart';
import 'package:society_app/constants/app_strings.dart';

class ValidationHelper {
  ValidationHelper._();

  static final RegExp _emailRegex = RegExp(
    r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$',
  );

  static final RegExp _mobileRegex = RegExp(
    r'^[6-9]\d{9}$',
  );

  static final RegExp _passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$',
  );

  static final RegExp _nameRegex = RegExp(
    r'^[A-Za-z ]{3,}$',
  );

  static final RegExp _otpRegex = RegExp(
    r'^\d{6}$',
  );

  static final RegExp _flatRegex = RegExp(
    r'^[A-Za-z0-9\-\/ ]+$',
  );

  // --- Validation Checks (Returning bool) ---
  static bool isValidCity(String value) {
    return value.trim().isNotEmpty;
  }

  static bool isValidState(String value) {
    return value.trim().isNotEmpty;
  }

  static bool isValidSociety(String value) {
    return value.trim().isNotEmpty;
  }

  static bool isValidEmail(String email) {
    return _emailRegex.hasMatch(email.trim());
  }

  static bool isValidMobile(String mobile) {
    return _mobileRegex.hasMatch(mobile.trim());
  }

  static bool isValidMobileOrEmail(String value) {
    return isValidEmail(value) || isValidMobile(value);
  }

  static bool isValidPassword(String password) {
    return _passwordRegex.hasMatch(password);
  }

  static bool isValidName(String name) {
    return _nameRegex.hasMatch(name.trim());
  }

  static bool isValidOtp(String otp) {
    return _otpRegex.hasMatch(otp.trim());
  }

  static bool isValidFlatNumber(String value) {
    return _flatRegex.hasMatch(value.trim());
  }

  static bool isValidTower(String value) {
    return value.trim().isNotEmpty;
  }

  static bool isRequired(String value) {
    return value.trim().isNotEmpty;
  }

  static bool isPasswordMatched(
      String password,
      String confirmPassword,
      ) {
    return password == confirmPassword;
  }

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.enterName;
    }

    if (!isValidName(value)) {
      return AppStrings.enterValidName;
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.enterEmailAddress;
    }

    if (!isValidEmail(value)) {
      return AppStrings.enterValidEmailAddress;
    }
    return null;
  }

  static String? validateMobile(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.enterMobileNumber;
    }

    if (!isValidMobile(value)) {
      return AppStrings.enterValidMobileNumber;
    }

    return null;
  }

  static String? validateMobileOrEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.enterEmailOrMobile;
    }

    if (!isValidMobileOrEmail(value)) {
      return AppStrings.enterValidEmailOrMobile;
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.enterPassword;
    }

    if (!isValidPassword(value)) {
      return AppStrings.enterValidPassword;
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? value,
      String password,
      ) {
    if (value == null || value.isEmpty) {
      return AppStrings.enterConfirmPassword;
    }

    if (!isPasswordMatched(password, value)) {
      return AppStrings.passwordDoNotMatch;
    }

    return null;
  }

  static String? validateOtp(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.otp6digits;
    }

    if (!isValidOtp(value)) {
      return AppStrings.enterValidOtp6Digit;
    }

    return null;
  }

  static String? validateFlatNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.enterFlatNumber;
    }

    if (!isValidFlatNumber(value)) {
      return AppStrings.enterValidFlatNumber;
    }

    return null;
  }

  static String? validateTower(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.enterTowerName;
    }

    return null;
  }


  static String? validateCity(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.selectACity;
    }
    return null;
  }

  static String? validateState(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.selectAState;
    }
    return null;
  }

  static String? validateSociety(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.selectASociety;
    }
    return null;
  }

  static bool validateSocietyInfoFields(List<TextEditingController> controllers) {
     for(final field in controllers) {
       if(field.text.trim().isEmpty) {
          return false;
       }
     }
     return true;
  }

  static String? validateRequired(
      String? value,
      String fieldName,
      ) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required";
    }

    return null;
  }
}