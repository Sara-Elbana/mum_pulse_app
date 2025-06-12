import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/authentication/features/cubit/forget_password_cubit.dart';
import 'package:mom_pulse_app/modules/authentication/features/cubit/forget_password_state.dart';
import 'package:mom_pulse_app/modules/authentication/widget/custom_btn.dart';
import 'package:mom_pulse_app/modules/authentication/widget/custom_text_form_field.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state){
          if (state is ForgetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Reset link sent to email")),
            );
            Navigator.pushNamed(context, AppRoutesName.verifyYourEmailScreen);
          } else if (state is ForgetPasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state){
          final cubit = context.read<ForgetPasswordCubit>();
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
                           CustomTextFormField(
                            controller: emailController,
                            hintText: "Email or mobile number",
                            hintStyle: const TextStyle(
                                color: Colors.grey
                            ),
                          ),
                          const SizedBox(height: 60,),
                          state is ForgetPasswordLoading
                          ? const Center(child: CircularProgressIndicator(),)
                          :CustomBtn(
                            text: "NEXT",
                            onTap: (){
                              final email = emailController.text.trim();
                              if(email.isNotEmpty){
                                cubit.sendResetEmail(email);
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Please enter your email"))
                                );
                              }
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
        },
      ),
    );
  }
}
