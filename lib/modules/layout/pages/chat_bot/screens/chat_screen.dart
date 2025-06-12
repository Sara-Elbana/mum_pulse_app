import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/pages/chat_bot/logic/chat_cubit.dart';
import 'package:mom_pulse_app/modules/layout/pages/chat_bot/logic/chat_state.dart';
import 'package:mom_pulse_app/modules/layout/pages/chat_bot/widget/audio_bubble.dart';
import 'package:mom_pulse_app/modules/layout/pages/chat_bot/widget/chat_bubble.dart';
import 'package:mom_pulse_app/modules/layout/pages/chat_bot/widget/chat_input_bar.dart';
import 'package:mom_pulse_app/modules/layout/pages/chat_bot/widget/image_bubble.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/app_bar_services_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {'text': "Hello! How can I help you?", 'isBot': true},
    //{'text': "What’s the best food for my baby?", 'isBot': false},
  ];

  void _handleSendMessage(BuildContext context) {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;
    context.read<ChatCubit>().sendMessage(text);
    _messageController.clear();
  }

  // final AudioRecorder _audioRecorder = AudioRecorder();
  // final AudioPlayer _audioPlayer = AudioPlayer();
  // bool _isRecording = false;
  // String? _lastRecordingPath;

  // Future<void> _toggleRecording() async {
  //   var micStatus = await Permission.microphone.status;
  //   if (!micStatus.isGranted) {
  //     micStatus = await Permission.microphone.request();
  //     if (!micStatus.isGranted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text("Microphone permission not granted")),
  //       );
  //       return;
  //     }
  //   }
  //
  //   if (_isRecording) {
  //     final path = await _audioRecorder.stop();
  //     setState(() {
  //       _isRecording = false;
  //       _lastRecordingPath = path;
  //       _messages.add({
  //         'text': path,
  //         'isBot': false,
  //         'isAudio': true,
  //       });
  //     });
  //     print('🎙️ Recording saved at: $path');
  //   } else {
  //     final path =
  //         '/sdcard/Download/voice_${DateTime.now().millisecondsSinceEpoch}.m4a';
  //     await _audioRecorder
  //         .start(const RecordConfig(encoder: AudioEncoder.aacLc), path: path);
  //     setState(() {
  //       _isRecording = true;
  //       _lastRecordingPath = path;
  //     });
  //   }
  // }
  //
  // Future<void> _playRecording() async {
  //   if (_lastRecordingPath != null) {
  //     await _audioPlayer.setFilePath(_lastRecordingPath!);
  //     await _audioPlayer.play();
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text("No recording found")),
  //     );
  //   }
  // }

  @override
  void dispose() {
    _messageController.dispose();
    // _audioRecorder.dispose();
    // _audioPlayer.dispose();
    super.dispose();
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: BlocBuilder<ChatCubit, ChatState>(
                builder: (context, state){
                  return ListView.builder(
                    itemCount: state.messages.length,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    itemBuilder: (context, index) {
                      final message = state.messages[index];
                      // if (message['isAudio'] == true) {
                      //   return AudioBubble(
                      //       filePath: message['text'], isBot: message['isBot']);
                      // }
                      // if (message['isImage'] == true) {
                      //   return ImageBubble(
                      //       imageFile: message['text'], isBot: message['isBot']);
                      // }
                      return ChatBubble(
                        message: message.message,
                        isBot: !message.isUser,
                      );
                    },
                  );
                },
              ),
            ),
            ChatInputBar(
              controller: _messageController,
              onSend:()=> _handleSendMessage(context),
              //onMicPressed: _toggleRecording,
             // isRecording: _isRecording,
             //  onImagePicked: (file) {
             //    setState(() {
             //      _messages.add({
             //        'text': file,
             //        'isBot': false,
             //        'isImage': true,
             //      });
             //    });
             //  },
            ),
          ],
        ),
      ),
    );
  }
}



