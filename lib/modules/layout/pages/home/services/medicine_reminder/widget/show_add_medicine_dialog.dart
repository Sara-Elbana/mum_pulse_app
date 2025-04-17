import 'package:flutter/material.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';

void showAddMedicineDialog(
  BuildContext context,
  void Function(String name, int days, int timesPerDay) onSave,
) {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController daysController = TextEditingController();
  final TextEditingController timesPerDayController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Add Medicine"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                cursorColor: AppColors.mentGreen,
                decoration: const InputDecoration(
                    labelText: "Medicine Name",
                  floatingLabelStyle: TextStyle(color: AppColors.darkGreen),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.mentGreen),
                  ),

                ),
              ),
              TextField(
                controller: daysController,
                cursorColor: AppColors.mentGreen,
                decoration: const InputDecoration(
                    labelText: "Duration (days)",
                  floatingLabelStyle: TextStyle(color: AppColors.darkGreen),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.mentGreen),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: timesPerDayController,
                cursorColor: AppColors.mentGreen,
                decoration: const InputDecoration(
                    labelText: "Times per Day",
                  floatingLabelStyle: TextStyle(color: AppColors.darkGreen),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.mentGreen),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Cancel",
              style: TextStyle(
                color: AppColors.darkGreen,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final name = nameController.text;
              final days = int.tryParse(daysController.text) ?? 0;
              final times = int.tryParse(timesPerDayController.text) ?? 0;

              if (name.isNotEmpty && days > 0 && times > 0) {
                onSave(name, days, times);
                Navigator.pop(context);
              }
            },
            child: const Text(
              "Save",
              style: TextStyle(
                color: AppColors.darkGreen,
              ),
            ),
          ),
        ],
      );
    },
  );
}
