import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:islamic_app/features/home/controller/home_controller.dart';

class TasabihController extends GetxController
    with GetTickerProviderStateMixin {
  AnimationController? animation;
  String selectedItem = 'سبحان الله';
  int value = 0;
  int role = 1;
  HomeController homeController = Get.find();
  bool isBannerAd = false;
  late BannerAd bannerAd;
  final jobRoleDropdownCtrl = TextEditingController();
  late double percentage;

  initBannerAd() {
    bannerAd = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: "ca-app-pub-8189351478187072/7716406550",
        listener: BannerAdListener(onAdLoaded: (ad) {
          print("Ad loaded !");
          isBannerAd = true;
          update();
        }, onAdFailedToLoad: (ad, error) {
          isBannerAd = false;
          print('BannerAd failed to load: $error');
          ad.dispose();
          update();
        }),
        request: const AdRequest());
    bannerAd.load();
  }

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
    initBannerAd();
    updatePercent();
    super.onInit();
    animation =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat();
  }

  @override
  void dispose() {
    animation!.dispose();
    super.dispose();
  }
}
