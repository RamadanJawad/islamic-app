import 'package:get/get.dart';
import 'package:islamic_app/features/pray_time/controller/prayTime_controller.dart';

class CheckNotifications {
  PrayTimeController prayTimeController = Get.put(PrayTimeController());
  prayTimeNotification() {
    Future.delayed(
      const Duration(seconds: 1),
      () async {
        await prayTimeController.service.scheduledNotification2(
            id: 11,
            title: "اذان الفجر",
            body: "حان الان موعد صلاة الفجر",
            hour: prayTimeController.prayerTimes.fajr.hour,
            minutes: prayTimeController.prayerTimes.fajr.minute);

        await prayTimeController.service.scheduledNotification2(
            id: 12,
            title: "اذان الظهر",
            body: "حان الان موعد صلاة الظهر",
            hour: prayTimeController.prayerTimes.dhuhr.hour,
            minutes: prayTimeController.prayerTimes.dhuhr.minute);

        await prayTimeController.service.scheduledNotification2(
            id: 13,
            title: "اذان العصر",
            body: "حان الان موعد صلاة العصر",
            hour: prayTimeController.prayerTimes.asr.hour,
            minutes: prayTimeController.prayerTimes.asr.minute);

        await prayTimeController.service.scheduledNotification2(
            id: 14,
            title: "اذان المغرب",
            body: "حان الان موعد صلاة المغرب",
            hour: prayTimeController.prayerTimes.maghrib.hour,
            minutes: prayTimeController.prayerTimes.maghrib.minute);

        await prayTimeController.service.scheduledNotification2(
            id: 15,
            title: "اذان العشاء",
            body: "حان الان موعد صلاة العشاء",
            hour: prayTimeController.prayerTimes.isha.hour,
            minutes: prayTimeController.prayerTimes.isha.minute);
      },
    );
  }

  morningNotification() async {
    await prayTimeController.service.scheduledNotification(
        hour: 6,
        minutes: 00,
        id: 16,
        title: "أذكار الصباح",
        body: "لا تنسى قراءة أذكار الصباح فهي حصنك المنيع");
  }

  nightNotification() async {
    await prayTimeController.service.scheduledNotification(
        hour: 16,
        minutes: 00,
        id: 17,
        title: "أذكار المساء",
        body: ".لا تنسى قراءة أذكار المساء فهي حصنك المنيع");
  }
  otherNotification() async {
    await prayTimeController.service.showScheduledNotification(
        id: 19,
        title: "الصلاة على النبي",
        body: "اللهم صلِ وسلم وزِد وبارك على سيدنا محمد صلاةً تشفي بها صدورنا وتزكي بها نفوسنا وتطيب بها أرواحنا وتعطر بها أفواهنا.");
  }

  fridayNotification() async {
    await prayTimeController.service.fridayNotification();
  }
}
