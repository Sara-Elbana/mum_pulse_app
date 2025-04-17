import 'package:flutter/material.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/pages/chat_bot/screens/chat_screen.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/screens/home_screen.dart';
import 'package:mom_pulse_app/modules/layout/pages/profile/screens/profile_screen.dart';
import 'package:mom_pulse_app/modules/layout/pages/setting/screens/setting_screen.dart';
import 'package:mom_pulse_app/modules/layout/widget/btn_nav_item.dart';
import 'package:mom_pulse_app/modules/layout/widget/custom_bottom_nav_bar.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;
  List<Widget> screens = const [
    HomeScreen(),
    ChatScreen(),
    SettingScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: screens[selectedIndex],
      bottomNavigationBar: selectedIndex == 1
          ? null
          : CustomBottomNavBar(
          selectedIndex: selectedIndex,
          onItemTapped: (index){
            setState(() {
              selectedIndex = index;
            });
          },
      ),
      //body: screens[selectedIndex],
    );
  }
}
