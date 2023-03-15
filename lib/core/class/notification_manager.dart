import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class LocalNotificationService {
  LocalNotificationService();

  final _localNotificationService = FlutterLocalNotificationsPlugin();
  Future<void> initialize() async {
    _configureLocalTimeZone();
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("drawable/adhan");

    final InitializationSettings settings =
        InitializationSettings(android: androidInitializationSettings);

    await _localNotificationService.initialize(settings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  tz.TZDateTime _convertTime(int hour, int minutes) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minutes,
    );
    if (scheduleDate.isBefore(now)) {
      scheduleDate = scheduleDate.add(const Duration(days: 1));
    }
    return scheduleDate;
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZone));
  }

  scheduledNotification({
    required int hour,
    required int minutes,
    required int id,
    required String title,
    required String body,
  }) async {
    await _localNotificationService.zonedSchedule(
      id,
      title,
      body,
      _convertTime(hour, minutes),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'NotificationId',
          'Other Notification',
          channelDescription: 'Setting Other Notification',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  scheduledNotification2({
    required int hour,
    required int minutes,
    required int id,
    required String title,
    required String body,
  }) async {
    await _localNotificationService.zonedSchedule(
      id,
      title,
      body,
      _convertTime(hour, minutes),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'PrayTimeId_3',
          'Prayer Times',
          playSound: true,
          sound: RawResourceAndroidNotificationSound("sound"),
          channelDescription: 'Setting Pryer Time',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> showScheduledNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    await _localNotificationService.periodicallyShow(
      id,
      title,
      body,
      RepeatInterval.everyMinute,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'otherId',
          'otherChannel',
          channelDescription: 'Setting Notification',
          styleInformation: BigTextStyleInformation(''),
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      androidAllowWhileIdle: true,
    );
  }

  Future<void> fridayNotification() async {
    final now = tz.TZDateTime.now(tz.local);
    const friday = DateTime.friday;
    final nextFriday = now.weekday <= friday
        ? now.add(Duration(days: friday - now.weekday))
        : now.add(Duration(days: 7 - now.weekday + friday));
    final scheduledDate = tz.TZDateTime(
      tz.local,
      nextFriday.year,
      nextFriday.month,
      nextFriday.day,
      10,
      0,
    );

    if (scheduledDate.isBefore(now)) {
      scheduledDate.add(Duration(days: 1));
    }

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await _localNotificationService.zonedSchedule(
        18,
        'جمعة مباركة',
        'اكثروا من الصلاة على سيدنا محمد ولا تنسى قراءة سورة الكهف',
        scheduledDate,
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
  }

  Future<void> cancelNotification(int id) async {
    await _localNotificationService.cancel(id);
  }
}
