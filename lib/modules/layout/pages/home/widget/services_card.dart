import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';

class ServicesCard extends StatelessWidget {
  final String image;
  final String title;
  final Color color;
  final Function() onTap;
  const ServicesCard({
    super.key,
    required this.image,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 165,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 60,
                height: 60,
                child: SvgPicture.asset(image)),
            Text(
              textAlign: TextAlign.center,
              title,
              style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
              ) ,
            ),
          ],
        ),
      ),
    );
  }
}
