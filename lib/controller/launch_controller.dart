import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';

class LaunchController extends GetxController
    with GetSingleTickerProviderStateMixin {

  late AnimationController controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  );
  late CurvedAnimation curve =
      CurvedAnimation(parent: controller, curve: Curves.fastLinearToSlowEaseIn);

  @override
  void onInit() {
    controller.forward();
    update();
    super.onInit();
    Future.delayed(Duration(seconds: 3), () {
      if (SharedPrefController().boarding == true) {
        Get.toNamed("/main_screen");
      }else{
        Get.toNamed("/boarding_screen");
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
}
