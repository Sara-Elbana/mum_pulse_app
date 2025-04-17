import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/authentication/widget/custom_btn.dart';
import 'package:mom_pulse_app/modules/authentication/widget/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                    const SizedBox(height: 50),
                    Text(
                      "Login",
                      style: GoogleFonts.inter(
                        fontSize: 30,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      children: [
                       const Icon(Icons.person_2_outlined,size: 30,color: AppColors.black,),
                        Text(
                            "User Name",
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                   const CustomTextFormField(),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        const Icon(Icons.lock_outline,size: 28,color: AppColors.black,),
                        Text(
                          "Password",
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                   const CustomTextFormField(
                     isPass: true,
                   ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, AppRoutesName.forgetPassScreen);
                          },
                          child: Text(
                            textAlign: TextAlign.end,
                            "Forget password?",
                            style: GoogleFonts.inter(
                              color: AppColors.darkPurple,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.darkPurple,
                            ) ,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),
                    CustomBtn(
                        text: "Login",
                        onTap: (){
                          Navigator.pushReplacementNamed(context, AppRoutesName.layoutScreen);
                        },
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      children: [
                       const Expanded(
                          child: Divider(
                            color: AppColors.black,
                            indent: 14,
                            endIndent: 14,
                          ),
                        ),
                        Text(
                          "OR",
                          style: GoogleFonts.inter(
                            color: AppColors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                       const Expanded(
                          child: Divider(
                            color: AppColors.black,
                            indent: 14,
                            endIndent: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),
                InkWell(
                    onTap: (){},
                    child: Container(
                      width: double.infinity,
                    padding:const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.purple,),
                    ),
                    child: Image.asset(AppAssets.googleIcon,width: 30,height: 30,),
                    ),
                    ),
                    const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   const Text(
                      "Don’t have an account? ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRoutesName.createAccountScreen);
                        },
                      child: Text(
                        "Register",
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
