import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:islamic_app/controller/home_controller.dart';
import 'package:islamic_app/controller/setting_controller.dart';

class CheckNotifications {
  HomeController homeController = Get.put(HomeController());
  SettingController settingController = Get.put(SettingController());
  prayTimeNotification() {
    Future.delayed(Duration(seconds: 5), () async {
      await homeController.service.scheduledNotification2(
          id: 11,
          title: "اذان الفجر",
          body: "حان الان موعد صلاة الفجر",
          hour: homeController.prayerTimes.fajr.hour,
          minutes: homeController.prayerTimes.fajr.minute);

      await homeController.service.scheduledNotification2(
          id: 12,
          title: "اذان الظهر",
          body: "حان الان موعد صلاة الظهر",
          hour: homeController.prayerTimes.dhuhr.hour,
          minutes: homeController.prayerTimes.dhuhr.minute);

      await homeController.service.scheduledNotification2(
          id: 13,
          title: "اذان العصر",
          body: "حان الان موعد صلاة العصر",
          hour: homeController.prayerTimes.asr.hour,
          minutes: homeController.prayerTimes.asr.minute);

      await homeController.service.scheduledNotification2(
          id: 14,
          title: "اذان المغرب",
          body: "حان الان موعد صلاة المغرب",
          hour: homeController.prayerTimes.maghrib.hour,
          minutes: homeController.prayerTimes.maghrib.minute);

      await homeController.service.scheduledNotification2(
          id: 15,
          title: "اذان العشاء",
          body: "حان الان موعد صلاة العشاء",
          hour: homeController.prayerTimes.isha.hour,
          minutes: homeController.prayerTimes.isha.minute);
    });
  }

  morningNotification() async {
    await homeController.service.scheduledNotification(
        hour: 5,
        minutes: 00,
        id: 16,
        title: "أذكار الصباح",
        body: "لا تنسى قراءة أذكار الصباح فهي حصنك المنيع");
  }

  nightNotification() async {
    await homeController.service.scheduledNotification(
        hour: 16,
        minutes: 00,
        id: 17,
        title: "أذكار المساء",
        body: ".لا تنسى قراءة أذكار المساء فهي حصنك المنيع");
  }

  fridayNotification() async {
    await homeController.service.fridayNotification();
  }
}
