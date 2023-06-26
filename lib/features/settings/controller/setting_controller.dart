import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/functions/notification.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';

class SettingController extends GetxController
    with GetTickerProviderStateMixin {
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  int value = 1;

  Duration duration = const Duration(milliseconds: 370);
  late Animation<Alignment> animation;
  late AnimationController animationController;

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

  prayTimeNotification() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          if (SharedPrefController().status1 == true) {
            CheckNotifications().prayTimeNotification();
          } else {
            AwesomeNotifications().cancelSchedule(1);
            AwesomeNotifications().cancelSchedule(2);
            AwesomeNotifications().cancelSchedule(3);
            AwesomeNotifications().cancelSchedule(4);
            AwesomeNotifications().cancelSchedule(5);
          }
          update();
        });
      }
    });
  }

  morningNotification() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          if (SharedPrefController().status2 == true) {
            CheckNotifications().morningNotification();
          } else {
            AwesomeNotifications().cancelSchedule(6);
          }
          update();
        });
      }
    });
  }

  nightNotification() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          if (SharedPrefController().status3 == true) {
            CheckNotifications().nightNotification();
          } else {
            AwesomeNotifications().cancelSchedule(7);
          }
          update();
        });
      }
    });
  }

  fridayNotification() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          if (SharedPrefController().status4 == true) {
            CheckNotifications().fridayNotification();
          } else {
            AwesomeNotifications().cancelSchedule(8);
          }
          update();
        });
      }
    });
  }
  @override
  void onInit() {
    super.onInit();
    prayTimeNotification();
    morningNotification();
    nightNotification();
    fridayNotification();
    getData();
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
