class OrderHistoryModel {
  final bool? success;
  final List<Orders>? orders;
  final int? limit;
  final int? offset;

  const OrderHistoryModel({
    this.success,
    this.orders,
    this.limit,
    this.offset,
  });

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    return OrderHistoryModel(
      success: json['success'],
      orders: json['orders'] != null
          ? (json['orders'] as List)
          .map((v) => Orders.fromJson(v))
          .toList()
          : [],
      limit: json['limit'],
      offset: json['offset'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'orders': orders?.map((v) => v.toJson()).toList(),
      'limit': limit,
      'offset': offset,
    };
  }
}

class Orders {
  final int? id;
  final String? orderNumber;
  final int? customerId;
  final int? restaurantId;
  final int? deliveryBoyId;
  final String? status;
  final String? trackingStatus;
  final String? totalAmount;
  final String? discountAmount;
  final String? finalAmount;
  final String? paymentMethod;
  final String? paymentStatus;
  final String? specialInstructions;
  final String? createdAt;
  final String? updatedAt;
  final String? acceptedAt;
  final String? readyAt;
  final String? preparingAt;
  final String? deliveryAcceptedAt;
  final String? pickedUpAt;
  final String? deliveredAt;
  final String? canceledAt;
  final String? failedAt;
  final String? lastLocationUpdate;
  final String? lat;
  final String? lng;
  final String? houseNo;
  final String? street;
  final String? city;
  final List<Items>? items;

  const Orders({
    this.id,
    this.orderNumber,
    this.customerId,
    this.restaurantId,
    this.deliveryBoyId,
    this.status,
    this.trackingStatus,
    this.totalAmount,
    this.discountAmount,
    this.finalAmount,
    this.paymentMethod,
    this.paymentStatus,
    this.specialInstructions,
    this.createdAt,
    this.updatedAt,
    this.acceptedAt,
    this.readyAt,
    this.preparingAt,
    this.deliveryAcceptedAt,
    this.pickedUpAt,
    this.deliveredAt,
    this.canceledAt,
    this.failedAt,
    this.lastLocationUpdate,
    this.lat,
    this.lng,
    this.houseNo,
    this.street,
    this.city,
    this.items,
  });

  factory Orders.fromJson(Map<String, dynamic> json) {
    return Orders(
      id: json['id'],
      orderNumber: json['order_number'],
      customerId: json['customer_id'],
      restaurantId: json['restaurant_id'],
      deliveryBoyId: json['delivery_boy_id'],
      status: json['status'],
      trackingStatus: json['tracking_status'],
      totalAmount: json['total_amount'],
      discountAmount: json['discount_amount'],
      finalAmount: json['final_amount'],
      paymentMethod: json['payment_method'],
      paymentStatus: json['payment_status'],
      specialInstructions: json['special_instructions'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      acceptedAt: json['accepted_at'],
      readyAt: json['ready_at'],
      preparingAt: json['preparing_at'],
      deliveryAcceptedAt: json['delivery_accepted_at'],
      pickedUpAt: json['picked_up_at'],
      deliveredAt: json['delivered_at'],
      canceledAt: json['canceled_at'],
      failedAt: json['failed_at'],
      lastLocationUpdate: json['last_location_update'],
      lat: json['lat'],
      lng: json['lng'],
      houseNo: json['house_no'],
      street: json['street'],
      city: json['city'],
      items: json['items'] != null
          ? (json['items'] as List).map((v) => Items.fromJson(v)).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_number': orderNumber,
      'customer_id': customerId,
      'restaurant_id': restaurantId,
      'delivery_boy_id': deliveryBoyId,
      'status': status,
      'tracking_status': trackingStatus,
      'total_amount': totalAmount,
      'discount_amount': discountAmount,
      'final_amount': finalAmount,
      'payment_method': paymentMethod,
      'payment_status': paymentStatus,
      'special_instructions': specialInstructions,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'accepted_at': acceptedAt,
      'ready_at': readyAt,
      'preparing_at': preparingAt,
      'delivery_accepted_at': deliveryAcceptedAt,
      'picked_up_at': pickedUpAt,
      'delivered_at': deliveredAt,
      'canceled_at': canceledAt,
      'failed_at': failedAt,
      'last_location_update': lastLocationUpdate,
      'lat': lat,
      'lng': lng,
      'house_no': houseNo,
      'street': street,
      'city': city,
      'items': items?.map((v) => v.toJson()).toList(),
    };
  }
}

class Items {
  final int? id;
  final int? orderId;
  final int? itemId;
  final String? itemName;
  final int? quantity;
  final String? price;
  final String? discountAmount;
  final String? finalPrice;
  final String? totalPrice;
  final String? createdAt;

  const Items({
    this.id,
    this.orderId,
    this.itemId,
    this.itemName,
    this.quantity,
    this.price,
    this.discountAmount,
    this.finalPrice,
    this.totalPrice,
    this.createdAt,
  });

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      id: json['id'],
      orderId: json['order_id'],
      itemId: json['item_id'],
      itemName: json['item_name'],
      quantity: json['quantity'],
      price: json['price'],
      discountAmount: json['discount_amount'],
      finalPrice: json['final_price'],
      totalPrice: json['total_price'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_id': orderId,
      'item_id': itemId,
      'item_name': itemName,
      'quantity': quantity,
      'price': price,
      'discount_amount': discountAmount,
      'final_price': finalPrice,
      'total_price': totalPrice,
      'created_at': createdAt,
    };
  }
}
