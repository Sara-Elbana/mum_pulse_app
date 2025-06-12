import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationHelper {
  static final FlutterLocalNotificationsPlugin _notifications =
  FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    tz.initializeTimeZones();

    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    );

    await _notifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        print("Notification tapped: ${response.payload}");
      },
    );
  }

  static Future<void> scheduleDailyNotification({
    required int id,
    required String title,
    required String body,
    required TimeOfDay time,
  }) async {
    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    await _notifications.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_channel_id',
          'Daily Notifications',
          channelDescription: 'Reminders for meals, water, and fruits',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  static Future<void> scheduleOneTimeNotification({
    required int id,
    required String title,
    required String body,
    required DateTime dateTime,
  }) async {
    final scheduledDate = tz.TZDateTime.from(dateTime, tz.local);

    await _notifications.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'doctor_channel_id',
          'Doctor Appointment',
          channelDescription: 'Reminder for doctor appointment',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }


  static Future<void> cancelNotification(int id) async {
    await _notifications.cancel(id);
  }

  static TimeOfDay? _parseTime(String? timeString) {
    if (timeString == null) return null;
    final parts = timeString.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  static Future<void> _scheduleIfTimeAvailable({
    required int id,
    required String? timeString,
    required String title,
    required String body,
  }) async {
    final time = _parseTime(timeString);
    if (time != null) {
      await scheduleDailyNotification(
        id: id,
        title: title,
        body: body,
        time: time,
      );
    }
  }

  static Future<void> rescheduleAllNotifications() async {
    final prefs = await SharedPreferences.getInstance();

    final mealsSwitch = prefs.getBool('mealsSwitch') ?? false;
    final waterSwitch = prefs.getBool('waterSwitch') ?? false;
    final fruitsSwitch = prefs.getBool('fruitsSwitch') ?? false;
    final warningSwitch = prefs.getBool('warningSwitch') ?? false;


    if (mealsSwitch) {
      await _scheduleIfTimeAvailable(
        id: 1,
        timeString: prefs.getString('breakfastTime'),
        title: "Breakfast Reminder",
        body: "Time to have a healthy breakfast!",
      );

      await _scheduleIfTimeAvailable(
        id: 2,
        timeString: prefs.getString('lunchTime'),
        title: "Lunch Reminder",
        body: "Time to have a healthy lunch!",
      );

      await _scheduleIfTimeAvailable(
        id: 3,
        timeString: prefs.getString('dinnerTime'),
        title: "Dinner Reminder",
        body: "Time to have a healthy dinner!",
      );
    }

    if (waterSwitch) {
      await scheduleDailyNotification(
        id: 4,
        title: "Water Reminder",
        body: "Don't forget to drink water!",
        time: const TimeOfDay(hour: 12, minute: 0),
      );
    }

    if (fruitsSwitch) {
      await scheduleDailyNotification(
        id: 5,
        title: "Fruits Reminder",
        body: "Snack time! Have some fresh fruits 🍎🍌",
        time: const TimeOfDay(hour: 17, minute: 0),
      );
    }
    if (warningSwitch) {
      final warningTimeString = prefs.getString('warningTime');
      final warningTime = _parseTime(warningTimeString) ?? const TimeOfDay(hour: 18, minute: 30);

      await scheduleDailyNotification(
        id: 6,
        title: "Health Warning Reminder",
        body: "Avoid high sugar/salt. Stay healthy!",
        time: warningTime,
      );
    } else {
      await cancelNotification(6);
    }
  }
}
