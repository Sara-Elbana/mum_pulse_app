import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/authentication/widget/custom_btn.dart';
import 'package:mom_pulse_app/modules/authentication/widget/custom_text_form_field.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({super.key});

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "Forget password",
                          style: GoogleFonts.inter(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    Image.asset(AppAssets.forget1),
                    const SizedBox(height: 50,),
                    const CustomTextFormField(
                      hintText: "Email or mobile number",
                      hintStyle: TextStyle(
                        color: Colors.grey
                      ),
                    ),
                    const SizedBox(height: 60,),
                    CustomBtn(
                      text: "NEXT",
                      onTap: (){
                        Navigator.pushNamed(context, AppRoutesName.verifyYourEmailScreen);
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
