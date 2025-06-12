import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/modules/authentication/widget/custom_btn.dart';
import 'package:mom_pulse_app/modules/authentication/widget/custom_drop_down_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  String? choice = "Pregnant";

  //pregnancy data
  String? selectedWeek;
  String? selectedMonth;

  //baby data
  String? selectedGender;
  String? selectedAge;
  String? selectedWeight;
  String? selectedHeight;

  final List<String> ageItems = [
    "1 month",
    "2 months",
    "3 months",
    "4 months",
    "5 months",
    "6 months",
    "7 months",
    "8 months",
    "9+ months",
  ];

  final List<String> weightOptions = [
    "3 w",
    "4 w",
    "5 w",
    "6 w",
    "7 w",
    "8 w",
    "9 w",
    "10 w"
  ];

  final List<String> heightOptions = [
    "40 h",
    "45 h",
    "50 h",
    "55 h",
    "60 h",
    "65 h",
    "70 h"
  ];

  Future<void> saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userType', choice ?? "");
    await prefs.setString('month', selectedMonth ?? "");
    await prefs.setString('week', selectedWeek ?? "");
    await prefs.setString('age', selectedAge ?? "");
    await prefs.setString('gender', selectedGender ?? "");
    await prefs.setString('weight', selectedWeight ?? "");
    await prefs.setString('height', selectedHeight ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              AppAssets.top,
              width: 280,
              height: 200,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: IgnorePointer(
                child: Image.asset(
                  AppAssets.button,
                  width: 280,
                  height: 200,
                )),
          ),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints:
                    BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 40),
                            Text(
                              "Select one choise",
                              style: GoogleFonts.inter(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            ),
                            CustomDropDownField(
                                label: "Select one choise",
                                value: choice,
                                items: const ["Pregnant", "Mother"],
                                onChanged: (val) {
                                  setState(() {
                                    choice = val;
                                    // Reset other values when changing mode
                                    selectedMonth = null;
                                    selectedWeek = null;
                                    selectedGender = null;
                                    selectedAge = null;
                                    selectedWeight = null;
                                    selectedHeight = null;
                                  });
                                }),
                            const SizedBox(height: 20),
                            Text(
                              "Baby’s information",
                              style: GoogleFonts.inter(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            ),
                            if (choice == "Pregnant") ...[
                              CustomDropDownField(
                                label: "Month",
                                value: selectedMonth,
                                items: const [
                                  "1 month",
                                  "2 month",
                                  "3 month",
                                  "4 month",
                                  "5 month",
                                  "6 month",
                                  "7 month",
                                  "8 month",
                                  "9 month"
                                ],
                                onChanged: (val) {
                                  setState(() => selectedMonth = val);
                                },
                              ),
                              const SizedBox(height: 16),
                              CustomDropDownField(
                                label: "Week",
                                value: selectedWeek,
                                items: const [
                                  "1-3 w",
                                  "4-6 w",
                                  "7-9 w",
                                  "10-12 w",
                                  "13+"
                                ],
                                onChanged: (val) {
                                  setState(() => selectedWeek = val);
                                },
                              ),
                            ] else if (choice == "Mother") ...[
                              CustomDropDownField(
                                label: "Gender",
                                value: selectedGender,
                                items: const ["boy", "girl"],
                                onChanged: (val) =>
                                    setState(() => selectedGender = val),
                              ),
                              const SizedBox(height: 16),
                              CustomDropDownField(
                                label: "Age (months)",
                                value: selectedAge,
                                items: ageItems,
                                onChanged: (val) =>
                                    setState(() => selectedAge = val),
                              ),
                              const SizedBox(height: 16),
                              CustomDropDownField(
                                label: "Weight (kg)",
                                value: selectedWeight,
                                items: weightOptions,
                                onChanged: (val) =>
                                    setState(() => selectedWeight = val),
                              ),
                              const SizedBox(height: 16),
                              CustomDropDownField(
                                label: "Height (cm)",
                                value: selectedHeight,
                                items: heightOptions,
                                onChanged: (val) =>
                                    setState(() => selectedHeight = val),
                              ),
                            ],
                            const SizedBox(height: 30),
                            const Spacer(),
                            CustomBtn(
                              text: "Next",
                              onTap: () async {
                                await saveUserData();
                                if (!mounted) return;
                                Navigator.pushNamed(context, AppRoutesName.layoutScreen);
                              },
                            ),
                            const SizedBox(height: 150),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
