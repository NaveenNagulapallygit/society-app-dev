import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society_app/constants/app_colors.dart';
import 'package:society_app/constants/app_images.dart';
import 'package:society_app/constants/app_strings.dart';
import 'package:society_app/controllers/forgot_password_controller.dart';
import 'package:society_app/utils/validation_helper.dart';
import 'package:society_app/widgets/custom_textfield.dart';
import 'package:society_app/widgets/field_label.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

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
                    AppStrings.forgotPassword.replaceAll('?', ''),
                    style:  TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    AppStrings.enterMailRequest,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                    ),
                  ),

                   SizedBox(height: 35),

                   FieldLabel(
                    title: AppStrings.mobileEmail,
                    isRequired: true,
                  ),

                   SizedBox(height: 10),

                  CustomTextField(
                    controller: controller.mobileEmailController,
                    hint: AppStrings.enterEmailOrMobile,
                    prefixIcon: Icons.phone_android_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: ValidationHelper.validateMobileOrEmail,
                  ),

                   SizedBox(height: 35),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: controller.sendOtp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child:  Text(
                        AppStrings.sendOtp,
                        style: TextStyle(
                          color: Colors.white,
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