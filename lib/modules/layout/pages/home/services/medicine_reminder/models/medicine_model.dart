import 'dart:convert';

class Medicine {
  final String name;
  final int durationInDays;
  final int timesPerDay;
  final List<String> times;
  bool isTaken;

  Medicine({
    required this.name,
    required this.durationInDays,
    required this.timesPerDay,
    required this.times,
    this.isTaken = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'durationInDays': durationInDays,
      'timesPerDay': timesPerDay,
      'times': times,
      'isTaken': isTaken,
    };
  }

  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
      name: map['name'],
      durationInDays: map['durationInDays'],
      timesPerDay: map['timesPerDay'],
      times: List<String>.from(map['times']),
      isTaken: map['isTaken'] ?? false,
    );
  }

  static String encodeList(List<Medicine> medicines) =>
      json.encode(medicines.map((m) => m.toMap()).toList());

  static List<Medicine> decodeList(String medicines) =>
      (json.decode(medicines) as List<dynamic>)
          .map((item) => Medicine.fromMap(item))
          .toList();
}
