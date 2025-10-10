import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    @Default(false) @JsonKey(name: 'success') bool success,
    @Default([]) @JsonKey(name: 'orders') List<OrderData> orders,
    @Default(0) @JsonKey(name: 'limit') int limit,
    @Default(0) @JsonKey(name: 'offset') int offset,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  @override
  // TODO: implement limit
  int get limit => throw UnimplementedError();

  @override
  // TODO: implement offset
  int get offset => throw UnimplementedError();

  @override
  // TODO: implement orders
  List<OrderData> get orders => throw UnimplementedError();

  @override
  // TODO: implement success
  bool get success => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

}

@freezed
class OrderData with _$OrderData {
  const factory OrderData({
    @Default(0) @JsonKey(name: 'id') int id,
    @Default('') @JsonKey(name: 'order_number') String orderNumber,
    @Default(0) @JsonKey(name: 'customer_id') int customerId,
    @Default(0) @JsonKey(name: 'restaurant_id') int restaurantId,
    @JsonKey(name: 'delivery_boy_id') int? deliveryBoyId,
    @Default('') @JsonKey(name: 'status') String status,
    @Default('') @JsonKey(name: 'tracking_status') String trackingStatus,
    @Default('0.00') @JsonKey(name: 'total_amount') String totalAmount,
    @Default('0.00') @JsonKey(name: 'discount_amount') String discountAmount,
    @Default('0.00') @JsonKey(name: 'final_amount') String finalAmount,
    @Default('') @JsonKey(name: 'payment_method') String paymentMethod,
    @Default('') @JsonKey(name: 'payment_status') String paymentStatus,
    @Default('') @JsonKey(name: 'special_instructions') String specialInstructions,
    @Default('') @JsonKey(name: 'created_at') String createdAt,
    @Default('') @JsonKey(name: 'updated_at') String updatedAt,
    @JsonKey(name: 'accepted_at') String? acceptedAt,
    @Default('') @JsonKey(name: 'ready_at') String readyAt,
    @Default('') @JsonKey(name: 'preparing_at') String preparingAt,
    @Default('') @JsonKey(name: 'delivery_accepted_at') String deliveryAcceptedAt,
    @Default('') @JsonKey(name: 'picked_up_at') String pickedUpAt,
    @JsonKey(name: 'delivered_at') String? deliveredAt,
    @Default('') @JsonKey(name: 'canceled_at') String canceledAt,
    @Default('') @JsonKey(name: 'failed_at') String failedAt,
    @Default('') @JsonKey(name: 'last_location_update') String lastLocationUpdate,
    @Default('0.0') @JsonKey(name: 'lat') String lat,
    @Default('0.0') @JsonKey(name: 'lng') String lng,
    @Default('') @JsonKey(name: 'house_no') String houseNo,
    @Default('') @JsonKey(name: 'street') String street,
    @Default('') @JsonKey(name: 'city') String city,
    @Default([]) @JsonKey(name: 'items') List<OrderItem> items,
  }) = _OrderData;

  factory OrderData.fromJson(Map<String, dynamic> json) =>
      _$OrderDataFromJson(json);

  @override
  // TODO: implement acceptedAt
  String? get acceptedAt => throw UnimplementedError();

  @override
  // TODO: implement canceledAt
  String get canceledAt => throw UnimplementedError();

  @override
  // TODO: implement city
  String get city => throw UnimplementedError();

  @override
  // TODO: implement createdAt
  String get createdAt => throw UnimplementedError();

  @override
  // TODO: implement customerId
  int get customerId => throw UnimplementedError();

  @override
  // TODO: implement deliveredAt
  String? get deliveredAt => throw UnimplementedError();

  @override
  // TODO: implement deliveryAcceptedAt
  String get deliveryAcceptedAt => throw UnimplementedError();

  @override
  // TODO: implement deliveryBoyId
  int? get deliveryBoyId => throw UnimplementedError();

  @override
  // TODO: implement discountAmount
  String get discountAmount => throw UnimplementedError();

  @override
  // TODO: implement failedAt
  String get failedAt => throw UnimplementedError();

  @override
  // TODO: implement finalAmount
  String get finalAmount => throw UnimplementedError();

  @override
  // TODO: implement houseNo
  String get houseNo => throw UnimplementedError();

  @override
  // TODO: implement id
  int get id => throw UnimplementedError();

  @override
  // TODO: implement items
  List<OrderItem> get items => throw UnimplementedError();

  @override
  // TODO: implement lastLocationUpdate
  String get lastLocationUpdate => throw UnimplementedError();

  @override
  // TODO: implement lat
  String get lat => throw UnimplementedError();

  @override
  // TODO: implement lng
  String get lng => throw UnimplementedError();

  @override
  // TODO: implement orderNumber
  String get orderNumber => throw UnimplementedError();

  @override
  // TODO: implement paymentMethod
  String get paymentMethod => throw UnimplementedError();

  @override
  // TODO: implement paymentStatus
  String get paymentStatus => throw UnimplementedError();

  @override
  // TODO: implement pickedUpAt
  String get pickedUpAt => throw UnimplementedError();

  @override
  // TODO: implement preparingAt
  String get preparingAt => throw UnimplementedError();

  @override
  // TODO: implement readyAt
  String get readyAt => throw UnimplementedError();

  @override
  // TODO: implement restaurantId
  int get restaurantId => throw UnimplementedError();

  @override
  // TODO: implement specialInstructions
  String get specialInstructions => throw UnimplementedError();

  @override
  // TODO: implement status
  String get status => throw UnimplementedError();

  @override
  // TODO: implement street
  String get street => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement totalAmount
  String get totalAmount => throw UnimplementedError();

  @override
  // TODO: implement trackingStatus
  String get trackingStatus => throw UnimplementedError();

  @override
  // TODO: implement updatedAt
  String get updatedAt => throw UnimplementedError();

}

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    @Default(0) @JsonKey(name: 'id') int id,
    @Default(0) @JsonKey(name: 'order_id') int orderId,
    @Default(0) @JsonKey(name: 'item_id') int itemId,
    @Default('') @JsonKey(name: 'item_name') String itemName,
    @Default(0) @JsonKey(name: 'quantity') int quantity,
    @Default('0.00') @JsonKey(name: 'price') String price,
    @Default('0.00') @JsonKey(name: 'discount_amount') String discountAmount,
    @Default('0.00') @JsonKey(name: 'final_price') String finalPrice,
    @Default('0.00') @JsonKey(name: 'total_price') String totalPrice,
    @Default('') @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'variation_id') int? variationId,
    @Default('') @JsonKey(name: 'variation_name') String variationName,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  @override
  // TODO: implement createdAt
  String get createdAt => throw UnimplementedError();

  @override
  // TODO: implement discountAmount
  String get discountAmount => throw UnimplementedError();

  @override
  // TODO: implement finalPrice
  String get finalPrice => throw UnimplementedError();

  @override
  // TODO: implement id
  int get id => throw UnimplementedError();

  @override
  // TODO: implement itemId
  int get itemId => throw UnimplementedError();

  @override
  // TODO: implement itemName
  String get itemName => throw UnimplementedError();

  @override
  // TODO: implement orderId
  int get orderId => throw UnimplementedError();

  @override
  // TODO: implement price
  String get price => throw UnimplementedError();

  @override
  // TODO: implement quantity
  int get quantity => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement totalPrice
  String get totalPrice => throw UnimplementedError();

  @override
  // TODO: implement variationId
  int? get variationId => throw UnimplementedError();

  @override
  // TODO: implement variationName
  String get variationName => throw UnimplementedError();

}
