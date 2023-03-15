import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';
import 'package:islamic_app/controller/home_controller.dart';
import 'package:islamic_app/core/constant/image_url.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';

late CalculationParameters parameters;

check(HomeController controller) {
  parameters = CalculationMethod.egyptian.getParameters();
  parameters.madhab = Madhab.shafi;
  controller.coordinates = Coordinates(
      SharedPrefController().latitude!, SharedPrefController().longitude!);
  controller.prayerTimes = PrayerTimes.today(controller.coordinates, parameters);
  if (controller.prayerTimes.nextPrayer().toString() == "Prayer.none") {
    controller.currentPray = "الفجر";
    controller.image = ImageUrl.fajr;
    controller.prayTime = DateFormat.jm().format(controller.prayerTimes.fajr);
    if (controller.dateTime.hour > 12) {
      controller.dateTime = controller.prayerTimes.fajr.toLocal();
    } else {
      controller.dateTime =
          controller.prayerTimes.fajr.toLocal().add(Duration(days: 1));
    }
  } else if (controller.prayerTimes.nextPrayer().toString() == "Prayer.isha") {
    controller.currentPray = "العشاء";
    controller.image = ImageUrl.isha;
    controller.prayTime = DateFormat.jm().format(controller.prayerTimes.isha);
    controller.dateTime = controller.prayerTimes.isha;
  } else if (controller.prayerTimes.nextPrayer().toString() ==
      "Prayer.maghrib") {
    controller.currentPray = "المغرب";
    controller.image = ImageUrl.maghrib;
    controller.prayTime =
        DateFormat.jm().format(controller.prayerTimes.maghrib);
    controller.dateTime = controller.prayerTimes.maghrib;
  } else if (controller.prayerTimes.nextPrayer().toString() == "Prayer.asr") {
    controller.currentPray = "العصر";
    controller.image = ImageUrl.asr;
    controller.prayTime = DateFormat.jm().format(controller.prayerTimes.asr);
    controller.dateTime = controller.prayerTimes.asr;
  } else if (controller.prayerTimes.nextPrayer().toString() == "Prayer.dhuhr") {
    controller.currentPray = "الظهر";
    controller.image = ImageUrl.dhuhr;
    controller.prayTime = DateFormat.jm().format(controller.prayerTimes.dhuhr);
    controller.dateTime = controller.prayerTimes.dhuhr;
  } else if (controller.prayerTimes.nextPrayer().toString() ==
      "Prayer.sunrise") {
    controller.currentPray = "الشروق";
    controller.image = ImageUrl.sunrise;
    controller.prayTime =
        DateFormat.jm().format(controller.prayerTimes.sunrise);
    controller.dateTime = controller.prayerTimes.sunrise;
  } else {
    controller.currentPray = "الفجر";
    controller.image = ImageUrl.fajr;
    controller.prayTime = DateFormat.jm().format(controller.prayerTimes.fajr);
    if (controller.dateTime.hour > 12) {
      controller.dateTime = controller.prayerTimes.fajr.toLocal();
    } else {
      controller.dateTime =
          controller.prayerTimes.fajr.toLocal().add(Duration(days: 1));
    }
  }
}
