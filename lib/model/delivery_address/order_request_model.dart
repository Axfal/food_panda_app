import 'package:equatable/equatable.dart';

class OrderRequest extends Equatable {
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

  const OrderRequest({
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

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "restaurant_id": restaurantId,
    "total_amount": totalAmount,
    "discount_amount": discountAmount,
    "final_amount": finalAmount,
    "payment_method": paymentMethod,
    "special_instructions": specialInstructions,
    "lat": lat,
    "lng": lng,
    "house_no": houseNo,
    "street": street,
    "city": city,
    "items": items.map((e) => e.toJson()).toList(),
  };

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

class OrderItem extends Equatable {
  final int itemId;
  final String itemName;
  final int quantity;
  final double price;
  final double discountAmount;
  final double finalPrice;
  final double totalPrice;

  const OrderItem({
    required this.itemId,
    required this.itemName,
    required this.quantity,
    required this.price,
    required this.discountAmount,
    required this.finalPrice,
    required this.totalPrice,
  });

  Map<String, dynamic> toJson() => {
    "item_id": itemId,
    "item_name": itemName,
    "quantity": quantity,
    "price": price,
    "discount_amount": discountAmount,
    "final_price": finalPrice,
    "total_price": totalPrice,
  };

  @override
  List<Object?> get props => [
    itemId,
    itemName,
    quantity,
    price,
    discountAmount,
    finalPrice,
    totalPrice,
  ];
}
