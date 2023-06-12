import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/class/notification_manager.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hijri/hijri_calendar.dart';

class PrayTimeController extends GetxController {
  late SharedPreferences sharedPreferences;
  late String currentPray;
  late String prayTime;
  late PrayerTimes prayerTimes;
  late Coordinates coordinates;
  late CalculationParameters parameter;
  late PageController pageController;
  late String image;
  late DateTime dateTime = DateTime.now();
  late final LocalNotificationService service;
  bool isTapped = false;
  bool isTapped1 = false;
  bool isTapped2 = false;
  bool isTapped3 = false;
  bool isTapped4 = false;
  bool isTapped5 = false;
  String? hijri;

  showDate() {
    var today = HijriCalendar.now();
    hijri = today.fullDate();
  }

  isTapController() {
    isTapped = !isTapped;
    update();
  }

  isTapController1() {
    isTapped1 = !isTapped1;
    update();
  }

  isTapController2() {
    isTapped2 = !isTapped2;
    update();
  }

  isTapController3() {
    isTapped3 = !isTapped3;
    update();
  }

  isTapController4() {
    isTapped4 = !isTapped4;
    update();
  }

  isTapController5() {
    isTapped5 = !isTapped5;
    update();
  }

  initPryTime() {
    parameter = CalculationMethod.egyptian.getParameters();
    parameter.madhab = Madhab.shafi;
    coordinates = Coordinates(SharedPrefController().latitude ?? 31.4422405,
        SharedPrefController().longitude ?? 34.3772615);
    prayerTimes = PrayerTimes.today(coordinates, parameter);
    update();
  }

  @override
  void onInit() {
    showDate();
    initPryTime();
    service = LocalNotificationService();
    service.initialize();
    super.onInit();
  }
}
