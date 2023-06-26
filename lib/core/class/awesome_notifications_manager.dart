import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationManager {
  static void displayPrayTimeNotification({
    required String title,
    required String description,
    required int hour,
    required int minute,
    required int id,
  }) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'prayTime_channel',
        title: title,
        body: description,
        backgroundColor: Colors.white,
        wakeUpScreen: true,
      ),
      schedule: NotificationCalendar(
        hour: hour,
        minute: minute,
        second: 0,
        millisecond: 0,
        allowWhileIdle: true,
        repeats: true,
      ),
    );
  }

  static void displayDailyNotification({
    required String title,
    required String description,
    required int hour,
    required int minute,
    required int id,
  }) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'daily_channel',
        title: title,
        body: description,
        backgroundColor: Colors.white,
        wakeUpScreen: true,
      ),
      schedule: NotificationCalendar(
        hour: hour,
        minute: minute,
        second: 0,
        millisecond: 0,
        allowWhileIdle: true,
        repeats: true,
      ),
    );
  }

  static void displayWeeklyNotification({
    required String title,
    required String description,
    required int dayOfWeek,
    required int hour,
    required int id,
  }) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'weekly_channel',
        title: title,
        body: description,
      ),
      schedule: NotificationCalendar(
        weekday: dayOfWeek,
        hour: hour,
        minute: 0,
        second: 0,
        millisecond: 0,
        allowWhileIdle: true,
        repeats: true,
      ),
    );
  }

  static void displayHourlyNotifications({
    required String title,
    required String description,
    required int id,
  }) async {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: id,
          channelKey: 'hourly_channel',
          title: title,
          body: description,
          notificationLayout: NotificationLayout.BigText,
        ),
        schedule: NotificationInterval(interval: 60, repeats: true));
  }
}
