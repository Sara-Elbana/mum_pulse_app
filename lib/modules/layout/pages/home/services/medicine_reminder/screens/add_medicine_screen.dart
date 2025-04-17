import 'package:flutter/material.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/app_bar_services_widget.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _daysController = TextEditingController();
  final TextEditingController _timesPerDayController = TextEditingController();

  void _saveMedicine() {
    final name = _nameController.text;
    final days = int.tryParse(_daysController.text);
    final timesPerDay = int.tryParse(_timesPerDayController.text);

    if (name.isNotEmpty && days != null && timesPerDay != null) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarServicesWidget(
        title: "Add Medicine",
        backRoute: AppRoutesName.medicineScreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Medicine Name"),
            ),
            TextField(
              controller: _daysController,
              decoration: const InputDecoration(labelText: "Duration (days)"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _timesPerDayController,
              decoration: const InputDecoration(labelText: "Times per Day"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveMedicine,
              child: const Text("Save"),
            )
          ],
        ),
      ) ,
    );
  }
}
