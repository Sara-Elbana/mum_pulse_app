import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/app_bar_services_widget.dart';
import 'package:mom_pulse_app/modules/layout/pages/setting/notifications/cubit/notification_cubit.dart';
import 'package:mom_pulse_app/modules/layout/pages/setting/notifications/cubit/notification_state.dart';
import 'package:mom_pulse_app/modules/layout/pages/setting/notifications/widget/notification_card.dart';

class NotificationsScreen extends StatelessWidget  {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> NotificationCubit()..loadPreferences(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: const AppBarServicesWidget(
          title: "Notifications",
          backRoute: AppRoutesName.settingScreen,
          showActions: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 14),
          child: BlocBuilder<NotificationCubit, NotificationState>(
            builder: (context, state){
              return Column(
                children: [
                  NotificationCard(
                    iconPath: AppAssets.doctor,
                    iconColor: AppColors.purple,
                    title: "Doctor Reminder",
                    switchValue: state.doctorReminder,
                    onSwitchChanged: (value) => context
                        .read<NotificationCubit>()
                        .toggleDoctorReminder(value),
                  ),
                  NotificationCard(
                    iconPath: AppAssets.medicine,
                    iconColor: AppColors.yellow,
                    title: "Medicine Reminder",
                    switchValue: state.medicineReminder,
                    onSwitchChanged: (value) => context
                        .read<NotificationCubit>()
                        .toggleMedicineReminder(value),
                  ),
                  NotificationCard(
                    iconPath: AppAssets.daily,
                    iconColor: AppColors.mentGreen,
                    title: "Exercise Reminder",
                    switchValue: state.exerciseReminder,
                    onSwitchChanged: (value)  => context
                        .read<NotificationCubit>()
                        .toggleExerciseReminder(value),
                  ),
                  NotificationCard(
                    iconPath: AppAssets.food,
                    iconColor: AppColors.bink,
                    title: "Food Reminder",
                    switchValue: state.foodReminder,
                    onSwitchChanged: (value)=> context
                        .read<NotificationCubit>()
                        .toggleFoodReminder(value),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
