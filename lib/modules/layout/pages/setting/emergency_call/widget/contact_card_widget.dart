import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/pages/setting/emergency_call/models/emergency_contact_model.dart';

class ContactCardWidget extends StatelessWidget {
  final EmergencyContact contact;
  final VoidCallback onCall;
  const ContactCardWidget({
    super.key,
    required this.contact,
    required this.onCall,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contact.name,
                    style: GoogleFonts.inter(
                        fontSize: 20, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                Text(contact.relation,
                    style: GoogleFonts.inter(
                        fontSize: 17, fontWeight: FontWeight.w500)),
              ],
            ),
            IconButton(
              onPressed: onCall,
              icon: SvgPicture.asset(
                AppAssets.callIcon,
                colorFilter: const ColorFilter.mode(
                    AppColors.mentGreen, BlendMode.srcIn),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16,),
        const Divider(color: AppColors.grey),
        const SizedBox(height: 16,),
      ],
    );
  }
}
