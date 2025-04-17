import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/authentication/widget/custom_drop_down_field.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/services/doctor_appointment/widget/custom_floating_btn.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/services/medicine_reminder/models/medicine_model.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/services/medicine_reminder/widget/activity_widget.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/services/medicine_reminder/widget/show_add_medicine_dialog.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/app_bar_services_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedicineScreen extends StatefulWidget {
  const MedicineScreen({super.key});

  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  // String? selectedDays;
  // String? selectedMonths;

  List<Medicine> medicines = [];

  @override
  void initState() {
    super.initState();
    loadMedicines();
  }

  Future<void> loadMedicines() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('medicines') ?? '[]';
    setState(() {
      medicines = Medicine.decodeList(data);
    });
  }

  Future<void> saveMedicines() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('medicines', Medicine.encodeList(medicines));
  }

  void addMedicine(String name, int days, int timesPerDay) {
    List<String> generatedTimes = [];

    for (int i = 0; i < timesPerDay; i++) {
      generatedTimes.add("${9 + (i * 3)}:00 AM");
    }

    setState(() {
      medicines.add(Medicine(
        name: name,
        timesPerDay: timesPerDay,
        durationInDays: days,
        times: generatedTimes,
      ));
    });
    saveMedicines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarServicesWidget(
        title: "Medicine Reminder",
        backRoute: AppRoutesName.layoutScreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today's Activities",
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 30),
              ...medicines.map((medicine) {
                return Column(
                  children: [
                    ActivityWidget(
                      medicineName: medicine.name,
                      durationDays: medicine.durationInDays,
                      timesPerDay: medicine.timesPerDay,
                      medicine: medicine,
                      onUpdate: saveMedicines,
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      color: AppColors.mentGreen,
                      endIndent: 26,
                      indent: 26,
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
      ),
      floatingActionButton: CustomFloatingBtn(
        onPressed: () {
          showAddMedicineDialog(context, addMedicine);
        },
      ),
    );
  }
}

// CustomDropDownField(
//   color: AppColors.mentGreen,
//   label: "Months",
//   value: selectedMonths,
//   items: const [
//     "January",
//     "February",
//     "March",
//     "April",
//     "May",
//     "June",
//     "July",
//     "August",
//     "September",
//     "October",
//     "November",
//     "December",
//   ],
//   onChanged: (val) {
//     setState(() => selectedMonths = val);
//   },
// ),
// CustomDropDownField(
//   color: AppColors.mentGreen,
//   label: "Days",
//   value: selectedDays,
//   items: const [
//     "Sunday",
//     "Monday",
//     "Tuesday",
//     "Wednesday",
//     "Thursday",
//     "Friday",
//     "Saturday",
//   ],
//   onChanged: (val) {
//     setState(() => selectedDays = val);
//   },
// ),
