import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_pulse_app/modules/layout/pages/chat_bot/data/models/chat_message_model.dart';
import 'package:mom_pulse_app/modules/layout/pages/chat_bot/data/repository/chat_repository.dart';
import 'package:mom_pulse_app/modules/layout/pages/chat_bot/logic/chat_state.dart';




class ChatCubit extends Cubit<ChatState> {
  final ChatRepository chatRepository;

  ChatCubit(this.chatRepository) : super(ChatState(messages: []));

  void sendMessage(String userMessage) async {
    emit(state.copyWith(
      messages: [...state.messages,
        ChatMessage(message: userMessage, isUser: true),
        //ChatMessage(message: '...', isUser: false),
      ],
      isLoading: true,
    ));

    try {
      final response = await chatRepository.sendMessage(userMessage);
      emit(state.copyWith(
        messages: [...state.messages, ChatMessage(message: response.response, isUser: false)],
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        messages: [...state.messages, ChatMessage(message: 'حدث خطأ، حاول مرة أخرى.', isUser: false)],
        isLoading: false,
      ));
    }
  }
}