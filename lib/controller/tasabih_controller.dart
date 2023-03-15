import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TasabihController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController animation;
  String selectedItem = 'سبحان الله';
  int value = 0;
  int role = 1;
  final jobRoleDropdownCtrl = TextEditingController();
  late double percentage;

  List<String> items = [
    "سبحان الله",
    "الحمد الله",
    "لا اله الا الله",
    "الله واكبر",
    "سبحان الله وبحمده,سبحان الله العظيم",
    "لا حول ولا قوة الا بالله",
    "استغفر الله العظيم واتوب اليه",
    "اللهم صلي على سيدنا محمد"
  ];
  updatePercent() {
    percentage = 0;
    value = percentage.toInt();
    update();
  }

  onChange(select) {
    selectedItem = select;
    value = 0;
    role = 1;
    update();
  }

  checkPercent() {
    if (value < 100) {
      value += 1;
      HapticFeedback.heavyImpact();
    } else {
      value = 0;
      role++;
    }
    update();
  }

  resetNumber() {
    value = 0;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    updatePercent();

    super.onInit();
    animation = AnimationController(vsync: this, duration: Duration(seconds: 7))
      ..repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animation.dispose();
    jobRoleDropdownCtrl.dispose();
  }
}
