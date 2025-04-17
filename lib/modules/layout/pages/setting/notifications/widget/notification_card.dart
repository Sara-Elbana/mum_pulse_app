import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';

class NotificationCard extends StatelessWidget {
  final String iconPath;
  final Color iconColor;
  final String title;
  final bool switchValue;
  final Function(bool) onSwitchChanged;

  const NotificationCard({
    super.key,
    required this.iconPath,
    required this.iconColor,
    required this.title,
    required this.switchValue,
    required this.onSwitchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 33,
              height: 35,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: iconColor,
              ),
              child: SvgPicture.asset(
                iconPath,
                colorFilter:
                const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
                width: 20,
                height: 23,
              ),
            ),
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            CupertinoSwitch(
              activeColor: AppColors.black,
              value: switchValue,
              onChanged: onSwitchChanged,
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
      ],
    );
  }
}
