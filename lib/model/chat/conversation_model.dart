import 'package:equatable/equatable.dart';

class ConversationModel extends Equatable {
  final bool? success;
  final List<Conversations>? conversations;

  const ConversationModel({this.success, this.conversations});

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      success: json['success'],
      conversations: json['conversations'] != null
          ? (json['conversations'] as List)
                .map((v) => Conversations.fromJson(v))
                .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'conversations': conversations?.map((v) => v.toJson()).toList(),
  };

  @override
  List<Object?> get props => [success, conversations];
}

class Conversations extends Equatable {
  final int? id;
  final int? restaurantId;
  final int? customerId;
  final String? lastMessageAt;
  final String? lastMessage;

  const Conversations({
    this.id,
    this.restaurantId,
    this.customerId,
    this.lastMessageAt,
    this.lastMessage,
  });

  factory Conversations.fromJson(Map<String, dynamic> json) {
    return Conversations(
      id: json['id'],
      restaurantId: json['restaurant_id'],
      customerId: json['customer_id'],
      lastMessageAt: json['last_message_at'],
      lastMessage: json['last_message'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'restaurant_id': restaurantId,
    'customer_id': customerId,
    'last_message_at': lastMessageAt,
    'last_message': lastMessage,
  };

  @override
  List<Object?> get props => [
    id,
    restaurantId,
    customerId,
    lastMessageAt,
    lastMessage,
  ];
}
