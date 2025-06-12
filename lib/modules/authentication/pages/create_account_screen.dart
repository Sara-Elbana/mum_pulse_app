import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/authentication/features/cubit/auth_cubit.dart';
import 'package:mom_pulse_app/modules/authentication/features/cubit/auth_state.dart';
import 'package:mom_pulse_app/modules/authentication/features/services/firebase_auth_service.dart';
import 'package:mom_pulse_app/modules/authentication/widget/custom_btn.dart';
import 'package:mom_pulse_app/modules/authentication/widget/custom_text_form_field.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> AuthCubit(FirebaseAuthService()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state){
          if (state is AuthSuccess) {
            Navigator.pushReplacementNamed(context, AppRoutesName.informationScreen);
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state){
          final cubit = context.read<AuthCubit>();
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
                    AppAssets.top,
                    width: 280,
                    height: 200,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IgnorePointer(
                      child: Image.asset(
                        AppAssets.button,
                        width: 280,
                        height: 200,
                      )),
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
                            "Register",
                            style: GoogleFonts.inter(
                                fontSize: 30, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.person_2_outlined,
                                size: 30,
                                color: AppColors.black,
                              ),
                              Text(
                                "User Name",
                                style: GoogleFonts.inter(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          CustomTextFormField(
                            controller: nameController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.email_outlined,
                                size: 24,
                                color: AppColors.black,
                              ),
                              Text(
                                "Email address",
                                style: GoogleFonts.inter(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          CustomTextFormField(
                            controller: emailController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.lock_outline,
                                size: 24,
                                color: AppColors.black,
                              ),
                              Text(
                                "Password",
                                style: GoogleFonts.inter(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          CustomTextFormField(
                            controller: passController,
                            isPass: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.lock_outline,
                                size: 24,
                                color: AppColors.black,
                              ),
                              Text(
                                "Confirm password",
                                style: GoogleFonts.inter(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          CustomTextFormField(
                            controller: confirmPassController,
                            isPass: true,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : CustomBtn(
                            text: "Register",
                            onTap: (){
                             if(passController.text != confirmPassController.text){
                               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                   content: Text("Passwords do not match"),
                               ),
                               );
                             }
                             cubit.register(
                                 email: emailController.text.trim(),
                                 password: passController.text,
                                 name: nameController.text.trim(),
                             );
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
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
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () async {
                              final user = await FirebaseAuthService().signInWithGoogle();
                              if (user != null) {
                                // optional: save user display name or uid in SharedPreferences
                                Navigator.pushReplacementNamed(context, AppRoutesName.layoutScreen);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Google Sign-In Failed")),
                                );
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: AppColors.purple,
                                ),
                              ),
                              child: Image.asset(
                                AppAssets.googleIcon,
                                width: 30,
                                height: 30,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account? ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, AppRoutesName.loginScreen);
                                },
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.inter(
                                    color: AppColors.darkPurple,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.darkPurple,
                                  ),
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
        },
      ),
    );
  }
}
