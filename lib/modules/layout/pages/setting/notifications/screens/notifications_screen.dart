import 'package:flutter/material.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/app_bar_services_widget.dart';
import 'package:mom_pulse_app/modules/layout/pages/setting/notifications/widget/notification_card.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool _exerciseSwitch = false;
  bool _medicineSwitch = false;
  bool _doctorSwitch = false;
  bool _foodSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarServicesWidget(
        title: "Notifications",
        backRoute: AppRoutesName.settingScreen,
        showActions: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 14),
        child: Column(
          children: [
            NotificationCard(
              iconPath: AppAssets.doctor,
              iconColor: AppColors.purple,
              title: "Doctor Reminder",
              switchValue: _doctorSwitch,
              onSwitchChanged: (value) => setState(() => _doctorSwitch = value),
            ),
            NotificationCard(
              iconPath: AppAssets.medicine,
              iconColor: AppColors.yellow,
              title: "Medicine Reminder",
              switchValue: _medicineSwitch,
              onSwitchChanged: (value) =>
                  setState(() => _medicineSwitch = value),
            ),
            NotificationCard(
              iconPath: AppAssets.daily,
              iconColor: AppColors.mentGreen,
              title: "Exercise Reminder",
              switchValue: _exerciseSwitch,
              onSwitchChanged: (value) =>
                  setState(() => _exerciseSwitch = value),
            ),
            NotificationCard(
              iconPath: AppAssets.food,
              iconColor: AppColors.bink,
              title: "Food Reminder",
              switchValue: _foodSwitch,
              onSwitchChanged: (value) => setState(() => _foodSwitch = value),
            ),
          ],
        ),
      ),
    );
  }
}
