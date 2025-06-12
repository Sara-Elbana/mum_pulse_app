import 'dart:typed_data';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:mom_pulse_app/modules/layout/mic/mic_detection/model/prediction_result_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class AudioHelper {
  static final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  static bool _isRecorderInitialized = false;

  // Initialize recorder
  static Future<void> initRecorder() async {
    if (_isRecorderInitialized) return;

    final status = await Permission.microphone.request();
    if (!status.isGranted) {
      throw Exception('Microphone permission not granted');
    }

    await _recorder.openRecorder();
    _isRecorderInitialized = true;
  }

  // Record audio for 10 seconds and save as WAV
  static Future<String> recordAudio() async {
    await initRecorder();
    final dir = await getApplicationDocumentsDirectory();
    final path = '${dir.path}/baby_cry.wav';

    await _recorder.startRecorder(
      toFile: path,
      codec: Codec.pcm16WAV,
      sampleRate: 22050,
    );

    await Future.delayed(const Duration(seconds: 10));
    await _recorder.stopRecorder();
    await _recorder.closeRecorder();
    _isRecorderInitialized = false;
    return path;
  }
}
