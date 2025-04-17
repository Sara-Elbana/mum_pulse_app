import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/app_bar_services_widget.dart';

class AppUpdatesScreen extends StatelessWidget {
  const AppUpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarServicesWidget(
        title: "App Updates",
        backRoute: AppRoutesName.settingScreen,
        showActions: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Latest Updates:",
              style:
                  GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.check_circle_outline),
              title: Text(
                  "Added medicine reminder feature.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.check_circle_outline,
                color: AppColors.mentGreen,
              ),
              title: Text(
                  "Improved doctor appointment UI.",
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.check_circle_outline),
              title: Text(
                  "Performance enhancements and bug fixes.",
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
