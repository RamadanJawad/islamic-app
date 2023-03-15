import 'dart:async';
import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/class/notification_manager.dart';
import 'package:islamic_app/data/data.dart';


class HomeController extends GetxController {
  late Timer _timer;
  late String currentPray;
  late final LocalNotificationService service;
  late DateTime dateTime = DateTime.now();
  late String prayTime;
  late PrayerTimes prayerTimes;
  late Coordinates coordinates;
  late bool serviceEnable;
  late CalculationParameters parameters;
  late PageController pageController;
  late String image;
  late var dua;

  int currentPage = 0;

  String ayha(index) {
    return Data.ayah[index]['text1'];
  }

  readData() async {
    dua = (Data.sunnah..shuffle()).first;
    update();
  }

  String tafseer(index) {
    return Data.ayah[index]['text2'];
  }

  String share(index) {
    String data = "${ayha(index)}\n${tafseer(index)}";
    return data;
  }

  void onPageChange(int index) {
    currentPage = index;
    update();
  }

  prayTimeFun() {
    parameters = CalculationMethod.egyptian.getParameters();
    parameters.madhab = Madhab.shafi;
    coordinates = Coordinates(31.4499667, 34.3929083);
    prayerTimes = PrayerTimes.today(coordinates, parameters);
  }

  @override
  void onInit() {
    readData();
    service = LocalNotificationService();
    service.initialize();
    super.onInit();
    // prayTimeFun();
    pageController = PageController();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (currentPage < 11) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }
}
