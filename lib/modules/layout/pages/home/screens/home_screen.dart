import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/age_month_picker_dialog_widget.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/app_bar_home_widget.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/height_picker.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/services_card.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/weight_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  String userType = "";
  String ageOrMonth = "";
  double babyHeight = 50.0;
  double babyWeight = 3.0;

  void _showHeightPicker() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return HeightPicker(
          initialHeight: double.tryParse(babyHeight.toString()) ?? 50.0,
          onHeightChanged: (newHeight) async {
            final prefs = await SharedPreferences.getInstance();
            setState(() {
              babyHeight = newHeight;
            });
            prefs.setString('height', "$newHeight h");
          },
        );
      },
    );
  }

   void _showWeightPicker() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return WeightPicker(
          initialWeight: double.tryParse(babyWeight.toString()) ?? 3.0,
          onWeightChanged: (newWeight) async {
            final prefs = await SharedPreferences.getInstance();
            setState(() {
              babyWeight = newWeight;
            });
            prefs.setString('weight', "$newWeight w");
          },
         );
       },
     );
   }

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  void _loadUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userType = prefs.getString('choice') ?? "";
      if (userType == "Pregnant") {
        ageOrMonth = prefs.getString('month') ?? "";
      } else if (userType == "Mother") {
        ageOrMonth = prefs.getString('age') ?? "";
      }
      final weightStr = prefs.getString('weight') ?? "3 w";
      final heightStr = prefs.getString('height') ?? "50 h";
      this.babyWeight = double.tryParse(weightStr.split(" ").first) ?? 3.0;
      this.babyHeight = double.tryParse(heightStr.split(" ").first) ?? 50.0;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarHomeWidget(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 14,
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () async{
                  String? newValue = await showDialog(
                    context: context,
                    builder: (_) => AgeMonthPickerDialog(
                      userType: userType,
                      currentValue: ageOrMonth,
                    ),
                  );
    if (newValue != null) {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
    ageOrMonth = newValue;
    });
    if (userType == "Pregnant") {
    prefs.setString('month', newValue);
    } else {
    prefs.setString('age', newValue);
    }
    }
    },
    child: Text(
    userType == "Pregnant"
    ? "You are in $ageOrMonth"
        : userType == "Mother"
    ? "Baby Age: $ageOrMonth"
        : "",
    style: GoogleFonts.inter(
    fontSize: 20, fontWeight: FontWeight.w500),
    ),

              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white, elevation: 0),
                    onPressed: _showHeightPicker,
                    child: Column(
                      children: [
                        const ImageIcon(
                          AssetImage(AppAssets.regularIcon),
                          size: 55,
                          color: AppColors.black,
                        ),
                        Text(
                          "${babyHeight.toStringAsFixed(0)} cm",
                          style: GoogleFonts.inter(
                              color: AppColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      RotationTransition(
                        turns: _controller,
                        child: Image.asset(
                          AppAssets.baby1,
                          height: 150,
                          width: 280,
                          //fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          AppAssets.baby,
                          height: 130,
                          width: 250,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white, elevation: 0),
                    onPressed: _showWeightPicker,
                    child: Column(
                      children: [
                        const ImageIcon(
                          AssetImage(AppAssets.weightIcon),
                          size: 55,
                          color: AppColors.black,
                        ),
                        Text(
                          "${babyWeight.toStringAsFixed(0)} kg",
                          style: GoogleFonts.inter(
                              color: AppColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Text(
              textAlign: TextAlign.start,
              "Services",
              style: GoogleFonts.instrumentSans(
                  fontSize: 25, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ServicesCard(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, AppRoutesName.doctorScreen);
                    },
                    image: AppAssets.doctor,
                    title: "Doctor\nAppointment",
                    color: AppColors.purple,
                  ),
                  ServicesCard(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, AppRoutesName.medicineScreen);
                    },
                    image: AppAssets.medicine,
                    title: "Medicine\nReminder",
                    color: AppColors.yellow,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ServicesCard(
                    onTap: () {
                      Navigator.pushNamed(
                          context, AppRoutesName.exerciseScreen);
                    },
                    image: AppAssets.daily,
                    title: "Daily Exercise",
                    color: AppColors.mentGreen,
                  ),
                  ServicesCard(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, AppRoutesName.foodScreen);
                    },
                    image: AppAssets.food,
                    title: "Food Tips",
                    color: AppColors.bink,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
