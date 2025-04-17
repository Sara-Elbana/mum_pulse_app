import 'package:flutter/material.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/widget/btn_nav_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: onItemTapped,
            backgroundColor: AppColors.black,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items:[
              BottomNavigationBarItem(
                  icon: BtnNavItem(
                      image: AppAssets.homeIcon,
                      isSelected: selectedIndex == 0,
                  ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: BtnNavItem(
                  image: AppAssets.chatIcon,
                  isSelected: selectedIndex == 1,
                ),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: BtnNavItem(
                  image: AppAssets.settingIcon,
                  isSelected: selectedIndex == 2,
                ),
                label: 'Settings',
              ),
              BottomNavigationBarItem(
                icon: BtnNavItem(
                  image: AppAssets.profileIcon,
                  isSelected: selectedIndex == 3,
                ),
                label: 'Profile',
              ),
            ],
        ),
      ),
    );
  }
}
