import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society_app/constants/app_colors.dart';
import 'package:society_app/constants/app_images.dart';
import 'package:society_app/constants/app_strings.dart';
import 'package:society_app/controllers/otp_controller.dart';
import 'package:society_app/widgets/otp_textfield.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

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

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    shape: BoxShape.circle,
                    boxShadow: [
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
                  AppStrings.otpVerification,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  AppStrings.otp6digits,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),

                SizedBox(height: 35),

                Text(
                  AppStrings.enterOtp,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    6,
                        (index) => OtpTextField(
                      controller:
                      controller
                          .otpControllers[index],
                      context: context,
                      isFirst: index == 0,
                      isLast: index == 5,
                    ),
                  ),
                ),

                SizedBox(height: 15),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed:
                    controller.resendOtp,
                    child: Text(
                      AppStrings.resendOtp,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight:
                        FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed:
                    controller.verifyOtp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      AppColors.primary,
                      elevation: 0,
                      shape:
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(
                            15),
                      ),
                    ),
                    child:  Text(
                      AppStrings.verifyOtp,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight:
                        FontWeight.w600,
                      ),
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