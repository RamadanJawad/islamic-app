import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:islamic_app/routes/routes.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late InterstitialAd interstitialAd;
  bool isInterstitialAd = false;
  late CurvedAnimation curve =
      CurvedAnimation(parent: controller, curve: Curves.fastLinearToSlowEaseIn);

  showInterstitialAd() {
    if (isInterstitialAd) {
      interstitialAd.show();
      interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (ad) {
          ad.dispose();
          isInterstitialAd = false;
          update();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          isInterstitialAd = false;
        },
      );
    }
  }

  initInterstitialAd() {
    InterstitialAd.load(
      adUnitId: "ca-app-pub-8189351478187072/1549635211",
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd = ad;
          isInterstitialAd = true;
          update();
        },
        onAdFailedToLoad: (error) {
          print('InterstitialAd failed to load: $error');
          isInterstitialAd = false;
        },
      ),
    );
  }

  @override
  void onInit() {
    controller.forward();
    initInterstitialAd();
    update();
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      showInterstitialAd();
      Get.offAllNamed(Routes.main);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
