import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lottie/lottie.dart';
import 'package:mom_pulse_app/modules/onboarding/splash/cubit/splash_cubit.dart';

class FirstSplashScreen extends StatelessWidget {
  const FirstSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..checkUserStatus(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashNavigateToIntro) {
            Navigator.pushReplacementNamed(
                context, AppRoutesName.secondSplashScreen);
          } else if (state is SplashNavigateToHome) {
            Navigator.pushReplacementNamed(context, AppRoutesName.layoutScreen);
          } else if (state is SplashNavigateToLogin) {
            Navigator.pushReplacementNamed(context, AppRoutesName.loginScreen);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SlideInLeft(
                    duration: const Duration(milliseconds: 1000),
                    child: Image.asset(
                      AppAssets.momText,
                      height: 35,
                      // width: 80,
                    ),
                  ),
                      Lottie.asset(
                        AppAssets.pulseAnimation3,
                        repeat: true,
                        height: 90,
                        //width: 80,
                      ),
                  SlideInRight(
                    duration: const Duration(milliseconds: 1000),
                    child: Image.asset(
                      AppAssets.pulseText,
                      height: 35,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//Expanded(
//                     child: Pulse(
//                       infinite: true,
//                       duration: const Duration(seconds: 1),
//                       child: Image.asset(
//                         AppAssets.pulse,
//                         height: 60,
//                       ),
//                     ),
//                   ),
