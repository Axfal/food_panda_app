// ignore_for_file: avoid_print

import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/model/chat/conversation_model.dart';
import 'package:excellent_trade_app/repository/chat/chat_api_repository.dart';

import '../../model/chat/message_model.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatApiRepository chatApiRepository;

  ChatBloc({required this.chatApiRepository}) : super(const ChatState()) {
    on<GetConversationEvent>(_onGetConversation);
    on<MessageEvent>(_onMessageEvent);
    on<GetMessageEvent>(_onGetMessageEvent);
  }

  Future<void> _onGetMessageEvent(
    GetMessageEvent event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.copyWith(apiResponse: ApiResponse.loading()));

    try {
      final data = {
        "action": event.action,
        "conversation_id": event.conversationId,
      };

      final response = await chatApiRepository.getMessage(data);

      if (response == null) {
        emit(
          state.copyWith(
            apiResponse: ApiResponse.error("No response from server"),
          ),
        );
        print("No response from server");
        return;
      }

      if (response['success'] == true && response['messages'] != null) {
        final messageModel = MessageModel.fromJson(response);
        emit(
          state.copyWith(
            messageModel: messageModel,
            apiResponse: ApiResponse.completed("Messages fetched successfully"),
          ),
        );
      } else {
        final errorMsg =
            response['error'] ?? "Error while fetching data from server";
        emit(state.copyWith(apiResponse: ApiResponse.error(errorMsg)));
        print("error: $errorMsg");
      }
    } catch (e) {
      print("Exception while fetching messages: $e");
      emit(state.copyWith(apiResponse: ApiResponse.error(e.toString())));
    }
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
        "user_id": "8", //userId,
      };

      final response = await chatApiRepository.getConservation(data);

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
      if (event.customerId != null) "customer_id": event.customerId,
      if (event.restaurantId != null) "restaurant_id": event.restaurantId,
      if (event.senderType != null) "sender_type": event.senderType,
      if (event.senderId != null) "sender_id": event.senderId,
      if (event.message != null) "message": event.message,
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
