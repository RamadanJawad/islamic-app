import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/routes/routes.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late CurvedAnimation curve =
      CurvedAnimation(parent: controller, curve: Curves.fastLinearToSlowEaseIn);

  @override
  void onInit() {
    controller.forward();
    update();
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.main);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
