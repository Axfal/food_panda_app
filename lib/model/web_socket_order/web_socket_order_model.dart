class WebSocketOrder {
  final String orderId;
  final String orderNumber;
  final int customerId;
  final int restaurantId;
  final List<WebSocketOrderItem> items;
  final double totalAmount;
  final double finalAmount;
  final double lat;
  final double lng;
  final String houseNo;
  final String street;
  final String city;

  WebSocketOrder({
    required this.orderId,
    required this.orderNumber,
    required this.customerId,
    required this.restaurantId,
    required this.items,
    required this.totalAmount,
    required this.finalAmount,
    required this.lat,
    required this.lng,
    required this.houseNo,
    required this.street,
    required this.city,
  });

  /// ✅ Empty constructor for default state initialization
  factory WebSocketOrder.empty() {
    return WebSocketOrder(
      orderId: '',
      orderNumber: '',
      customerId: 0,
      restaurantId: 0,
      items: [],
      totalAmount: 0.0,
      finalAmount: 0.0,
      lat: 0.0,
      lng: 0.0,
      houseNo: '',
      street: '',
      city: '',
    );
  }

  factory WebSocketOrder.fromJson(Map<String, dynamic> json) {
    return WebSocketOrder(
      orderId: json['order_id'].toString(),
      orderNumber: json['order_number'] ?? '',
      customerId: json['customer_id'] ?? 0,
      restaurantId: json['restaurant_id'] ?? 0,
      items: (json['items'] as List<dynamic>?)
          ?.map((item) => WebSocketOrderItem.fromJson(item))
          .toList() ??
          [],
      totalAmount: (json['total_amount'] as num?)?.toDouble() ?? 0.0,
      finalAmount: (json['final_amount'] as num?)?.toDouble() ?? 0.0,
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lng: (json['lng'] as num?)?.toDouble() ?? 0.0,
      houseNo: json['house_no'] ?? '',
      street: json['street'] ?? '',
      city: json['city'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "order_id": orderId,
      "order_number": orderNumber,
      "customer_id": customerId,
      "restaurant_id": restaurantId,
      "items": items.map((e) => e.toJson()).toList(),
      "total_amount": totalAmount,
      "final_amount": finalAmount,
      "lat": lat,
      "lng": lng,
      "house_no": houseNo,
      "street": street,
      "city": city,
    };
  }
}

class WebSocketOrderItem {
  final int itemId;
  final String itemName;
  final int quantity;
  final double price;
  final double discountAmount;
  final double finalPrice;
  final double totalPrice;

  WebSocketOrderItem({
    required this.itemId,
    required this.itemName,
    required this.quantity,
    required this.price,
    required this.discountAmount,
    required this.finalPrice,
    required this.totalPrice,
  });

  factory WebSocketOrderItem.fromJson(Map<String, dynamic> json) {
    return WebSocketOrderItem(
      itemId: json['item_id'] ?? 0,
      itemName: json['item_name'] ?? '',
      quantity: json['quantity'] ?? 0,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discountAmount: (json['discount_amount'] as num?)?.toDouble() ?? 0.0,
      finalPrice: (json['final_price'] as num?)?.toDouble() ?? 0.0,
      totalPrice: (json['total_price'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "item_id": itemId,
      "item_name": itemName,
      "quantity": quantity,
      "price": price,
      "discount_amount": discountAmount,
      "final_price": finalPrice,
      "total_price": totalPrice,
    };
  }
}
