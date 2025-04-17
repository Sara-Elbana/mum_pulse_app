import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/services/food_tips/widget/meal_time_picker_field.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/services/food_tips/widget/reminder_card.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/app_bar_services_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  bool _mealsSwitch = true;
  bool _waterSwitch = false;
  bool _fruitsSwitch = false;
  bool _warningSwitch = false;

  TimeOfDay? _breakfastTime;
  TimeOfDay? _lunchTime;
  TimeOfDay? _dinnerTime;

  @override
  void initState() {
    super.initState();
    _loadSavedTimes();
  }

  Future<void> _loadSavedTimes() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _breakfastTime = _getTimeFromPrefs(prefs, 'breakfastTime');
      _lunchTime = _getTimeFromPrefs(prefs, 'lunchTime');
      _dinnerTime = _getTimeFromPrefs(prefs, 'dinnerTime');
    });
  }

  TimeOfDay? _getTimeFromPrefs(SharedPreferences prefs, String key) {
    final timeString = prefs.getString(key);
    if (timeString == null) return null;
    final parts = timeString.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  Future<void> _saveTime(String key, TimeOfDay time) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, '${time.hour}:${time.minute}');
  }

  Future<void> _pickTime({
    required String label,
    required TimeOfDay? currentTime,
    required Function(TimeOfDay) onSelected,
    required String key,
  }) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: currentTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.mentGreen,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            timePickerTheme: TimePickerThemeData(
              dialHandColor: AppColors.mentGreen,
              dialBackgroundColor: AppColors.mentGreen.withOpacity(0.1),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      onSelected(picked);
      _saveTime(key, picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarServicesWidget(
        title: "Food Tips",
        backRoute: AppRoutesName.layoutScreen,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 14),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ReminderCard(
                iconPath: AppAssets.mealsIcon,
                iconColor: AppColors.mentGreen,
                title: "Meals Reminder",
                hintText: "Enter your meals time",
                switchValue: _mealsSwitch,
                onSwitchChanged: (value) =>
                    setState(() => _mealsSwitch = value),
                child: Column(
                  children: [
                    MealTimePickerField(
                      label: "Breakfast",
                      time: _breakfastTime,
                      onTap: () {
                        _pickTime(
                          label: "Breakfast",
                          currentTime: _breakfastTime,
                          onSelected: (time) =>
                              setState(() => _breakfastTime = time),
                          key: 'breakfastTime',
                        );
                      },
                    ),
                    MealTimePickerField(
                      label: "Lunch",
                      time: _lunchTime,
                      onTap: () {
                        _pickTime(
                          label: "Lunch",
                          currentTime: _lunchTime,
                          onSelected: (time) =>
                              setState(() => _lunchTime = time),
                          key: 'lunchTime',
                        );
                      },
                    ),
                    MealTimePickerField(
                      label: "Dinner",
                      time: _dinnerTime,
                      onTap: () {
                        _pickTime(
                          label: "Dinner",
                          currentTime: _dinnerTime,
                          onSelected: (time) =>
                              setState(() => _dinnerTime = time),
                          key: 'dinnerTime',
                        );
                      },
                    ),
                  ],
                ),
              ),
              ReminderCard(
                iconPath: AppAssets.waterIcon,
                iconColor: AppColors.purple,
                title: "Water Reminder",
                hintText: " water intake:\n 5/8 cups today",
                switchValue: _waterSwitch,
                onSwitchChanged: (value) =>
                    setState(() => _waterSwitch = value),
              ),
              ReminderCard(
                iconPath: AppAssets.fruitsIcon,
                iconColor: AppColors.yellow,
                title: "Fruits Reminder",
                hintText: "Time for a fruit snack\nfor you and your baby",
                switchValue: _fruitsSwitch,
                onSwitchChanged: (value) =>
                    setState(() => _fruitsSwitch = value),
              ),
              ReminderCard(
                iconPath: AppAssets.warningIcon,
                iconColor: AppColors.bink,
                title: "Warning Reminder",
                hintText:
                    "High sugar_ Consider having\nhealthy snacks  _High salt",
                switchValue: _warningSwitch,
                onSwitchChanged: (value) =>
                    setState(() => _warningSwitch = value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
