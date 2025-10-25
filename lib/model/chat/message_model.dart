import 'package:equatable/equatable.dart';

/// ✅ Message Model - represents the API response for messages
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
      messages: (json['messages'] as List?)
          ?.map((e) => Messages.fromJson(e as Map<String, dynamic>))
          .toList() ??
          const [],
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'messages': messages.map((v) => v.toJson()).toList(),
  };

  /// Copy with new data (optional but very useful for BLoC updates)
  MessageModel copyWith({
    bool? success,
    List<Messages>? messages,
  }) {
    return MessageModel(
      success: success ?? this.success,
      messages: messages ?? this.messages,
    );
  }

  @override
  List<Object?> get props => [success, messages];
}

/// ✅ Messages Model - represents a single chat message
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

  /// Copy with new data (useful when updating message state)
  Messages copyWith({
    int? id,
    String? senderType,
    int? senderId,
    String? messageText,
    String? createdAt,
    String? senderName,
    String? restaurantLogo,
  }) {
    return Messages(
      id: id ?? this.id,
      senderType: senderType ?? this.senderType,
      senderId: senderId ?? this.senderId,
      messageText: messageText ?? this.messageText,
      createdAt: createdAt ?? this.createdAt,
      senderName: senderName ?? this.senderName,
      restaurantLogo: restaurantLogo ?? this.restaurantLogo,
    );
  }

  @override
  List<Object?> get props => [
    id,
    senderType,
    senderId,
    messageText,
    createdAt,
    senderName,
    restaurantLogo,
  ];
}
