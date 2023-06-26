import 'package:get/get.dart';
import 'package:islamic_app/features/audio/controller/audio_controller.dart';
import 'package:islamic_app/features/home/controller/home_controller.dart';
import 'package:islamic_app/features/pray_time/controller/prayTime_controller.dart';
import 'package:islamic_app/features/quran/controller/quran_controller.dart';
import 'package:islamic_app/features/splash/controller/splash_controller.dart';
import 'package:islamic_app/features/settings/controller/setting_controller.dart';
import 'package:islamic_app/features/quran/controller/tabs_controller.dart';
import 'package:islamic_app/features/subha/controller/tasabih_controller.dart';

finishSplash() {
  Get.delete<SplashController>();
}

initHome() {
  Get.put(HomeController());
  Get.put(PrayTimeController());
  Get.put(SettingController());
  finishSplash();
}

initSplash() {
  Get.put(SplashController());
}

initQuran() {
  Get.put(QuranController());
}

initSubha() {
  Get.put(TasabihController());
}

initSetting(){
  Get.put(SettingController());
}

