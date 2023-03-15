import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/class/notification_manager.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/core/functions/notification.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';
import 'package:islamic_app/data/data.dart';

class SettingController extends GetxController
    with GetTickerProviderStateMixin {
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  var randomItem;
  bool value5 = false;
  int value = 1;
  late LocalNotificationService service;
  double fontSize = 18;

  Duration duration = const Duration(milliseconds: 370);
  late Animation<Alignment> animation;
  late AnimationController animationController;

  void largeText() {
    if (fontSize < 34) {
      fontSize = fontSize + 2;
      update();
    } else if (fontSize == 34) {
      Get.snackbar(
        "",
        "",
        snackStyle: SnackStyle.FLOATING,
        margin: EdgeInsets.all(10),
        titleText: const Text(
          "*ملاحظة",
          textDirection: TextDirection.rtl,
          style: TextStyle(
              fontFamily: "Cairo", fontSize: 19, color: ColorCode.mainColor),
        ),
        messageText: const Text(
          "لا يمكن تكبير النص اكثر من ذلك",
          textDirection: TextDirection.rtl,
          style: TextStyle(fontFamily: "Cairo", fontSize: 18),
        ),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void smallText() {
    if (fontSize > 18) {
      fontSize = fontSize - 2;
      update();
    } else if (fontSize == 18) {
      Get.snackbar(
        "",
        "",
        snackStyle: SnackStyle.FLOATING,
        margin: EdgeInsets.all(10),
        titleText: const Text(
          "*ملاحظة",
          textDirection: TextDirection.rtl,
          style: TextStyle(
              fontFamily: "Cairo", fontSize: 19, color: ColorCode.mainColor),
        ),
        messageText: const Text(
          "لا يمكن تصغير النص اكثر من ذلك",
          textDirection: TextDirection.rtl,
          style: TextStyle(fontFamily: "Cairo", fontSize: 18),
        ),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  printData() {
    randomItem = (Data.sunnah..shuffle()).first;
  }

  getData() {
    if (SharedPrefController().status1 != null) {
      value1 = SharedPrefController().status1!;
    }
    if (SharedPrefController().status2 != null) {
      value2 = SharedPrefController().status2!;
    }
    if (SharedPrefController().status3 != null) {
      value3 = SharedPrefController().status3!;
    }
    if (SharedPrefController().status4 != null) {
      value4 = SharedPrefController().status4!;
    }
    if (SharedPrefController().status5 != null) {
      value5 = SharedPrefController().status5!;
    }
    if (SharedPrefController().status6 != null) {
      value = SharedPrefController().status6!;
    }
  }

  onChange1(bool val) {
    value1 = val;
    update();
  }

  onChange2(bool val) {
    value2 = val;
    update();
  }

  onChange3(bool val) {
    value3 = val;
    update();
  }

  onChange4(bool val) {
    value4 = val;
    update();
  }

  onChange5(bool val) {
    value5 = val;
    update();
  }

  onChangeValue(val) {
    value = val;
    SharedPrefController().saveStatus6(status6: value);
    update();
  }

  prayTimeNotification() {
    Future.delayed(Duration(seconds: 3), () {
      if (value1 == true) {
        CheckNotifications().prayTimeNotification();
      } else {
        service.cancelNotification(11);
        service.cancelNotification(12);
        service.cancelNotification(13);
        service.cancelNotification(14);
        service.cancelNotification(15);
      }
      update();
    });
  }

  morningNotification() {
    Future.delayed(Duration(seconds: 3), () {
      if (value2 == true) {
        CheckNotifications().morningNotification();
      } else {
        service.cancelNotification(16);
      }
      update();
    });
  }

  nightNotification() {
    Future.delayed(Duration(seconds: 3), () {
      if (value3 == true) {
        CheckNotifications().nightNotification();
      } else {
        service.cancelNotification(17);
      }
      update();
    });
  }

  fridayNotification() {
    Future.delayed(Duration(seconds: 3), () {
      if (value4 == true) {
        CheckNotifications().fridayNotification();
      } else {
        service.cancelNotification(18);
      }
      update();
    });
  }

  otherNotification() {
    Future.delayed(Duration(seconds: 3), () {
      if (value5 == true) {
      } else {
        service.cancelNotification(20);
      }
      update();
    });
  }

  @override
  void onInit() {
    getData();
    service = LocalNotificationService();
    super.onInit();
    printData();
    prayTimeNotification();
    morningNotification();
    nightNotification();
    fridayNotification();
    otherNotification();
    animationController = AnimationController(vsync: this, duration: duration);
    animation =
        AlignmentTween(begin: Alignment.centerLeft, end: Alignment.centerRight)
            .animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn,
      ),
    );
  }
}
