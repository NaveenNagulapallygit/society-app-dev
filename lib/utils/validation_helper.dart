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
      return "Enter a Name";
    }

    if (!isValidName(value)) {
      return "Enter a valid name";
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter a email address";
    }

    if (!isValidEmail(value)) {
      return "Enter a valid email address";
    }
    return null;
  }

  static String? validateMobile(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter a Mobile number";
    }

    if (!isValidMobile(value)) {
      return "Enter a valid mobile number";
    }

    return null;
  }

  static String? validateMobileOrEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter a Email or Mobile number";
    }

    if (!isValidMobileOrEmail(value)) {
      return "Enter a valid Email or Mobile number";
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return " Enter a Password";
    }

    if (!isValidPassword(value)) {
      return "Enter valid password";
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? value,
      String password,
      ) {
    if (value == null || value.isEmpty) {
      return "Enter a Confirm Password";
    }

    if (!isPasswordMatched(password, value)) {
      return "Passwords do not match";
    }

    return null;
  }

  static String? validateOtp(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter 6-digit OTP";
    }

    if (!isValidOtp(value)) {
      return "Enter a valid 6-digit OTP";
    }

    return null;
  }

  static String? validateFlatNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter a Flat Number";
    }

    if (!isValidFlatNumber(value)) {
      return "Enter a valid Flat Number";
    }

    return null;
  }

  static String? validateTower(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter a Tower Name / Street Name";
    }

    return null;
  }


  static String? validateCity(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please select a City";
    }
    return null;
  }

  static String? validateState(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please select a State";
    }
    return null;
  }

  static String? validateSociety(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please select a Society";
    }
    return null;
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