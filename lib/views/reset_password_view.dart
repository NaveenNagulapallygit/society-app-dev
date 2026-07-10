import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society_app/constants/app_colors.dart';
import 'package:society_app/constants/app_images.dart';
import 'package:society_app/constants/app_strings.dart';
import 'package:society_app/controllers/reset_password_controller.dart';
import 'package:society_app/utils/validation_helper.dart';
import 'package:society_app/widgets/custom_textfield.dart';
import 'package:society_app/widgets/field_label.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      shape: BoxShape.circle,
                      boxShadow:  [
                        BoxShadow(
                          color: AppColors.shadow,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () => Get.back(),
                      icon:  Icon(
                        Icons.arrow_back_ios_new,
                        size: 18,
                      ),
                    ),
                  ),

                   SizedBox(height: 20),

                  Center(
                    child: SizedBox(
                      height: 220,
                      child: Image.asset(
                        AppImages.building,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                   SizedBox(height: 25),

                  Text(
                    AppStrings.resetPassword,
                    style:  TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                   SizedBox(height: 10),

                  Text(
                    AppStrings.createNewPassword,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),

                   SizedBox(height: 35),

                   FieldLabel(
                    title: AppStrings.newPassword,
                    isRequired: true,
                  ),

                   SizedBox(height: 10),

                  Obx(
                        () => CustomTextField(
                      controller: controller.passwordController,
                      hint: AppStrings.newPassword,
                      prefixIcon: Icons.lock_outline,
                      obscureText:
                      controller.isPasswordVisible.value,
                      suffixIcon: IconButton(
                        onPressed: controller.togglePassword,
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      validator:
                      ValidationHelper.validatePassword,
                    ),
                  ),

                   SizedBox(height: 20),

                   FieldLabel(
                    title: AppStrings.confirmPassword,
                    isRequired: true,
                  ),

                   SizedBox(height: 10),

                  Obx(
                        () => CustomTextField(
                      controller:
                      controller.confirmPasswordController,
                      hint: AppStrings.confirmPassword,
                      prefixIcon: Icons.lock_outline,
                      obscureText: controller
                          .isConfirmPasswordVisible.value,
                      suffixIcon: IconButton(
                        onPressed:
                        controller.toggleConfirmPassword,
                        icon: Icon(
                          controller
                              .isConfirmPasswordVisible
                              .value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      validator: (value) =>
                          ValidationHelper
                              .validateConfirmPassword(
                            value,
                            controller.passwordController.text,
                          ),
                    ),
                  ),

                   SizedBox(height: 35),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed:
                      controller.resetPassword,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        AppColors.primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        AppStrings.updatePassword,
                        style: TextStyle(
                          color:
                          Theme.of(context).cardColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}