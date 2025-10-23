// ignore_for_file: avoid_print

import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/model/chat/conversation_model.dart';
import 'package:excellent_trade_app/repository/chat/chat_api_repository.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatApiRepository chatApiRepository;

  ChatBloc({required this.chatApiRepository}) : super(const ChatState()) {
    on<GetConversationEvent>(_onGetConversation);
    on<MessageEvent>(_onMessageEvent);
  }

  Future<void> _onGetConversation(
    GetConversationEvent event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.copyWith(apiResponse: ApiResponse.loading()));

    final userId = SessionController.user.id.toString();
    if (userId.isEmpty) {
      print('User ID is empty, cannot fetch conversation.');
      return;
    }

    try {
      final Map<String, dynamic> data = {
        "action": event.action,
        "user_type": event.userType,
        "user_id": userId,
      };

      final response = await chatApiRepository.conservation(data);

      if (response == null) {
        print('No response from server');
        emit(
          state.copyWith(
            apiResponse: ApiResponse.error("No response from server"),
          ),
        );
        return;
      }

      if (response['success'] == true && response['conversations'] != null) {
        final conversationModel = ConversationModel.fromJson(response);
        emit(
          state.copyWith(
            conversationModel: conversationModel,
            apiResponse: ApiResponse.completed(
              "Conversation fetched successfully",
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            apiResponse: ApiResponse.error(
              response['error'] ?? "Error while fetching data",
            ),
          ),
        );
      }
    } catch (e) {
      print('Error while fetching conversation: $e');
      emit(state.copyWith(apiResponse: ApiResponse.error(e.toString())));
    }
  }

  Future<void> _onMessageEvent(
    MessageEvent event,
    Emitter<ChatState> emit,
  ) async {
    Map<String, dynamic> data = {
      "customer_id": event.customerId,
      "restaurant_id": event.restaurantId,
      "sender_type": event.senderType,
      "sender_id": event.senderId,
      "message": event.message,
    };
    final response = await chatApiRepository.message(data);
    if (response == null) return print("No response from server");
    if (response['success'] == true && response['message_id'] != null) {
      // on successful response add message to conversation and message state
    } else {
      emit(
        state.copyWith(
          apiResponse: ApiResponse.error(
            response['error'] ?? 'error while fetching data from server',
          ),
        ),
      );
      print(
        "error: ${response['error'] ?? 'error while fetching data from server'}",
      );
    }
  }
}
