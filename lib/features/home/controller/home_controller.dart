import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:islamic_app/core/data/data.dart';
import 'package:islamic_app/features/audio/controller/audio_controller.dart';

class HomeController extends GetxController {
  AudioController audioController = Get.put(AudioController());
  late bool serviceEnable;
  late var dua;
  late Map<String, String> data;
  String? hijri;
  var counter = 0.obs;
  late BannerAd bannerAd;
  late InterstitialAd interstitialAd;
  bool isBannerAd = false;
  bool isInterstitialAd = false;

  initBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: "ca-app-pub-8189351478187072/7716406550",
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          print("Ad loaded !");
          isBannerAd = true;
          update();
        },
        onAdFailedToLoad: (ad, error) {
          isBannerAd = false;
          bannerAd.load();
          print('BannerAd failed to load: $error');
          ad.dispose();
          update();
        },
      ),
    );
    bannerAd.load();
  }

  changeCounter() {
    counter.value = counter.value + 1;
  }

  showDate() {
    var today = HijriCalendar.now();
    hijri = today.fullDate();
  }

  void ayha() {
    data = (Data.ayah..shuffle()).first;
  }

  readData() async {
    dua = (Data.sunnah..shuffle()).first;
    update();
  }

  String tafseer(index) {
    return Data.ayah[index]['text2'];
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

  @override
  void onInit() {
    readData();
    initInterstitialAd();
    initBannerAd();
    super.onInit();
    ayha();
    showDate();
  }

  @override
  void dispose() {
    bannerAd.dispose();
    if (isBannerAd) {
      interstitialAd.dispose();
    }
    super.dispose();
  }
}
