// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class ConversationModel extends Equatable {
  final bool success;
  final List<Conversations> conversations;

  const ConversationModel({
    this.success = false,
    this.conversations = const [],
  });

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      success: json['success'] ?? false,
      conversations: (json['conversations'] as List<dynamic>?)
          ?.map((e) => Conversations.fromJson(e))
          .toList() ??
          const [],
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'conversations': conversations.map((e) => e.toJson()).toList(),
  };

  /// ✅ Added copyWith method
  ConversationModel copyWith({
    bool? success,
    List<Conversations>? conversations,
  }) {
    return ConversationModel(
      success: success ?? this.success,
      conversations: conversations ?? this.conversations,
    );
  }

  @override
  List<Object?> get props => [success, conversations];
}

class Conversations extends Equatable {
  final int? id;
  final int? restaurantId;
  final int? customerId;
  final String? lastMessageAt;
  final String? lastMessage;
  final String? restaurantName;
  final String? restaurantLogo;
  final String? customerName;
  final String? customerRole;

  const Conversations({
    this.id,
    this.restaurantId,
    this.customerId,
    this.lastMessageAt,
    this.lastMessage,
    this.restaurantName,
    this.restaurantLogo,
    this.customerName,
    this.customerRole,
  });

  factory Conversations.fromJson(Map<String, dynamic> json) {
    return Conversations(
      id: json['id'],
      restaurantId: json['restaurant_id'],
      customerId: json['customer_id'],
      lastMessageAt: json['last_message_at'],
      lastMessage: json['last_message'],
      restaurantName: json['restaurant_name'],
      restaurantLogo: json['restaurant_logo'],
      customerName: json['customer_name'],
      customerRole: json['customer_role'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'restaurant_id': restaurantId,
    'customer_id': customerId,
    'last_message_at': lastMessageAt,
    'last_message': lastMessage,
    'restaurant_name': restaurantName,
    'restaurant_logo': restaurantLogo,
    'customer_name': customerName,
    'customer_role': customerRole,
  };

  /// ✅ Added copyWith method
  Conversations copyWith({
    int? id,
    int? restaurantId,
    int? customerId,
    String? lastMessageAt,
    String? lastMessage,
    String? restaurantName,
    String? restaurantLogo,
    String? customerName,
    String? customerRole,
  }) {
    return Conversations(
      id: id ?? this.id,
      restaurantId: restaurantId ?? this.restaurantId,
      customerId: customerId ?? this.customerId,
      lastMessageAt: lastMessageAt ?? this.lastMessageAt,
      lastMessage: lastMessage ?? this.lastMessage,
      restaurantName: restaurantName ?? this.restaurantName,
      restaurantLogo: restaurantLogo ?? this.restaurantLogo,
      customerName: customerName ?? this.customerName,
      customerRole: customerRole ?? this.customerRole,
    );
  }

  @override
  List<Object?> get props => [
    id,
    restaurantId,
    customerId,
    lastMessageAt,
    lastMessage,
    restaurantName,
    restaurantLogo,
    customerName,
    customerRole,
  ];
}
