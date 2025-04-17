import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/modules/authentication/widget/custom_btn.dart';

class CongratScreen extends StatelessWidget {
  const CongratScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(AppAssets.top,width: 280,height: 200,),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: IgnorePointer(
                child: Image.asset(AppAssets.button,width: 280,height: 200,)),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Image.asset(AppAssets.forget4),
                    const SizedBox(height: 50,),
                    Text(
                        "Congratulations",
                      style: GoogleFonts.inter(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                const Text(
                  textAlign: TextAlign.center,
                    "You have updated the password. Please login\nagain with your new password"),
                    const SizedBox(height: 40,),
                    CustomBtn(
                      text: "Login",
                      onTap: (){
                        Navigator.pushNamed(context, AppRoutesName.informationScreen);
                      },
                    ),
                    const SizedBox(height: 150),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
