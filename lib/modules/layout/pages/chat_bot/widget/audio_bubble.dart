import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';

class AudioBubble extends StatefulWidget {
  final String filePath;
  final bool isBot;
  const AudioBubble({
    super.key,
    required this.filePath,
    required this.isBot,
  });

  @override
  State<AudioBubble> createState() => _AudioBubbleState();
}

class _AudioBubbleState extends State<AudioBubble> {
  late AudioPlayer _player;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
  }

  Future<void> _togglePlayback() async {
    if (_isPlaying) {
      await _player.pause();
    } else {
      await _player.setFilePath(widget.filePath);
      await _player.play();
    }
    setState(() => _isPlaying = !_isPlaying);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.isBot ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: widget.isBot
              ? AppColors.yellow.withOpacity(0.6)
              : AppColors.mentGreen.withOpacity(0.6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                _isPlaying ? Icons.pause_circle : Icons.play_circle,
                color: Colors.black,
                size: 30,
              ),
              onPressed: _togglePlayback,
            ),
            Text(
              "Voice Message",
              style: GoogleFonts.inter(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
