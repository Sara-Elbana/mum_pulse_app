import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/app_bar_services_widget.dart';
import 'package:mom_pulse_app/modules/layout/pages/setting/widget/data_setting_widget.dart';
import 'package:mom_pulse_app/modules/layout/pages/setting/widget/setting_item.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    maxRadius: 30,
                    backgroundColor: AppColors.mentGreen,
                    child: Icon(Icons.image_outlined),
                  ),
                  const SizedBox(width: 12,),
                  Text(
                      "Sara Elbanna",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60,),
               ...settingItems.map((item) => Column(
                 children: [
                   DataSettingWidget(
                       title: item.title,
                       icon: item.icon,
                       onTap: (){
                         Navigator.pushNamed(context, item.route);
                       },
                   ),
                   const SizedBox(height: 20),
                   const Divider(color: AppColors.mentGreen),
                   const SizedBox(height: 20),
                 ],
               ))
            ],
          ),
        ),
      ),
    );
  }
}
