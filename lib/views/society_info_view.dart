import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society_app/utils/validation_helper.dart';
import 'package:society_app/widgets/custom_textfield.dart';
import '../constants/app_colors.dart';
import '../controllers/society_info_controller.dart';
import '../widgets/create_account_header.dart';
import '../widgets/field_label.dart';

class SocietyInfoView extends GetView<SocietyInfoController> {
  const SocietyInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: Column(
        children: [
           CreateAccountHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding:  EdgeInsets.all(15),

              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
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
                            isRequired: true,
                          ),

                           SizedBox(height: 8),

                          CustomTextField(
                            controller: controller.cityController,
                            hint: "Select your City",
                            prefixIcon: Icons.location_city_outlined,
                            readOnly: true,
                            onTap: controller.openCitySelection,
                            suffixIcon: Icon(
                              Icons.keyboard_arrow_down,
                            ),
                          ),

                           SizedBox(height: 18),

                           FieldLabel(
                            title: "Select your State",
                            isRequired: true,
                          ),

                           SizedBox(height: 8),

                          CustomTextField(
                            controller: controller.stateController,
                            hint: "Select your State",
                            prefixIcon: Icons.map_outlined,
                            readOnly: true,
                            onTap: controller.openStateSelection,
                            suffixIcon: Icon(
                              Icons.keyboard_arrow_down,
                            ),
                          ),

                           SizedBox(height: 18),

                           FieldLabel(
                            title: "Select your Society",
                            isRequired: true,
                          ),

                           SizedBox(height: 8),

                          CustomTextField(
                            controller: controller.societyController,
                            hint: "Select your Society",
                            prefixIcon: Icons.apartment_outlined,
                            readOnly: true,
                            onTap: controller.openSocietySelection,
                            suffixIcon:  Icon(
                              Icons.keyboard_arrow_down,
                            ),
                          ),

                           SizedBox(height: 18),

                           if(controller.isResident)... [
                             FieldLabel(
                               title: "Tower Name / Street Name",
                               isRequired: true,
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
                               isRequired: true,
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
                    ),

                    SizedBox(height: 20),

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