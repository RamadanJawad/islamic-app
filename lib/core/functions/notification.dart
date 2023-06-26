import 'package:get/get.dart';
import 'package:islamic_app/core/class/awesome_notifications_manager.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';
import 'package:islamic_app/features/pray_time/controller/prayTime_controller.dart';

class CheckNotifications {
  PrayTimeController prayTimeController = Get.put(PrayTimeController());
  NotificationManager notificationManager = NotificationManager();
  prayTimeNotification() {
    NotificationManager.displayPrayTimeNotification(
        id: 1,
        title: "اذان الفجر",
        description: "حان الان موعد صلاة الفجر",
        hour: SharedPrefController().fajrHour!,
        minute: SharedPrefController().fajrMinute!);
    NotificationManager.displayPrayTimeNotification(
        id: 2,
        title: "اذان الظهر",
        description: "حان الان موعد صلاة الظهر",
        hour: SharedPrefController().dhurHour!,
        minute: SharedPrefController().dhurMinute!);
    NotificationManager.displayPrayTimeNotification(
        id: 3,
        title: "اذان العصر",
        description: "حان الان موعد صلاة العصر",
        hour: SharedPrefController().asrHour!,
        minute: SharedPrefController().asrMinute!);
    NotificationManager.displayPrayTimeNotification(
        id: 4,
        title: "اذان المغرب",
        description: "حان الان موعد صلاة المغرب",
        hour: SharedPrefController().magrabHour!,
        minute: SharedPrefController().magrabMinute!);
    NotificationManager.displayPrayTimeNotification(
        id: 5,
        title: "اذان العشاء",
        description: "حان الان موعد صلاة العشاء",
        hour: SharedPrefController().ishaHour!,
        minute: SharedPrefController().ishaMinute!);
  }

  morningNotification() async {
    NotificationManager.displayDailyNotification(
        id: 6,
        hour: 06,
        minute: 00,
        title: "أذكار الصباح",
        description: "لا تنسى قراءة أذكار الصباح فهي حصنك المنيع");
  }

  nightNotification() async {
    NotificationManager.displayDailyNotification(
        id: 7,
        hour: 20,
        minute: 00,
        title: "أذكار المساء",
        description: ".لا تنسى قراءة أذكار المساء فهي حصنك المنيع");
  }

  otherNotification() async {
    NotificationManager.displayHourlyNotifications(
        id: 8,
        title: "الصلاة على النبي",
        description:
            "اللهم صلِ وسلم وزِد وبارك على سيدنا محمد صلاةً تشفي بها صدورنا وتزكي بها نفوسنا وتطيب بها أرواحنا وتعطر بها أفواهنا.");
  }

  fridayNotification() async {
    NotificationManager.displayWeeklyNotification(
        id: 9,
        title: 'جمعة مباركة',
        description:
            'اكثروا من الصلاة على سيدنا محمد ولا تنسى قراءة سورة الكهف',
        dayOfWeek: DateTime.friday,
        hour: 08);
  }
}
