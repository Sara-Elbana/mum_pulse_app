import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:mom_pulse_app/modules/layout/pages/home/services/doctor_appointment/models/doctor_appointment_model.dart';

class NotificationService {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');

    const settings = InitializationSettings(
      android: androidInit,
    );

    await _notifications.initialize(settings);

    tz.initializeTimeZones();
  }

  static Future<void> scheduleDoctorAppointment(DoctorAppointment appointment) async {
    final androidDetails = AndroidNotificationDetails(
      'doctor_channel_id',
      'Doctor Appointments',
      channelDescription: 'Reminder for doctor appointments',
      importance: Importance.max,
      priority: Priority.high,
    );

    final notificationDetails = NotificationDetails(android: androidDetails);

    final timeParts = appointment.time.split(":");

    final int hour = int.parse(timeParts[0]);
    final int minute = int.parse(timeParts[1]);

    final tz.TZDateTime scheduledDate = tz.TZDateTime.from(
      DateTime(
        appointment.date.year,
        appointment.date.month,
        appointment.date.day,
        hour,
        minute,
      ),
      tz.local,
    );

    await _notifications.zonedSchedule(
      appointment.hashCode, // unique ID
      'Doctor Appointment',
      'You have an appointment with ${appointment.doctorName}',
      scheduledDate,
      notificationDetails,
      matchDateTimeComponents: DateTimeComponents.dateAndTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  static Future<void> showInstantNotification(String title, String body) async {
    const androidDetails = AndroidNotificationDetails(
      'instant_channel_id',
      'Instant Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    await _notifications.show(0, title, body, notificationDetails);
  }
}
