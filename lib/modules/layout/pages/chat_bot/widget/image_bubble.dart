import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';

class ImageBubble extends StatelessWidget {
  final File imageFile;
  final bool isBot;
  const ImageBubble({
    super.key,
    required this.imageFile,
    required this.isBot,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isBot ?Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.mentGreen.withOpacity(0.3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.file(
            imageFile,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
