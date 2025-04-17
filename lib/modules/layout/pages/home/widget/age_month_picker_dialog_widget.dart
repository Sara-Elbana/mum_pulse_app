import 'package:flutter/material.dart';

class AgeMonthPickerDialog extends StatelessWidget {
  final String userType;
  final String currentValue;

  const AgeMonthPickerDialog({
    super.key,
    required this.userType,
    required this.currentValue,
  });

  @override
  Widget build(BuildContext context) {
    final items = userType == "Pregnant"
        ? ["1 month", "2 months", "3 months", "4 months", "5 months", "6 months", "7 months", "8 months", "9+ months"]
        : ["1 month", "2 months", "3 months", "4 months", "5 months", "6 months", "7 months", "8 months", "9+ months"];

    return AlertDialog(
      title: Text("Select ${userType == "Pregnant" ? "Month" : "Baby Age"}"),
      content: SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(items[index]),
              onTap: () {
                Navigator.pop(context, items[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
