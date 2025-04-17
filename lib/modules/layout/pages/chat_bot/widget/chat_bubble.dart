import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isBot;
  const ChatBubble({
    super.key,
    required this.message,
    required this.isBot,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isBot
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          color: isBot
              ? AppColors.yellow.withOpacity(0.6)
              : AppColors.mentGreen.withOpacity(0.6),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: isBot
                ? const Radius.circular(0)
                : const Radius.circular(20),
            bottomRight: isBot
                ? const Radius.circular(20)
                : const Radius.circular(0),
          ),
        ),
        child: Text(
          message,
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
