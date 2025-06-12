import 'package:dio/dio.dart';
import 'package:mom_pulse_app/modules/layout/pages/chat_bot/data/models/chat_response_model.dart';

class ChatRepository {
  final Dio dio;

  ChatRepository(this.dio);

  Future<ChatResponseModel> sendMessage(String message) async {
    final response = await dio.post(
      'https://basmlamohamed2025.pythonanywhere.com/ask',
      data: {'message': message},
    );

    return ChatResponseModel.fromJson(response.data);
  }
}
