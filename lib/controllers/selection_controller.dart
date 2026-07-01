import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectionController extends GetxController {

  final TextEditingController searchController =
  TextEditingController();

  RxString title = ''.obs;

  RxString type = ''.obs;

  RxList<String> items = <String>[].obs;

  RxList<String> filteredItems = <String>[].obs;

  RxString selectedItem = ''.obs;

  @override
  void onInit() {
    super.onInit();

    final arguments = Get.arguments;

    title.value = arguments["title"] ?? "";

    type.value = arguments["type"] ?? "";

    loadItems();
  }

  void loadItems() {

    switch (type.value) {

      case "city":

        items.assignAll([
          "Hyderabad",
          "Chennai",
          "Coimbatore",
          "Bangalore",
          "Mumbai",
          "Delhi",
          "Pune",
          "Kolkata",
          "Ahmedabad",
          "Jaipur",
        ]);

        break;

      case "state":

        items.assignAll([
          "Telangana",
          "Tamil Nadu",
          "Karnataka",
          "Maharashtra",
          "Delhi",
          "Gujarat",
          "Rajasthan",
          "Kerala",
          "Andhra Pradesh",
          "West Bengal",
        ]);

        break;

      case "society":

        items.assignAll([
          "My Home Bhooja",
          "Prestige High Fields",
          "Aparna Sarovar",
          "Lodha Paradise",
          "Ramky One",
          "Brigade Cornerstone",
          "Sobha Dream Acres",
          "Phoenix Golf Edge",
          "DSR Fortune Prime",
          "Jayabheri Orange County",
        ]);

        break;

      default:

        items.clear();

        break;
    }

    filteredItems.assignAll(items);
  }

  void searchItem(String value) {

    if (value.trim().isEmpty) {

      filteredItems.assignAll(items);

      return;
    }

    filteredItems.assignAll(

      items.where(

            (item) => item
            .toLowerCase()
            .contains(
          value.toLowerCase(),
        ),

      ).toList(),

    );
  }

  void confirmSelection() {

    if (selectedItem.value.isEmpty) {

      Get.snackbar(
        "Selection Required",
        "Please select one item.",
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    Get.back(
      result: selectedItem.value,
    );
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}