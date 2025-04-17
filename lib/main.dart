import 'package:flutter/material.dart';
import 'package:mom_pulse_app/core/routes/app_routes.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      initialRoute: AppRoutesName.secondSplashScreen,
    );
  }
}


