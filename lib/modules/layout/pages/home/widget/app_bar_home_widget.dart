import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';

class AppBarHomeWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.white,
      title: Image.asset(AppAssets.mumPulseText,),
      actions: [
        Row(
          children: [
            IconButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, AppRoutesName.micScreen);
              },
              icon: SvgPicture.asset(AppAssets.micIcon),
            ),
            IconButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, AppRoutesName.cameraScreen);
              },
              icon: SvgPicture.asset(AppAssets.cameraIcon),
            ),
          ],
        ),
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
