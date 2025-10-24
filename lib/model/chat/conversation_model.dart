import 'package:equatable/equatable.dart';

class ConversationModel extends Equatable {
  final bool? success;
  final List<Conversations>? conversations;

  const ConversationModel({this.success, this.conversations});

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      success: json['success'] as bool?,
      conversations: (json['conversations'] as List<dynamic>?)
          ?.map((v) => Conversations.fromJson(v))
          .toList() ??
          [],
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
      id: json['id'] as int?,
      restaurantId: json['restaurant_id'] as int?,
      customerId: json['customer_id'] as int?,
      lastMessageAt: json['last_message_at'] as String?,
      lastMessage: json['last_message'] as String?,
      restaurantName: json['restaurant_name'] as String?,
      restaurantLogo: json['restaurant_logo'] as String?,
      customerName: json['customer_name'] as String?,
      customerRole: json['customer_role'] as String?,
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
