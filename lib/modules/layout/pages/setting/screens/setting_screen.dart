import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/app_bar_services_widget.dart';
import 'package:mom_pulse_app/modules/layout/pages/profile/cubit/profile_cubit.dart';
import 'package:mom_pulse_app/modules/layout/pages/profile/cubit/profile_state.dart';
import 'package:mom_pulse_app/modules/layout/pages/setting/widget/data_setting_widget.dart';
import 'package:mom_pulse_app/modules/layout/pages/setting/widget/setting_item.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().loadUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarServicesWidget(
        showActions: false,
        backRoute: AppRoutesName.layoutScreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                if (state is ProfileLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProfileLoaded) {
                  return Row(
                    children: [
                      CircleAvatar(
                        maxRadius: 30,
                        backgroundColor: AppColors.mentGreen,
                        backgroundImage: state.photoUrl != null
                            ? NetworkImage(state.photoUrl!)
                            : null,
                        child: state.photoUrl == null
                            ? const Icon(Icons.image_outlined)
                            : null,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        state.name ?? "No Name",
                        style: GoogleFonts.inter(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                    ],
                  );
                } else if (state is ProfileError) {
                  return Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
              const SizedBox(
                height: 60,
              ),
              ...settingItems.map((item) => Column(
                    children: [
                      DataSettingWidget(
                        title: item.title,
                        icon: item.icon,
                        onTap: () {
                          Navigator.pushNamed(context, item.route);
                        },
                      ),
                      const SizedBox(height: 20),
                      const Divider(color: AppColors.mentGreen),
                      const SizedBox(height: 20),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
