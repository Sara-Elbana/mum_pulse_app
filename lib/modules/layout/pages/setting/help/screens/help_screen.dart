import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/app_bar_services_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  Future<void> launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: '42sararefaat@gmail.com',
      query: 'subject=${Uri.encodeQueryComponent('App Inquiry')}&body=${Uri.encodeQueryComponent('Hello, I have a question about the app...')}',
    );

    try {
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        // fallback: open Gmail web
        final Uri gmailUri = Uri.parse(
            'https://mail.google.com/mail/?view=cm&fs=1&to=42sararefaat@gmail.com&su=App%20Inquiry&body=Hello,%20I%20have%20a%20question%20about%20the%20app...'
        );
        if (await canLaunchUrl(gmailUri)) {
          await launchUrl(gmailUri);
        } else {
          print("Could not launch Gmail either");
        }
      }
    } catch (e) {
      print("Error launching email: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarServicesWidget(
        title: "Help",
        backRoute: AppRoutesName.settingScreen,
        showActions: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Frequently Asked Questions:",
              style:
                  GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: Text(
                "How can I add a new doctor appointment?",
                style: GoogleFonts.inter(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: Text(
                "How can I set a medicine reminder?",
                style: GoogleFonts.inter(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: Text(
                "How do I enable notifications?",
                style: GoogleFonts.inter(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutesName.faqScreen);
              },
              child: Text(
                "See All FAQs",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: Column(
                children: [
                  Text(
                    "Need more help?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Contact us at:",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: launchEmail,
                    child: Text(
                      "42sararefaat@gmail.com",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
