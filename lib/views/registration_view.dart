import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society_app/utils/validation_helper.dart';
import 'package:society_app/widgets/custom_textfield.dart';
import 'package:society_app/widgets/field_label.dart';
import 'package:society_app/widgets/occupant_switch_card.dart';
import 'package:society_app/widgets/owner_tenant_card.dart';
import 'package:society_app/widgets/role_card.dart';
import '../constants/app_colors.dart';
import '../controllers/registration_controller.dart';
import '../widgets/create_account_header.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      Theme.of(context).scaffoldBackgroundColor,

      body: Column(
        children: [
           CreateAccountHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding:  EdgeInsets.all(16),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:  EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow:  [
                          BoxShadow(
                            color: AppColors.shadow,
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child:  Icon(
                                  Icons.person_outline,
                                  color: Colors.white,
                                ),
                              ),

                               SizedBox(width: 12),

                               Text(
                                "Personal Information",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                           SizedBox(height: 25),

                           FieldLabel(
                            title: "Full Name",
                            isRequired: true,
                          ),

                           SizedBox(height: 8),

                          CustomTextField(
                            controller: controller.fullNameController,
                            hint: "Enter your full name",
                            prefixIcon: Icons.person_outline,
                            keyboardType: TextInputType.name,
                            validator: ValidationHelper.validateName,
                          ),

                           SizedBox(height: 18),

                           FieldLabel(
                            title: "Email Address",
                            isRequired: true,
                          ),

                           SizedBox(height: 8),

                          CustomTextField(
                            controller: controller.emailController,
                            hint: "Enter your email",
                            prefixIcon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                            validator: ValidationHelper.validateEmail,
                          ),

                           SizedBox(height: 18),

                           FieldLabel(
                            title: "Mobile Number",
                            isRequired: true,
                          ),

                           SizedBox(height: 8),

                          CustomTextField(
                            controller: controller.mobileController,
                            hint: "Enter your mobile number",
                            prefixIcon: Icons.phone_android_outlined,
                            keyboardType: TextInputType.phone,
                            validator: ValidationHelper.validateMobile,
                          ),

                           SizedBox(height: 18),

                           FieldLabel(
                            title: "Password",
                            isRequired: true,
                          ),

                           SizedBox(height: 8),

                          Obx(
                                () => CustomTextField(
                              controller: controller.passwordController,
                              hint: "Create password",
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

                           SizedBox(height: 18),

                           FieldLabel(
                            title: "Confirm Password",
                            isRequired: true,
                          ),

                           SizedBox(height: 8),

                          Obx(
                                () => CustomTextField(
                              controller:
                              controller.confirmPasswordController,
                              hint: "Confirm password",
                              prefixIcon: Icons.lock_outline,
                              obscureText:
                              controller.isConfirmPasswordVisible.value,
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
                                  ValidationHelper.validateConfirmPassword(
                                    value,
                                    controller.passwordController.text,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),

                     SizedBox(height: 20),

                    Container(
                      padding:  EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow:  [
                          BoxShadow(
                            color: AppColors.shadow,
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [

                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child:  Icon(
                                  Icons.groups_outlined,
                                  color: Colors.white,
                                ),
                              ),

                               SizedBox(width: 12),

                               Text(
                                "Select Your Role",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                           SizedBox(height: 15),

                          Obx(
                                () => Column(
                              children: [

                                RoleCard(
                                  title: "Society Admin",
                                  selected:
                                  controller.selectedRole.value ==
                                      "Society Admin",
                                  onTap: () {
                                    controller.selectRole(
                                      "Society Admin",
                                    );
                                  },
                                ),

                                RoleCard(
                                  title: "Security Guard",
                                  selected:
                                  controller.selectedRole.value ==
                                      "Security Guard",
                                  onTap: () {
                                    controller.selectRole(
                                      "Security Guard",
                                    );
                                  },
                                ),

                                RoleCard(
                                  title: "Resident",
                                  selected:
                                  controller.selectedRole.value ==
                                      "Resident",
                                  onTap: () {
                                    controller.selectRole(
                                      "Resident",
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),

                          Obx(
                                () {

                              if(controller.selectedRole.value != "Resident"){
                                return const SizedBox();
                              }
                              return Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [

                                   SizedBox(height:20),

                                   FieldLabel(
                                    title: "Resident Type",
                                    isRequired: true,
                                  ),

                                   SizedBox(height:15),
                                  OwnerTenantCard(
                                    selectedType:
                                    controller.residentType.value,
                                    onChanged: (value){
                                      controller.selectResidentType(
                                        value,
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                     SizedBox(height: 20),

                    Obx(
                          () {
                        if (controller.selectedRole.value != "Resident") {
                          return  SizedBox();
                        }

                        if (controller.residentType.value != "Owner") {
                          return  SizedBox();
                        }

                        return Column(
                          children: [
                            OccupantSwitchCard(
                              value: controller.isOccupant.value,
                              onChanged: controller.toggleOccupant,
                            ),

                            SizedBox(height: 20),

                          ],
                        );
                      },
                    ),

                    SizedBox(height: 20),

                    Obx(() {
                      if (controller.selectedRole.value.isEmpty) {
                        return  SizedBox();
                      }
                      return Container(
                        padding: EdgeInsets.all(20),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    Icons.apartment_outlined,
                                    color: Colors.white,
                                  ),
                                ),

                                 SizedBox(width: 12),

                                 Expanded(
                                  child: Text(
                                    "Society Information",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                             SizedBox(height: 25),

                             FieldLabel(
                                 title: "Select your City",
                                 isRequired: true
                             ),

                             SizedBox(height: 8),

                            CustomTextField(
                              controller: controller.cityController,
                              hint: "Select your City",
                              prefixIcon: Icons.location_city_outlined,
                              readOnly: true,
                              onTap: controller.openCitySelection,
                                suffixIcon:  Icon(Icons.keyboard_arrow_down),
                                validator: (value) => ValidationHelper.validateRequired(value, "City")
                            ),

                             SizedBox(height: 18),

                             FieldLabel(
                                 title: "Select your State",
                                 isRequired: true
                             ),

                             SizedBox(height: 8),

                            CustomTextField(
                              controller: controller.stateController,
                              hint: "Select your State",
                              prefixIcon: Icons.map_outlined,
                              readOnly: true,
                              onTap: controller.openStateSelection,
                              suffixIcon:  Icon(Icons.keyboard_arrow_down),
                                validator: (value) => ValidationHelper.validateRequired(value, "State")
                            ),

                             SizedBox(height: 18),

                             FieldLabel(
                                 title: "Select your Society",
                                 isRequired: true
                             ),

                             SizedBox(height: 8),

                            CustomTextField(
                              controller: controller.societyController,
                              hint: "Select your Society",
                              prefixIcon: Icons.apartment_outlined,
                              readOnly: true,
                              onTap: controller.openSocietySelection,
                              suffixIcon: Icon(Icons.keyboard_arrow_down),
                                validator: (value) => ValidationHelper.validateRequired(value, "Society"),
                            ),

                             SizedBox(height: 18),

                            if (controller.selectedRole.value == "Resident") ...[
                               FieldLabel(
                                   title: "Tower Name / Street Name",
                                   isRequired: true
                               ),

                               SizedBox(height: 10),

                              CustomTextField(
                                controller: controller.towerController,
                                hint: "Enter Tower Name / Street Name",
                                prefixIcon: Icons.apartment_outlined,
                                validator: ValidationHelper.validateTower,
                              ),

                               SizedBox(height: 20),

                               FieldLabel(
                                   title: "Door No / Flat No",
                                   isRequired: true
                               ),

                               SizedBox(height: 10),

                              CustomTextField(
                                controller: controller.flatController,
                                hint: "Enter Door No / Flat No",
                                prefixIcon: Icons.home_outlined,
                                validator: ValidationHelper.validateFlatNumber,
                              ),

                               SizedBox(height: 20),
                            ],
                          ],
                        ),
                      );
                    }),

                    Obx(() => SizedBox(
                        height: controller.selectedRole.value.isNotEmpty ? 20 : 0
                    )
                    ),


                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: controller.continueRegistration,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Theme.of(context).cardColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                     SizedBox(height: 30),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}