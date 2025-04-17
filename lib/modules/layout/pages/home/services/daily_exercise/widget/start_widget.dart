import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class StartWidget extends StatelessWidget {
  final String videoUrl;
  const StartWidget({super.key, required this.videoUrl});

  Future<void> _launchYoutubeVideo(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);

    if (!await canLaunchUrl(uri)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("❌ Can't open the video.")),
      );
      return;
    }

    final bool launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("❌ Failed to launch the video.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchYoutubeVideo(context, videoUrl),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          width: 75,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.mentGreen,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            textAlign: TextAlign.center,
            "start",
            style: GoogleFonts.inter(
                fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
