import 'package:intl/intl.dart';
import 'package:islamic_app/core/resources/manager_assets.dart';
import 'package:islamic_app/features/pray_time/controller/prayTime_controller.dart';

check(PrayTimeController controller) {
  if (controller.prayerTimes.nextPrayer().toString() == "Prayer.none") {
    controller.currentPray = "الفجر";
    controller.image = ManagerAssets.fajr;
    controller.prayTime = DateFormat.jm().format(controller.prayerTimes.fajr);
    controller.dateTime =
        controller.prayerTimes.fajr.toLocal().add(const Duration(days: 1));
  } else if (controller.prayerTimes.nextPrayer().toString() == "Prayer.isha") {
    controller.currentPray = "العشاء";
    controller.image = ManagerAssets.isha;
    controller.prayTime = DateFormat.jm().format(controller.prayerTimes.isha);
    controller.dateTime = controller.prayerTimes.isha;
  } else if (controller.prayerTimes.nextPrayer().toString() ==
      "Prayer.maghrib") {
    controller.currentPray = "المغرب";
    controller.image = ManagerAssets.maghrib;
    controller.prayTime =
        DateFormat.jm().format(controller.prayerTimes.maghrib);
    controller.dateTime = controller.prayerTimes.maghrib;
  } else if (controller.prayerTimes.nextPrayer().toString() == "Prayer.asr") {
    controller.currentPray = "العصر";
    controller.image = ManagerAssets.asr;
    controller.prayTime = DateFormat.jm().format(controller.prayerTimes.asr);
    controller.dateTime = controller.prayerTimes.asr;
  } else if (controller.prayerTimes.nextPrayer().toString() == "Prayer.dhuhr") {
    controller.currentPray = "الظهر";
    controller.image = ManagerAssets.dhuhr;
    controller.prayTime = DateFormat.jm().format(controller.prayerTimes.dhuhr);
    controller.dateTime = controller.prayerTimes.dhuhr;
  } else if (controller.prayerTimes.nextPrayer().toString() ==
      "Prayer.sunrise") {
    controller.currentPray = "الشروق";
    controller.image = ManagerAssets.sunrise;
    controller.prayTime =
        DateFormat.jm().format(controller.prayerTimes.sunrise);
    controller.dateTime = controller.prayerTimes.sunrise;
  } else {
    controller.currentPray = "الفجر";
    controller.image = ManagerAssets.fajr;
    controller.prayTime = DateFormat.jm().format(controller.prayerTimes.fajr);
    controller.dateTime = controller.prayerTimes.fajr.toLocal();
  }
}
