import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/authentication/widget/custom_btn.dart';
import 'package:mom_pulse_app/modules/authentication/widget/custom_text_form_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyYourEmailScreen extends StatelessWidget {
  const VerifyYourEmailScreen({super.key});

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
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      textAlign: TextAlign.center,
                      "Verify your email",
                      style: GoogleFonts.inter(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                   const Text(
                      textAlign: TextAlign.center,
                        "please enter the verification code that we\nhave sent to your email",
                    ),
                    Image.asset(AppAssets.forget2),
                    const SizedBox(height: 60,),
                    PinCodeTextField(
                      appContext: context,
                      length: 4,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      keyboardType: TextInputType.number,
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.underline,
                        borderRadius: BorderRadius.circular(10),
                        borderWidth: 5,
                        fieldHeight: 60,
                        fieldWidth: 50,
                        activeFillColor: AppColors.white,
                        inactiveColor: AppColors.black,
                        selectedColor: AppColors.black,
                        activeColor: AppColors.black,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: false,
                      onCompleted: (value) {
                        print("Done: $value");
                      },
                      onChanged: (value) {
                        print("Entered value: $value");
                      },
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                      Text(
                          "Didn’t Received?",
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Resend",
                            style: GoogleFonts.inter(
                              color: AppColors.darkPurple,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.darkPurple,
                            ) ,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50,),
                    CustomBtn(
                      text: "NEXT",
                      onTap: (){
                        Navigator.pushNamed(context, AppRoutesName.resetPassScreen);
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
