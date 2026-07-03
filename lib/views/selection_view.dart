import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society_app/constants/app_strings.dart';
import '../constants/app_colors.dart';
import '../controllers/selection_controller.dart';

class SelectionView extends GetView<SelectionController> {
  const SelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon:  Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Obx(
              () => Text(
            "Select your ${controller.title.value}",
            style:  TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(18),
          child: Column(
            children: [
              TextField(
                controller: controller.searchController,
                decoration: InputDecoration(
                  hintText: "Search your ${controller.title.value}",
                  prefixIcon:  Icon(
                    Icons.search,
                    size: 20,
                  ),
                  contentPadding:  EdgeInsets.symmetric(
                    vertical: 14,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:  BorderSide(
                      color: AppColors.primary,
                    ),
                  ),
                ),
                onChanged: controller.searchItem,
              ),
               SizedBox(height: 20),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: Obx(
                        () {
                      if (controller.filteredItems.isEmpty) {
                        return Center(
                          child: Text(
                            AppStrings.noDataFound,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      }

                      return RadioGroup<String>(
                        groupValue: controller.selectedItem.value,
                        onChanged: (String? value) {
                          if (value != null) {
                            controller.selectedItem.value = value;
                          }
                        },
                        child: ListView.separated(
                          itemCount: controller.filteredItems.length,
                          separatorBuilder: (_, _) => Divider(
                            height: 1,
                            color: Colors.grey.shade300,
                          ),
                          itemBuilder: (context, index) {
                            final item = controller.filteredItems[index];

                            return InkWell(
                              onTap: () {
                                controller.selectedItem.value = item;
                              },
                              child: Container(
                                height: 52,
                                padding:  EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        item,
                                        style:  TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Radio<String>(
                                      value: item,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: 20),

              SizedBox(
                width: 110,
                height: 45,
                child: Obx(
                      () => ElevatedButton(
                    onPressed: controller.selectedItem.value.isEmpty
                        ? null
                        : controller.confirmSelection,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      disabledBackgroundColor: Colors.grey.shade300,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child:  Text(
                      AppStrings.confirm,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
               SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}