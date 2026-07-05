import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society_app/constants/app_strings.dart';
import 'package:society_app/utils/validation_helper.dart';
import 'package:society_app/widgets/custom_textfield.dart';
import 'package:society_app/widgets/field_label.dart';
import 'package:society_app/widgets/occupant_switch_card.dart';
import 'package:society_app/widgets/owner_tenant_card.dart';
import 'package:society_app/widgets/role_card.dart';
import '../constants/app_colors.dart';
import '../controllers/registration_controller.dart';
import '../utils/common_snackbar.dart';
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
            child: Obx(() {
            return controller.currentPage.value == 0
                ? registrationPage(context)
                : societyInfoPage(context);
            }
            ),
          ),
        ],
      ),
    );
  }

  Widget registrationPage(BuildContext context) {
    return SingleChildScrollView(
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
                        AppStrings.personalInformation,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 25),

                  FieldLabel(
                    title: AppStrings.fullName,
                    isRequired: true,
                  ),

                  SizedBox(height: 8),

                  CustomTextField(
                    controller: controller.fullNameController,
                    hint: AppStrings.enterFullName,
                    prefixIcon: Icons.person_outline,
                    keyboardType: TextInputType.name,
                    validator: ValidationHelper.validateName,
                  ),

                  SizedBox(height: 18),

                  FieldLabel(
                    title: AppStrings.emailAddress,
                    isRequired: true,
                  ),

                  SizedBox(height: 8),

                  CustomTextField(
                    controller: controller.emailController,
                    hint: AppStrings.enterYourEmail,
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: ValidationHelper.validateEmail,
                  ),

                  SizedBox(height: 18),

                  FieldLabel(
                    title: AppStrings.mobileNumber,
                    isRequired: true,
                  ),

                  SizedBox(height: 8),

                  CustomTextField(
                    controller: controller.mobileController,
                    hint: AppStrings.enterYourMobileNumber,
                    prefixIcon: Icons.phone_android_outlined,
                    keyboardType: TextInputType.phone,
                    validator: ValidationHelper.validateMobile,
                  ),

                  SizedBox(height: 18),

                  FieldLabel(
                    title: AppStrings.password,
                    isRequired: true,
                  ),

                  SizedBox(height: 8),

                  Obx(
                        () => CustomTextField(
                      controller: controller.passwordController,
                      hint: AppStrings.createPassword,
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
                    title: AppStrings.confirmPassword,
                    isRequired: true,
                  ),

                  SizedBox(height: 8),

                  Obx(
                        () => CustomTextField(
                      controller:
                      controller.confirmPasswordController,
                      hint: AppStrings.confirmPassword,
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
                        AppStrings.selectYourRole,
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
                          title: AppStrings.societyAdmin,
                          selected:
                          controller.selectedRole.value ==
                              AppStrings.societyAdmin,
                          onTap: () {
                            controller.selectRole(
                              AppStrings.societyAdmin,
                            );
                          },
                        ),

                        RoleCard(
                          title: AppStrings.securityGuard,
                          selected:
                          controller.selectedRole.value ==
                              AppStrings.securityGuard,
                          onTap: () {
                            controller.selectRole(
                              AppStrings.securityGuard,
                            );
                          },
                        ),

                        RoleCard(
                          title: AppStrings.resident,
                          selected:
                          controller.selectedRole.value ==
                              AppStrings.resident,
                          onTap: () {
                            controller.selectRole(
                              AppStrings.resident,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Obx(
                        () {

                      if(controller.selectedRole.value != AppStrings.resident){
                        return const SizedBox();
                      }
                      return Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          SizedBox(height:20),
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

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: controller.continueRegistration,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  AppStrings.next,
                  style:  TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

             SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget societyInfoPage(BuildContext context) {
    return SingleChildScrollView(
      padding:  EdgeInsets.all(16),
      child: Container(
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
                    AppStrings.societyInformation,
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
                title: AppStrings.selectYourCity,
                isRequired: true
            ),

            SizedBox(height: 8),

            CustomTextField(
                controller: controller.cityController,
                hint: AppStrings.selectYourCity,
                prefixIcon: Icons.location_city_outlined,
                readOnly: true,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) => selectionWidget(
                      context,
                      AppStrings.city,
                    ),
                  );
                },
                suffixIcon:  Icon(Icons.keyboard_arrow_down),
                validator: (value) => ValidationHelper.validateRequired(value, "City")
            ),

            SizedBox(height: 18),

            FieldLabel(
                title: AppStrings.selectYourState,
                isRequired: true
            ),

            SizedBox(height: 8),

            CustomTextField(
                controller: controller.stateController,
                hint: AppStrings.selectYourState,
                prefixIcon: Icons.map_outlined,
                readOnly: true,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) => selectionWidget(
                      context,
                      AppStrings.state,
                    ),
                  );
                },
                suffixIcon:  Icon(Icons.keyboard_arrow_down),
                validator: (value) => ValidationHelper.validateRequired(value, "State")
            ),

            SizedBox(height: 18),

            FieldLabel(
                title: AppStrings.selectYourSociety,
                isRequired: true
            ),

            SizedBox(height: 8),

            CustomTextField(
              controller: controller.societyController,
              hint: AppStrings.selectYourSociety,
              prefixIcon: Icons.apartment_outlined,
              readOnly: true,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => selectionWidget(
                    context,
                    AppStrings.society,
                  ),
                );
              },
              suffixIcon: Icon(Icons.keyboard_arrow_down),
              validator: (value) => ValidationHelper.validateRequired(value, "Society"),
            ),

            SizedBox(height: 18),

            if (controller.selectedRole.value == AppStrings.resident) ...[
              FieldLabel(
                  title: AppStrings.towerName,
                  isRequired: true
              ),

              SizedBox(height: 10),

              CustomTextField(
                controller: controller.towerController,
                hint: AppStrings.enterTowerName,
                prefixIcon: Icons.apartment_outlined,
                validator: ValidationHelper.validateTower,
              ),

              SizedBox(height: 20),

              FieldLabel(
                  title: AppStrings.doorNumber,
                  isRequired: true
              ),

              SizedBox(height: 10),

              CustomTextField(
                controller: controller.flatController,
                hint: AppStrings.enterDoorNumber,
                prefixIcon: Icons.home_outlined,
                validator: ValidationHelper.validateFlatNumber,
              ),

              SizedBox(height: 20),
            ],

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: controller.previousPage,
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: BorderSide(
                        color: AppColors.primary,
                      ),
                    ),
                    child: Text(
                      AppStrings.back,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                 SizedBox(width: 15),

                Expanded(
                  child: ElevatedButton(
                    onPressed: controller.confirmRegistration,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      minimumSize:  Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      AppStrings.confirm,
                      style:  TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget selectionWidget(BuildContext context, String type,) {
    controller.selectionType.value = type;
    controller.loadSelectionItems();
    return Container(
      height: Get.height * 0.85,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 18,
            ),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25),
              ),
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Text(
                    type == AppStrings.city
                        ? AppStrings.selectCity
                        : type == AppStrings.state
                        ? AppStrings.selectState
                        : AppStrings.selectSociety,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

           SizedBox(height: 20),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextField(
              controller: controller.searchController,
              hint: AppStrings.search,
              prefixIcon: Icons.search,
              onChanged: controller.searchSelection,
            ),
          ),

          SizedBox(height: 20),

          Expanded(
            child: Obx(
                  () => RadioGroup<String>(
                groupValue: controller.selectedSelectionItem.value,
                onChanged: (value) {
                  controller.selectedSelectionItem.value = value ?? '';
                },
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemCount: controller.filteredSelectionItems.length,
                  itemBuilder: (_, index) {
                    final item =
                    controller.filteredSelectionItems[index];

                    return Card(
                      margin: EdgeInsets.only(bottom: 10),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(12),
                      ),
                      child: RadioListTile<String>(
                        value: item,
                        activeColor: AppColors.primary,
                        title: Text(
                          item,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (controller.selectedSelectionItem.value.isEmpty) {
                    CommonSnackbar.show(
                      type: SnackbarType.warning,
                      message: AppStrings.selectOneItem,
                    );

                    return;
                  }

                  if (type == AppStrings.city) {
                    controller.cityController.text =
                        controller.selectedSelectionItem.value;
                  }

                  if (type == AppStrings.state) {
                    controller.stateController.text =
                        controller.selectedSelectionItem.value;
                  }

                  if (type == AppStrings.society) {
                    controller.societyController.text =
                        controller.selectedSelectionItem.value;
                  }

                  controller.searchController.clear();
                  controller.selectedSelectionItem.value = "";
                  controller.filteredSelectionItems.clear();

                  Get.back();
                },
                child: Text(
                  AppStrings.confirm,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}