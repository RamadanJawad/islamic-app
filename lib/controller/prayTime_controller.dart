import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/class/notification_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrayTimeController extends GetxController {
  DateTime selectedDate = DateTime.now();
  late SharedPreferences sharedPreferences;
  late double lat;
  late final LocalNotificationService service;
  late double lng;

  int currentDateSelectedIndex = 0;
  ScrollController scrollController = ScrollController();

  onClick(int index) {
    currentDateSelectedIndex = index;
    selectedDate = DateTime.now().add(Duration(days: index));
    update();
  }

  @override
  void onInit() {
    service = LocalNotificationService();
    service.initialize();
    super.onInit();
  }
}
