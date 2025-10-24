part of 'chat_bloc.dart';

class ChatState extends Equatable {
  final ApiResponse<String> apiResponse;
  final ConversationModel conversationModel;
  final MessageModel messageModel;

  const ChatState({
    this.apiResponse = const ApiResponse.completed(''),
    this.conversationModel = const ConversationModel(),
    this.messageModel = const MessageModel(),
  });

  ChatState copyWith({
    ApiResponse<String>? apiResponse,
    ConversationModel? conversationModel,
    MessageModel? messageModel,
  }) {
    return ChatState(
      apiResponse: apiResponse ?? this.apiResponse,
      messageModel: messageModel ?? this.messageModel,
      conversationModel: conversationModel ?? this.conversationModel,
    );
  }

  @override
  List<Object?> get props => [apiResponse, conversationModel, messageModel];
}
