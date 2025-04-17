import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';

class CustomBtnProfileWidget extends StatefulWidget {
  final String text;
  final String icon;
  final Function() onTap;
  const CustomBtnProfileWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  State<CustomBtnProfileWidget> createState() => _CustomBtnProfileWidgetState();
}

class _CustomBtnProfileWidgetState extends State<CustomBtnProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.purple,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.grey,
            width: 1
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(widget.icon),
            const SizedBox(width: 10,),
            Text(
              widget.text,
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),

    );
  }
}
