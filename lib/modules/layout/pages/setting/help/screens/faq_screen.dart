import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/app_bar_services_widget.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarServicesWidget(
        title: "FAQs",
        backRoute: AppRoutesName.helpScreen,
        showActions: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            "Frequently Asked Questions",
            style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Example question 1
          Text(
            "Q: How can I add a new doctor appointment?",
            style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            "A: Go to the Doctor screen, tap the '+' button, fill in the details like name, date, and time, then press Save.",
            style: GoogleFonts.inter(fontSize: 15),
          ),
          const SizedBox(height: 20),

          // Example question 2
          Text(
            "Q: How can I set a medicine reminder?",
            style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            "A: Navigate to the Medicine Reminder screen, tap 'Add Medicine', enter the name and reminder times, and save.",
            style: GoogleFonts.inter(fontSize: 15),
          ),
          const SizedBox(height: 20),

          // Example question 3
          Text(
            "Q: How do I enable notifications?",
            style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            "A: Make sure you have allowed notifications from the app in your device settings. The app will prompt you if permission is needed.",
            style: GoogleFonts.inter(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
