import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/services/daily_exercise/widget/start_widget.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/app_bar_services_widget.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarServicesWidget(
          title: "  Exercise Reminder",
        backRoute: AppRoutesName.layoutScreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 170,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(AppAssets.exercise1,fit: BoxFit.cover,)),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "1:3 Months",
                    style: GoogleFonts.inter(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const StartWidget(
                videoUrl: 'https://www.youtube.com/watch?v=YFZ8OXcVl3I',
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 170,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(AppAssets.exercise2,fit: BoxFit.cover,)),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "4:6 Months",
                    style: GoogleFonts.inter(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const StartWidget(
                videoUrl: "https://www.youtube.com/watch?v=0ZgHkOWk-_8",
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SizedBox(
                      width: 170,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                          child: Image.asset(AppAssets.exercise3,fit: BoxFit.cover,))),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "7:9 Months",
                    style: GoogleFonts.inter(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const StartWidget(
                videoUrl: "https://www.youtube.com/watch?v=FKVqxcI39i8",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
