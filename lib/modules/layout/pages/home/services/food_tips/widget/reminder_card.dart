import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';

class ReminderCard extends StatelessWidget {
  final String iconPath;
  final Color iconColor;
  final String title;
  final String hintText;
  final bool switchValue;
  final Function(bool) onSwitchChanged;
  final Widget? child;

  const ReminderCard({
    super.key,
    required this.iconPath,
    required this.iconColor,
    required this.title,
    required this.hintText,
    required this.switchValue,
    required this.onSwitchChanged,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    textAlign: TextAlign.center,
                    hintText,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey
                    ),
                  ),
                  if (child != null) ...[
                    const SizedBox(height: 8),
                    child!,
                  ],
                ],
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
