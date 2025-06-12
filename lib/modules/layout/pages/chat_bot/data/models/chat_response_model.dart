class ChatResponseModel {
  final String response;

  ChatResponseModel({required this.response});

  factory ChatResponseModel.fromJson(Map<String, dynamic> json) {
    return ChatResponseModel(response: json['response']);
  }
}
