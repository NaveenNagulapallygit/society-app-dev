import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society_app/constants/app_images.dart';
import 'package:society_app/controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    controller;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Image.asset(
            AppImages.splashImage,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

