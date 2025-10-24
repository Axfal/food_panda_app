import 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  final bool success;
  final List<Messages> messages;

  const MessageModel({
    this.success = false,
    this.messages = const [],
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      success: json['success'] ?? false,
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => Messages.fromJson(e as Map<String, dynamic>))
          .toList() ??
          const [],
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'messages': messages.map((v) => v.toJson()).toList(),
  };

  @override
  List<Object?> get props => [success, messages];
}

class Messages extends Equatable {
  final int? id;
  final String? senderType;
  final int? senderId;
  final String? messageText;
  final String? createdAt;
  final String? senderName;
  final String? restaurantLogo;

  const Messages({
    this.id,
    this.senderType,
    this.senderId,
    this.messageText,
    this.createdAt,
    this.senderName,
    this.restaurantLogo,
  });

  factory Messages.fromJson(Map<String, dynamic> json) {
    return Messages(
      id: json['id'],
      senderType: json['sender_type'],
      senderId: json['sender_id'],
      messageText: json['message_text'],
      createdAt: json['created_at'],
      senderName: json['sender_name'],
      restaurantLogo: json['restaurant_logo'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'sender_type': senderType,
    'sender_id': senderId,
    'message_text': messageText,
    'created_at': createdAt,
    'sender_name': senderName,
    'restaurant_logo': restaurantLogo,
  };

  @override
  List<Object?> get props =>
      [id, senderType, senderId, messageText, createdAt, senderName, restaurantLogo];
}
