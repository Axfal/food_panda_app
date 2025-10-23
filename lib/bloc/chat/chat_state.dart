part of 'chat_bloc.dart';

class ChatState extends Equatable {
  final ApiResponse<String> apiResponse;
  final ConversationModel conversationModel;

  const ChatState({
    this.apiResponse = const ApiResponse.completed(''),
    this.conversationModel = const ConversationModel(),
  });

  ChatState copyWith({
    ApiResponse<String>? apiResponse,
    ConversationModel? conversationModel,
  }) {
    return ChatState(
      apiResponse: apiResponse ?? this.apiResponse,
      conversationModel: conversationModel ?? this.conversationModel,
    );
  }

  @override
  List<Object?> get props => [apiResponse, conversationModel];
}
