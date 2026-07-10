import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society_app/constants/app_strings.dart';
import 'package:society_app/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.home,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {

          },
          icon:  Icon(Icons.menu),
        ),

        actions: [
          IconButton(
            onPressed: controller.logout,
            icon:  Icon(Icons.logout),
          ),
        ],
      ),

      body:  Center(
        child: Text(
          AppStrings.welcomeHome,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );

  }
}
