import 'package:flutter/material.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';

class CustomFloatingBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  const CustomFloatingBtn({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: AppColors.mentGreen,
      child: const Icon(
        Icons.add,
        size: 30,
        color: AppColors.black,
      ),
    );
  }
}
