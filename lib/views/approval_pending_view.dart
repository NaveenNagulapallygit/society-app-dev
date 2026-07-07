import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:society_app/constants/app_colors.dart';
import 'package:society_app/constants/app_images.dart';
import 'package:society_app/constants/app_strings.dart';

class ApprovalPendingView extends StatelessWidget {
   ApprovalPendingView({super.key});

  final Map<String, dynamic> userData = Map<String, dynamic>.from(Get.arguments ?? {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).cardColor,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding:  EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.approvalPendingIcon,
                width: 180,
                height: 180,
                fit: BoxFit.contain,
              ),
               SizedBox(height: 15),
              Text(
                AppStrings.approvalPending,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: AppColors.appTitle,
                ),
              ),
               SizedBox(height: 5),
              Text(
                AppStrings.accountUnderReview,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
               SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  AppStrings.accountReviewDescription,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.appDescription,
                  ),
                ),
              ),
               SizedBox(height: 30),

              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.lightDivider),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/user.svg",
                              height: 20,
                              width: 20,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                           SizedBox(width: 14),
                          Expanded(
                            child: Text(
                              AppStrings.yourAccountDetails,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: AppColors.appTitle,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 8
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.pendingCardColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: AppColors.pendingStatusColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                 SizedBox(width: 8),
                                Text(
                                  AppStrings.pending.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.pendingStatusColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                     AccountInfoTile(
                      iconPath: "assets/icons/user.svg",
                      label: AppStrings.fullName,
                      value: userData["fullName"] ?? "" ,
                    ),
                     SizedBox(height: 15),

                     AccountInfoTile(
                      iconPath: "assets/icons/phone.svg",
                      label: AppStrings.mobileNumber,
                      value: userData["mobileNumber"] ?? "",
                    ),
                     SizedBox(height: 15),

                     AccountInfoTile(
                      iconPath: "assets/icons/mail.svg",
                      label: AppStrings.emailAddress,
                      value: userData["email"] ?? "",
                    ),
                     SizedBox(height: 15),

                    Row(
                      children: [
                        Expanded(
                          child: AccountInfoTile(
                            iconPath: "assets/icons/security.svg",
                            label: AppStrings.role,
                            value: userData["role"] ?? "",
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: AccountInfoTile(
                            iconPath: "assets/icons/calendar.svg",
                            label: AppStrings.registeredOn,
                            value: userData["registeredOn"] ?? "",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AccountInfoTile extends StatelessWidget {
  final String iconPath;
  final String label;
  final String value;

  const AccountInfoTile({super.key,
    required this.iconPath,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14
      ),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(14),
            ),
            child: SvgPicture.asset(
              iconPath,
              height: 20,
              width: 20,
              fit: BoxFit.scaleDown,
            ),
          ),
           SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: AppColors.appSubTitle,
                  ),
                ),
                 SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.appTitle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
