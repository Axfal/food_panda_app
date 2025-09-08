part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class FetchOrderEvent extends OrderEvent {
  final String restaurantId;
  final String limit;
  final String offset;

  const FetchOrderEvent({
    required this.restaurantId,
    required this.limit,
    required this.offset,
  });

  @override
  List<Object?> get props => [restaurantId, limit, offset];
}

class CheckOutEvent extends OrderEvent {
  final int customerId;
  final int restaurantId;
  final double totalAmount;
  final double discountAmount;
  final double finalAmount;
  final String paymentMethod;
  final String specialInstructions;
  final double lat;
  final double lng;
  final String houseNo;
  final String street;
  final String city;
  final List<OrderItem> items;

  CheckOutEvent({
    required this.customerId,
    required this.restaurantId,
    required this.totalAmount,
    required this.discountAmount,
    required this.finalAmount,
    required this.paymentMethod,
    required this.specialInstructions,
    required this.lat,
    required this.lng,
    required this.houseNo,
    required this.street,
    required this.city,
    required this.items,
  });

  @override
  List<Object?> get props => [
    customerId,
    restaurantId,
    totalAmount,
    discountAmount,
    finalAmount,
    paymentMethod,
    specialInstructions,
    lat,
    lng,
    houseNo,
    street,
    city,
    items,
  ];
}

class NewOrderReceivedEvent extends OrderEvent {
  final WebSocketOrder orderData;

  NewOrderReceivedEvent(this.orderData);

  @override
  List<Object?> get props => [orderData];
}
