part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();
  @override
  List<Object?> get props => [];
}

class GetConversationEvent extends ChatEvent {
  final String action;
  final String userType;
  const GetConversationEvent({required this.action, required this.userType});
  @override
  List<Object> get props => [action, userType];
}

class GetMessageEvent extends ChatEvent {
  final String action;
  final String conversationId;
  const GetMessageEvent({required this.action, required this.conversationId});

  @override
  // TODO: implement props
  List<Object?> get props => [action, conversationId];
}

class MessageEvent extends ChatEvent {
  final String? customerId;
  final String? restaurantId;
  final String? senderType;
  final String? senderId;
  final String? message;

  const MessageEvent({
    this.restaurantId,
    this.customerId,
    this.senderType,
    this.senderId,
    this.message,
  });

  @override
  List<Object?> get props => [
    customerId,
    restaurantId,
    senderType,
    senderId,
    message,
  ];
}
