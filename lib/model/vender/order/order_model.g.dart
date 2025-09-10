// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
  success: json['success'] as bool? ?? false,
  orders:
      (json['orders'] as List<dynamic>?)
          ?.map((e) => OrderData.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{'success': instance.success, 'orders': instance.orders};

_OrderData _$OrderDataFromJson(Map<String, dynamic> json) => _OrderData(
  id: (json['id'] as num?)?.toInt() ?? 0,
  orderNumber: json['order_number'] as String? ?? '',
  customerId: (json['customer_id'] as num?)?.toInt() ?? 0,
  restaurantId: (json['restaurant_id'] as num?)?.toInt() ?? 0,
  status: json['status'] as String? ?? '',
  totalAmount: json['total_amount'] as String? ?? '0.00',
  discountAmount: json['discount_amount'] as String? ?? '0.00',
  finalAmount: json['final_amount'] as String? ?? '0.00',
  paymentMethod: json['payment_method'] as String? ?? '',
  paymentStatus: json['payment_status'] as String? ?? '',
  specialInstructions: json['special_instructions'] as String? ?? '',
  createdAt: json['created_at'] as String? ?? '',
  updatedAt: json['updated_at'] as String? ?? '',
  acceptedAt: json['accepted_at'] as String? ?? '',
  readyAt: json['ready_at'] as String? ?? '',
  preparingAt: json['preparing_at'] as String? ?? '',
  pickedUpAt: json['picked_up_at'] as String? ?? '',
  deliveredAt: json['delivered_at'] as String?,
  canceledAt: json['canceled_at'] as String? ?? '',
  failedAt: json['failed_at'] as String? ?? '',
  lat: json['lat'] as String? ?? '0.0',
  lng: json['lng'] as String? ?? '0.0',
  houseNo: json['house_no'] as String? ?? '',
  street: json['street'] as String? ?? '',
  city: json['city'] as String? ?? '',
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$OrderDataToJson(_OrderData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'customer_id': instance.customerId,
      'restaurant_id': instance.restaurantId,
      'status': instance.status,
      'total_amount': instance.totalAmount,
      'discount_amount': instance.discountAmount,
      'final_amount': instance.finalAmount,
      'payment_method': instance.paymentMethod,
      'payment_status': instance.paymentStatus,
      'special_instructions': instance.specialInstructions,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'accepted_at': instance.acceptedAt,
      'ready_at': instance.readyAt,
      'preparing_at': instance.preparingAt,
      'picked_up_at': instance.pickedUpAt,
      'delivered_at': instance.deliveredAt,
      'canceled_at': instance.canceledAt,
      'failed_at': instance.failedAt,
      'lat': instance.lat,
      'lng': instance.lng,
      'house_no': instance.houseNo,
      'street': instance.street,
      'city': instance.city,
      'items': instance.items,
    };

_OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => _OrderItem(
  id: (json['id'] as num?)?.toInt() ?? 0,
  orderId: (json['order_id'] as num?)?.toInt() ?? 0,
  itemId: (json['item_id'] as num?)?.toInt() ?? 0,
  itemName: json['item_name'] as String? ?? '',
  quantity: (json['quantity'] as num?)?.toInt() ?? 0,
  price: json['price'] as String? ?? '0.00',
  discountAmount: json['discount_amount'] as String? ?? '0.00',
  finalPrice: json['final_price'] as String? ?? '0.00',
  totalPrice: json['total_price'] as String? ?? '0.00',
  createdAt: json['created_at'] as String? ?? '',
);

Map<String, dynamic> _$OrderItemToJson(_OrderItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'item_id': instance.itemId,
      'item_name': instance.itemName,
      'quantity': instance.quantity,
      'price': instance.price,
      'discount_amount': instance.discountAmount,
      'final_price': instance.finalPrice,
      'total_price': instance.totalPrice,
      'created_at': instance.createdAt,
    };
