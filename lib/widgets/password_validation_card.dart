import 'package:flutter/material.dart';
import 'package:society_app/constants/app_colors.dart';
import 'package:society_app/constants/app_strings.dart';

class PasswordValidationCard extends StatelessWidget {

  final bool hasMinLength;
  final bool hasUpperCase;
  final bool hasLowerCase;
  final bool hasNumber;
  final bool hasSpecialCharacter;
  const PasswordValidationCard({
    super.key,
    required this.hasMinLength,
    required this.hasUpperCase,
    required this.hasLowerCase,
    required this.hasNumber,
    required this.hasSpecialCharacter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              AppStrings.passwordInclude,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.appTitle,
            ),
          ),
          const SizedBox(height: 15),

          condition(
            text: AppStrings.minLength,
            isValid: hasMinLength,
          ),

          const SizedBox(height: 10),

          condition(
            text: AppStrings.uppercase,
            isValid: hasUpperCase,
          ),

          const SizedBox(height: 10),

          condition(
            text: AppStrings.lowercase,
            isValid: hasLowerCase,
          ),

          const SizedBox(height: 10),

          condition(
            text: AppStrings.number,
            isValid: hasNumber,
          ),

          const SizedBox(height: 10),

          condition(
            text: AppStrings.specialCharacter,
            isValid: hasSpecialCharacter,
          ),
        ],
      ),
    );
  }

  Widget condition({
    required String text,
    required bool isValid,
}) {
    return Row(
      children: [
        Icon(
          isValid
               ? Icons.check_circle_outline
               : Icons.cancel_outlined,
          size: 24,
          color: isValid
                     ? AppColors.success
                     : AppColors.error,
        ),
        const SizedBox(height: 10),
        Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: isValid
                         ? AppColors.success
                         : AppColors.error,
              ),
            ),
        ),
      ],
    );
  }
}
