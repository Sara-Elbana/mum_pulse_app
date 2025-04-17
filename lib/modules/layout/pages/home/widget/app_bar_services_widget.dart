import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';

class AppBarServicesWidget extends StatelessWidget implements PreferredSizeWidget{
  final String? title;
  final bool showActions;
  final String? backRoute;
  const AppBarServicesWidget({
    super.key,
    this.title,
    this.showActions = true,
    this.backRoute,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.white,
      leading: IconButton(
        onPressed: (){
          if (backRoute != null) {
            Navigator.pushNamed(context, backRoute!);
          } else {
            Navigator.pop(context);
          }
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
      title: title != null
      ?Text(
        title!,
        style: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
        ),
      ) : null,
      actions: showActions
      ?[
        IconButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, AppRoutesName.micScreen);
          },
          icon: SvgPicture.asset(AppAssets.micIcon),
        ),
      ] : null,
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
