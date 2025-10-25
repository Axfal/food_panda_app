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
    on<SendMessageEvent>(_onSendMessageEvent);
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
        "user_id": userId,
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

  Future<void> _onSendMessageEvent(
    SendMessageEvent event,
    Emitter<ChatState> emit,
  ) async {
    try {
      emit(state.copyWith(apiResponse: ApiResponse.loading()));

      Map<String, dynamic> data = {
        "customer_id": event.customerId.toString(),
        "restaurant_id": event.restaurantId.toString(),
        "sender_type": event.senderType,
        "sender_id": event.senderId.toString(),
        "message": event.message,
      };

      final response = await chatApiRepository.sendMessage(data);

      if (response == null) {
        emit(
          state.copyWith(
            apiResponse: ApiResponse.error("No response from server"),
          ),
        );
        print("No response from server");
        return;
      }

      if (response['success'] == true && response['message_id'] != null) {
        final newMessage = Messages(
          id: response['message_id'],
          senderType: event.senderType,
          senderId: event.senderId,
          messageText: event.message,
          createdAt: DateTime.now().toIso8601String(),
          senderName: response['sender_name'] ?? 'You',
          restaurantLogo: response['restaurant_logo'],
        );

        final updatedMessages = List<Messages>.from(state.messageModel.messages)
          ..add(newMessage);

        final updatedMessageModel = state.messageModel.copyWith(
          messages: updatedMessages,
        );

        final updatedConversations = List<Conversations>.from(
          state.conversationModel.conversations ?? [],
        );

        final conversationIndex = updatedConversations.indexWhere(
          (c) => c.id == response['conversation_id'],
        );

        if (conversationIndex != -1) {
          final oldConversation = updatedConversations[conversationIndex];
          updatedConversations[conversationIndex] = oldConversation.copyWith(
            lastMessage: event.message,
            lastMessageAt: DateTime.now().toIso8601String(),
          );
        }

        final updatedConversationModel = state.conversationModel.copyWith(
          conversations: updatedConversations,
        );

        emit(
          state.copyWith(
            apiResponse: ApiResponse.completed("Message sent successfully"),
            messageModel: updatedMessageModel,
            conversationModel: updatedConversationModel,
          ),
        );

        print("Message sent & state updated successfully");
      } else {
        emit(
          state.copyWith(
            apiResponse: ApiResponse.error(
              response['error'] ?? 'Error while sending message',
            ),
          ),
        );
        print("Error: ${response['error']}");
      }
    } catch (e) {
      emit(
        state.copyWith(
          apiResponse: ApiResponse.error("Exception: ${e.toString()}"),
        ),
      );
      print("Exception while sending message: $e");
    }
  }
}
