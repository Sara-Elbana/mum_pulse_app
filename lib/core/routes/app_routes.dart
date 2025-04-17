import 'package:flutter/material.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/modules/authentication/pages/congrat_screen.dart';
import 'package:mom_pulse_app/modules/authentication/pages/create_account_screen.dart';
import 'package:mom_pulse_app/modules/authentication/pages/forget_pass_screen.dart';
import 'package:mom_pulse_app/modules/authentication/pages/information_Screen.dart';
import 'package:mom_pulse_app/modules/authentication/pages/login_screen.dart';
import 'package:mom_pulse_app/modules/authentication/pages/reset_pass_screen.dart';
import 'package:mom_pulse_app/modules/authentication/pages/verify_your_email_screen.dart';
import 'package:mom_pulse_app/modules/layout/camera/screens/camera_screen.dart';
import 'package:mom_pulse_app/modules/layout/mic/screens/mic_screen.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/services/daily_exercise/screens/exercise_screen.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/services/doctor_appointment/screens/doctor_screen.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/services/doctor_appointment/screens/saved_appointments_screen.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/services/food_tips/screens/food_screen.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/services/medicine_reminder/screens/add_medicine_screen.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/services/medicine_reminder/screens/medicine_screen.dart';
import 'package:mom_pulse_app/modules/layout/pages/screens/layout_screen.dart';
import 'package:mom_pulse_app/modules/layout/pages/chat_bot/screens/chat_screen.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/screens/home_screen.dart';
import 'package:mom_pulse_app/modules/layout/pages/profile/screens/profile_screen.dart';
import 'package:mom_pulse_app/modules/layout/pages/setting/about_us/screens/about_us_screen.dart';
import 'package:mom_pulse_app/modules/layout/pages/setting/app_updates/screens/app_updates_screen.dart';
import 'package:mom_pulse_app/modules/layout/pages/setting/emergency_call/screens/emergency_call_screen.dart';
import 'package:mom_pulse_app/modules/layout/pages/setting/help/screens/faq_screen.dart';
import 'package:mom_pulse_app/modules/layout/pages/setting/help/screens/help_screen.dart';
import 'package:mom_pulse_app/modules/layout/pages/setting/notifications/screens/notifications_screen.dart';
import 'package:mom_pulse_app/modules/layout/pages/setting/screens/setting_screen.dart';
import 'package:mom_pulse_app/modules/onboarding/splash/screens/first_splash_screen.dart';
import 'package:mom_pulse_app/modules/onboarding/splash/screens/second_splash_screen.dart';


class AppRoutes{
  static Map<String, Widget Function(BuildContext)> routes ={
    AppRoutesName.firstSplashScreen:(_) => const FirstSplashScreen(),
    AppRoutesName.secondSplashScreen:(_) => const SecondSplashScreen(),
    AppRoutesName.loginScreen:(_) => const LoginScreen(),
    AppRoutesName.createAccountScreen:(_) => const CreateAccountScreen(),
    AppRoutesName.forgetPassScreen:(_) => const ForgetPassScreen(),
    AppRoutesName.informationScreen:(_) => const InformationScreen(),
    AppRoutesName.verifyYourEmailScreen:(_) => const VerifyYourEmailScreen(),
    AppRoutesName.resetPassScreen:(_) => const ResetPassScreen(),
    AppRoutesName.congratScreen:(_) => const CongratScreen(),
    AppRoutesName.layoutScreen:(_) => const LayoutScreen(),
    AppRoutesName.homeScreen:(_) => const HomeScreen(),
    AppRoutesName.profileScreen:(_) => const ProfileScreen(),
    AppRoutesName.chatScreen:(_) => const ChatScreen(),
    AppRoutesName.settingScreen:(_) => const SettingScreen(),
    AppRoutesName.doctorScreen:(_) => const DoctorScreen(),
    AppRoutesName.medicineScreen:(_) => const MedicineScreen(),
    AppRoutesName.exerciseScreen:(_) => const ExerciseScreen(),
    AppRoutesName.foodScreen:(_) => const FoodScreen(),
    AppRoutesName.cameraScreen:(_) => const CameraScreen(),
    AppRoutesName.micScreen:(_) => const MicScreen(),
    AppRoutesName.savedAppointmentsScreen:(_) => const SavedAppointmentsScreen(),
    AppRoutesName.addMedicineScreen:(_) => const AddMedicineScreen(),
    AppRoutesName.emergencyCallScreen:(_) => const EmergencyCallScreen(),
    AppRoutesName.appUpdatesScreen:(_) => const AppUpdatesScreen(),
    AppRoutesName.notificationsScreen:(_) => const NotificationsScreen(),
    AppRoutesName.helpScreen:(_) => const HelpScreen(),
    AppRoutesName.aboutUsScreen:(_) => const AboutUsScreen(),
    AppRoutesName.faqScreen:(_) => const FaqScreen(),


  };
}