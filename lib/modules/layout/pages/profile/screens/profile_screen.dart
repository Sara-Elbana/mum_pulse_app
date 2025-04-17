import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/app_bar_services_widget.dart';
import 'package:mom_pulse_app/modules/layout/pages/profile/widget/custom_btn_profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarServicesWidget(
        showActions: false,
        backRoute: AppRoutesName.layoutScreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: [
              const CircleAvatar(
                maxRadius: 60,
                backgroundColor: Color(0xffD9D9D9),
                child: Icon(Icons.image_outlined),
              ),
              const SizedBox(height: 15,),
              Text(
                "Sara Elbanna",
                style: GoogleFonts.inter(
                    fontSize: 25,
                    fontWeight: FontWeight.w600
                ),
              ),
              Text(
                "42sararefaat@gmail.com",
                style: GoogleFonts.inter(
                  color: AppColors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w400
                ),
              ),
              const SizedBox(height: 50,),
              CustomBtnProfileWidget(
                  text: "Edit Name ",
                  icon: AppAssets.editIcon,
                  onTap: (){},
              ),
              const SizedBox(height: 25,),
              CustomBtnProfileWidget(
                text: "Edit email ",
                icon: AppAssets.editIcon,
                onTap: (){},
              ),
              const SizedBox(height: 25,),
              CustomBtnProfileWidget(
                text: "Log out ",
                icon: AppAssets.logOutIcon,
                onTap: (){},
              ),

            ],
          ),
        ),
      ),
    );
  }
}
