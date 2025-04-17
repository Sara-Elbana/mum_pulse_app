import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/pages/chat_bot/widget/image_picker_widget .dart';

class ChatInputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback? onMicPressed;
  final VoidCallback? onPlayPressed;
  final bool isRecording;
  final void Function(File)? onImagePicked;

  const ChatInputBar({
    super.key,
    required this.controller,
    required this.onSend,
    this.onMicPressed,
    this.onPlayPressed,
    this.isRecording = false,
    this.onImagePicked,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      cursorColor: AppColors.grey,
                      decoration: InputDecoration(
                        hintText: "Type a message...",
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.inter(fontSize: 15),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: onMicPressed,
                    icon: SvgPicture.asset(AppAssets.micIcon),
                  ),
                  ImagePickerWidget(
                      onImagePicked: onImagePicked!,
                  ),

                  // IconButton(
                  //   onPressed: onMicPressed,
                  //   icon: Icon(
                  //     isRecording? Icons.stop : Icons.mic_none_sharp,
                  //     color: AppColors.black,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: onSend,
            icon: SvgPicture.asset(AppAssets.sendIcon),
          ),
        ],
      ),
    );
  }
}
