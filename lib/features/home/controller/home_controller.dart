import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/data/data.dart';
import 'package:islamic_app/features/audio/controller/audio_controller.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  AudioController audioController = AudioController();
  late Timer _timer;
  late bool serviceEnable;
  late PageController pageController;
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

  

  @override
  void onInit() {
    readData();
    super.onInit();
    pageController = PageController();
    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (Timer timer) {
        if (currentPage < 11) {
          currentPage++;
        } else {
          currentPage = 0;
        }
        pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      },
    );
  }
}
