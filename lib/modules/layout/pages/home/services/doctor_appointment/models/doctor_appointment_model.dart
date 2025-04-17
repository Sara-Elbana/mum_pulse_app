import 'dart:convert';

import 'package:flutter/material.dart';

class DoctorAppointment {
  final String doctorName;
  final String description;
  final DateTime date;
  final String time;

  DoctorAppointment({
    required this.doctorName,
    required this.description,
    required this.date,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'doctorName': doctorName,
      'description': description,
      'date': date.toIso8601String(),
      'time': time,
    };
  }

  factory DoctorAppointment.fromMap(Map<String, dynamic> map) {
    return DoctorAppointment(
      doctorName: map['doctorName'],
      description: map['description'],
      date: DateTime.parse(map['date']),
      time: map['time'],
    );
  }

  static String encode(List<DoctorAppointment> appointments) => json.encode(
        appointments.map((e) => e.toMap()).toList(),
      );

  static List<DoctorAppointment> decode(String appointments) =>
      (json.decode(appointments) as List<dynamic>)
          .map((e) => DoctorAppointment.fromMap(e))
          .toList();
}
