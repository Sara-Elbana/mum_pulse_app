import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final Function() onTap;
  const CustomBtn({super.key,
    required this.text,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
        return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.black,
              padding: const EdgeInsets.all(14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              onTap();
            },
            child: Text(
              text,
              style: GoogleFonts.inter(
                textStyle: GoogleFonts.inter(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
