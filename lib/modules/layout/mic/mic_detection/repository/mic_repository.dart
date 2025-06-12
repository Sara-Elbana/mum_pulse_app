import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mom_pulse_app/modules/layout/mic/mic_detection/model/prediction_result_model.dart';
import 'package:mom_pulse_app/modules/layout/mic/mic_detection/utils/audio_helper.dart';

class MicRepository {

  final String baseUrl = 'http://192.168.1.14:8000';
  // final String baseUrl = Platform.isAndroid
  //     ? 'http://10.0.2.2:8000'
  //     : 'http://localhost:8000';

  Future<PredictionResult> detectCry() async {
    try {
      final audioPath = await AudioHelper.recordAudio();
      final uri = Uri.parse('$baseUrl/predict'); // غيّري IP لو backend شغال ع جهاز تاني

      final request = http.MultipartRequest('POST', uri)
        ..files.add(await http.MultipartFile.fromPath('file', audioPath));

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return PredictionResult(
          label: json['prediction'],
          confidence: json['confidence'],
        );
      } else {
        throw Exception('Prediction failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("Failed to detect cry: $e");
    }
  }
}
