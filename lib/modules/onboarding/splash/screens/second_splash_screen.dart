import 'package:flutter/material.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/modules/onboarding/splash/widget/page_view_intro_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondSplashScreen extends StatefulWidget {
  const SecondSplashScreen({super.key});

  @override
  State<SecondSplashScreen> createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen> {
  int currentPage = 0;

  void handlePageChange(int index){
    setState(() {
      currentPage = index;
    });
  }

  @override
  void initState() {
     super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) async{
       if(!mounted) return;
       await _checkFirstTime();
     });
  }

  Future<void> _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (!isFirstTime) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, AppRoutesName.loginScreen);
    } else {
      await prefs.setBool('isFirstTime', false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: PageViewIntroWidget(
                    onPageChanged: handlePageChange,
                ),
              ),
          ),
      ),
    );
  }
}
