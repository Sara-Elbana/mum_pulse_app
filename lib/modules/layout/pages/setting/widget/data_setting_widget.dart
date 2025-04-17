import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';

class DataSettingWidget extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  const DataSettingWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 33,
            height: 35,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.mentGreen,
            ),
            child: SvgPicture.asset(
                icon,
               colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
              width: 20,
              height: 23,
            ),
          ),
          const SizedBox(width: 10,),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
