import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/app_bar_services_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarServicesWidget(
        title: "About Us",
        backRoute: AppRoutesName.settingScreen,
        showActions: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About This App",
              style:
                  GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              "This app is designed to help parents monitor their baby's health, "
              "track doctor appointments, and set daily medicine reminders in an easy and safe way.",
              style:
                  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 24),
            Text(
              "App Version : 1.0.0",
              style:
                  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Contact : ",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final Uri gmailUri = Uri.parse(
                        'https://mail.google.com/mail/?view=cm&fs=1&to=42sararefaat@gmail.com&su=App Inquiry&body=Hello, I have a question about the app...');

                    if (await canLaunchUrl(gmailUri)) {
                      await launchUrl(gmailUri);
                    }
                  },
                  child: Text(
                    "42sararefaat@gmail.com",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
