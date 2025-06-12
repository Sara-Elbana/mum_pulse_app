import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/app_bar_services_widget.dart';
import 'package:mom_pulse_app/modules/layout/pages/profile/cubit/profile_cubit.dart';
import 'package:mom_pulse_app/modules/layout/pages/profile/cubit/profile_state.dart';
import 'package:mom_pulse_app/modules/layout/pages/profile/widget/custom_btn_profile_widget.dart';
import 'package:mom_pulse_app/modules/layout/pages/profile/widget/edit_dialog.dart';
import 'package:mom_pulse_app/modules/layout/pages/profile/widget/profile_image_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? pickedImage;

  @override
  void initState() {
    super.initState();
    loadSavedImage();
  }

  Future<void> loadSavedImage() async {
    final image = await ProfileImageService.loadSavedImage();
    if (image != null) {
      setState(() => pickedImage = image);
    }
  }

  Future<void> pickImage() async {
    final image = await ProfileImageService.pickImage();
    if (image != null) {
      setState(() => pickedImage = image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(),
      child: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileUpdated) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Updated successfully ✅")),
            );
            setState(() {});
          } else if (state is ProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            final user = FirebaseAuth.instance.currentUser;
            final displayName = user?.displayName ?? "Unknown User";
            final email = user?.email ?? "No email";
            final photoURL = user?.photoURL;
            return Scaffold(
              backgroundColor: AppColors.white,
              appBar: const AppBarServicesWidget(
                showActions: false,
                backRoute: AppRoutesName.layoutScreen,
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            maxRadius: 60,
                            backgroundColor: const Color(0xffD9D9D9),
                            backgroundImage: photoURL != null
                                ? NetworkImage(photoURL)
                                : (pickedImage != null &&
                                        pickedImage!.existsSync())
                                    ? FileImage(pickedImage!) as ImageProvider
                                    : null,
                            child: photoURL == null && pickedImage == null
                                ? const Icon(
                                    Icons.image_outlined,
                                    size: 30,
                                  )
                                : null,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: pickImage,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: AppColors.purple,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child:  const Icon(
                                  Icons.camera_alt_outlined,
                                  size: 22,
                                  //color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        displayName,
                        style: GoogleFonts.inter(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        email,
                        style: GoogleFonts.inter(
                            color: AppColors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomBtnProfileWidget(
                        text: "Edit Name ",
                        icon: AppAssets.editIcon,
                        onTap: () {
                          EditDialog.show(
                            context: context,
                            title: "Edit Name",
                            initialValue: displayName,
                            onSave: (newName, [password]) {
                              if (newName != displayName) {
                                context
                                    .read<ProfileCubit>()
                                    .updateName(newName);
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomBtnProfileWidget(
                        text: "Edit email ",
                        icon: AppAssets.editIcon,
                        onTap: () {
                          EditDialog.show(
                            context: context,
                            title: "Edit Email",
                            initialValue: email,
                            isEmail: true,
                            onSave: (newEmail, [password]) {
                              if (newEmail != email && password != null) {
                                context
                                    .read<ProfileCubit>()
                                    .updateEmail(newEmail, password);
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomBtnProfileWidget(
                        text: "Log out ",
                        icon: AppAssets.logOutIcon,
                        onTap: () async {
                          await GoogleSignIn().signOut();
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutesName.loginScreen,
                            (route) => false,
                          );
                        },
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
