import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/authentication/widget/custom_btn.dart';
import 'package:mom_pulse_app/modules/authentication/widget/custom_text_form_field.dart';

class ResetPassScreen extends StatefulWidget {
  const ResetPassScreen({super.key});

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();

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
                    Text(
                      textAlign: TextAlign.center,
                      "Reset Password",
                      style: GoogleFonts.inter(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                   const Text("please set your new Password  "),
                    Image.asset(AppAssets.forget3),
                    Row(
                      children: [
                        const Icon(Icons.lock_outline,size: 24,color: AppColors.black,),
                        Text(
                          "New password",
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                     CustomTextFormField(
                      controller: newPassController,
                      isPass: true,
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        const Icon(Icons.lock_outline,size: 24,color: AppColors.black,),
                        Text(
                          "Confirm password",
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                     CustomTextFormField(
                       controller: confirmPassController,
                       isPass: true,
                    ),
                    const SizedBox(height: 60,),
                    CustomBtn(
                      text: "NEXT",
                      onTap: (){
                        final newPass = newPassController.text.trim();
                        final confirmPass = confirmPassController.text.trim();

                        if (newPass.isEmpty || confirmPass.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Please fill both fields")),
                          );
                          return;
                        }

                        if (newPass != confirmPass) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Passwords do not match")),
                          );
                          return;
                        }

                        Navigator.pushNamed(context, AppRoutesName.congratScreen);
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
