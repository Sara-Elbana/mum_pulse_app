import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';

class SettingItem{
  final String title;
  final String icon;
  final String route;

  const SettingItem({
    required this.title,
    required this.icon,
    required this.route,
  });
}
final List<SettingItem> settingItems = [
  const SettingItem(title: "Profile", icon: AppAssets.profileIcon, route: AppRoutesName.profileScreen),
  const SettingItem(title: "Chat bot", icon: AppAssets.chatBotIcon, route: AppRoutesName.chatScreen),
  const SettingItem(title: "Emergency call", icon: AppAssets.callIcon, route: AppRoutesName.emergencyCallScreen),
  const SettingItem(title: "App updates", icon: AppAssets.updateIcon, route: AppRoutesName.appUpdatesScreen),
  const SettingItem(title: "Notifications", icon: AppAssets.notificationIcon, route: AppRoutesName.notificationsScreen),
  const SettingItem(title: "Help", icon: AppAssets.helpIcon, route: AppRoutesName.helpScreen),
  const SettingItem(title: "About us", icon: AppAssets.aboutIcon, route: AppRoutesName.aboutUsScreen),
];