import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society_app/constants/app_strings.dart';
import 'package:society_app/routing/app_routes.dart';
import 'package:society_app/utils/validation_helper.dart';
import 'package:society_app/widgets/custom_textfield.dart';
import 'package:society_app/widgets/login_option_button.dart';

import '../constants/app_colors.dart';
import '../constants/app_images.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin:  EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  height: Get.height * 0.35,
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      image: AssetImage(AppImages.building),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [

                        CustomTextField(
                          controller: controller.mobileController,
                          hint: AppStrings.enterEmailOrMobile,
                          prefixIcon: Icons.phone_android,
                          keyboardType: TextInputType.emailAddress,
                          validator: ValidationHelper.validateMobileOrEmail,
                        ),

                         SizedBox(height: 20),

                        Obx(
                              () => CustomTextField(
                            controller: controller.passwordController,
                            hint: AppStrings.enterPassword,
                            prefixIcon: Icons.lock_outline,
                            obscureText:
                            controller.isPasswordVisible.value,
                            validator:
                            ValidationHelper.validatePassword,
                            suffixIcon: IconButton(
                              onPressed: controller.togglePassword,
                              icon: Icon(
                                controller.isPasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                        ),

                         SizedBox(height: 10),

                        Obx(
                              () => Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: controller.rememberMe.value,
                                    onChanged:
                                    controller.toggleRememberMe,
                                    activeColor: AppColors.primary,
                                  ),

                                   Text(
                                     AppStrings.rememberMe,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),

                              TextButton(
                                onPressed: () {
                                  Get.toNamed(
                                    Routes.forgotPassword,
                                  );
                                },
                                child: Text(
                                  AppStrings.forgotPassword,
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: controller.login,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                AppStrings.login,
                                style: TextStyle(
                                  color: Theme.of(context).cardColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text(
                               AppStrings.newUser,
                              style: TextStyle(fontSize: 15),
                            ),

                            SizedBox(width: 5),

                            GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  Routes.registration,
                                );
                              },
                              child: Text(
                                AppStrings.register,
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 20),
                        Divider(height: 1),

                        LoginOptionButton(
                          icon: Icons.admin_panel_settings_outlined,
                          title: AppStrings.loginAsAdmin,
                          onTap: () {

                          },
                        ),

                        Divider(height: 1),

                        LoginOptionButton(
                          icon: Icons.apartment_outlined,
                          title: AppStrings.loginAsResident,
                          onTap: () {

                          },
                        ),

                        Divider(height: 1),

                        LoginOptionButton(
                          icon: Icons.security_outlined,
                          title: AppStrings.loginAsSecurity,
                          onTap: () {

                          },
                        ),

                        Divider(height: 1),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}