import 'package:equatable/equatable.dart';

class NotificationState extends Equatable {
  final bool foodReminder;
  final bool exerciseReminder;
  final bool medicineReminder;
  final bool doctorReminder;

  const NotificationState({
    required this.foodReminder,
    required this.exerciseReminder,
    required this.medicineReminder,
    required this.doctorReminder,
  });

  factory NotificationState.initial() {
    return const NotificationState(
      foodReminder: false,
      exerciseReminder: false,
      medicineReminder: false,
      doctorReminder: false,
    );
  }

  NotificationState copyWith({
    bool? foodReminder,
    bool? exerciseReminder,
    bool? medicineReminder,
    bool? doctorReminder,
  }) {
    return NotificationState(
      foodReminder: foodReminder ?? this.foodReminder,
      exerciseReminder: exerciseReminder ?? this.exerciseReminder,
      medicineReminder: medicineReminder ?? this.medicineReminder,
      doctorReminder: doctorReminder ?? this.doctorReminder,
    );
  }

  @override
  List<Object> get props =>
      [foodReminder, exerciseReminder, medicineReminder, doctorReminder];
}