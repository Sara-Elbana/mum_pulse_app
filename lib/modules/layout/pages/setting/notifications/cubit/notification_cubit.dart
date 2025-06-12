import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_pulse_app/core/helper/notification_helper.dart';
import 'package:mom_pulse_app/modules/layout/pages/setting/notifications/cubit/notification_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationState.initial());

  Future<void> toggleFoodReminder(bool value) async {
    emit(state.copyWith(foodReminder: value));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('foodSwitch', value);
    // Schedule or cancel based on value
    if (value) {
      // Schedule the notification (default time: 10:00 AM)
      await NotificationHelper.scheduleDailyNotification(
        id: 6,
        title: "Food Tip",
        body: "Here’s your daily food tip!",
        time: const TimeOfDay(hour: 10, minute: 0),
      );
    } else {
      await NotificationHelper.cancelNotification(6);
    }
  }

  Future<void> toggleExerciseReminder(bool value) async {
    emit(state.copyWith(exerciseReminder: value));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('exerciseSwitch', value);

    if (value) {
      await NotificationHelper.scheduleDailyNotification(
        id: 7,
        title: "Exercise Time!",
        body: "Start your day with a quick workout 💪",
        time: const TimeOfDay(hour: 8, minute: 0),
      );
    } else {
      await NotificationHelper.cancelNotification(7);
    }
  }

  Future<void> toggleMedicineReminder(bool value) async {
    emit(state.copyWith(medicineReminder: value));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('medicineSwitch', value);

    if (value) {
      await NotificationHelper.scheduleDailyNotification(
        id: 7,
        title: "Medicine Time",
        body: "It’s time to take your medicine 💊",
        time: const TimeOfDay(hour: 12, minute: 0),
      );
    } else {
      await NotificationHelper.cancelNotification(7);
    }
  }

  Future<void> toggleDoctorReminder(bool value, {DateTime? dateTime}) async {
    emit(state.copyWith(doctorReminder: value));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('doctorSwitch', value);

    if (value && dateTime != null) {
      await prefs.setString(
          'doctorAppointmentDate', dateTime.toIso8601String());

      await NotificationHelper.scheduleOneTimeNotification(
        id: 8,
        title: "Doctor Appointment",
        body: "You have a doctor appointment now 🩺",
        dateTime: dateTime,
      );
    } else {
      await NotificationHelper.cancelNotification(8);
      await prefs.remove('doctorAppointmentDate');
    }
  }

  Future<void> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final foodSwitch = prefs.getBool('foodSwitch') ?? false;
    final exerciseSwitch = prefs.getBool('exerciseSwitch') ?? false;
    final medicineSwitch = prefs.getBool('medicineSwitch') ?? false;
    final doctorSwitch = prefs.getBool('doctorSwitch') ?? false;
    emit(state.copyWith(
        foodReminder: foodSwitch,
        exerciseReminder: exerciseSwitch,
        medicineReminder: medicineSwitch,
        doctorReminder: doctorSwitch));
  }
}
