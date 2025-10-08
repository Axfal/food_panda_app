// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderModel {

@JsonKey(name: 'success') bool get success;@JsonKey(name: 'orders') List<OrderData> get orders;@JsonKey(name: 'limit') int get limit;@JsonKey(name: 'offset') int get offset;
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderModelCopyWith<OrderModel> get copyWith => _$OrderModelCopyWithImpl<OrderModel>(this as OrderModel, _$identity);

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderModel&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other.orders, orders)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(orders),limit,offset);

@override
String toString() {
  return 'OrderModel(success: $success, orders: $orders, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class $OrderModelCopyWith<$Res>  {
  factory $OrderModelCopyWith(OrderModel value, $Res Function(OrderModel) _then) = _$OrderModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'success') bool success,@JsonKey(name: 'orders') List<OrderData> orders,@JsonKey(name: 'limit') int limit,@JsonKey(name: 'offset') int offset
});




}
/// @nodoc
class _$OrderModelCopyWithImpl<$Res>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._self, this._then);

  final OrderModel _self;
  final $Res Function(OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? orders = null,Object? limit = null,Object? offset = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderData>,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderModel].
extension OrderModelPatterns on OrderModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool success, @JsonKey(name: 'orders')  List<OrderData> orders, @JsonKey(name: 'limit')  int limit, @JsonKey(name: 'offset')  int offset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.success,_that.orders,_that.limit,_that.offset);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool success, @JsonKey(name: 'orders')  List<OrderData> orders, @JsonKey(name: 'limit')  int limit, @JsonKey(name: 'offset')  int offset)  $default,) {final _that = this;
switch (_that) {
case _OrderModel():
return $default(_that.success,_that.orders,_that.limit,_that.offset);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'success')  bool success, @JsonKey(name: 'orders')  List<OrderData> orders, @JsonKey(name: 'limit')  int limit, @JsonKey(name: 'offset')  int offset)?  $default,) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.success,_that.orders,_that.limit,_that.offset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderModel implements OrderModel {
  const _OrderModel({@JsonKey(name: 'success') this.success = false, @JsonKey(name: 'orders') final  List<OrderData> orders = const [], @JsonKey(name: 'limit') this.limit = 0, @JsonKey(name: 'offset') this.offset = 0}): _orders = orders;
  factory _OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

@override@JsonKey(name: 'success') final  bool success;
 final  List<OrderData> _orders;
@override@JsonKey(name: 'orders') List<OrderData> get orders {
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orders);
}

@override@JsonKey(name: 'limit') final  int limit;
@override@JsonKey(name: 'offset') final  int offset;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderModelCopyWith<_OrderModel> get copyWith => __$OrderModelCopyWithImpl<_OrderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderModel&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other._orders, _orders)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(_orders),limit,offset);

@override
String toString() {
  return 'OrderModel(success: $success, orders: $orders, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class _$OrderModelCopyWith<$Res> implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(_OrderModel value, $Res Function(_OrderModel) _then) = __$OrderModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'success') bool success,@JsonKey(name: 'orders') List<OrderData> orders,@JsonKey(name: 'limit') int limit,@JsonKey(name: 'offset') int offset
});




}
/// @nodoc
class __$OrderModelCopyWithImpl<$Res>
    implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(this._self, this._then);

  final _OrderModel _self;
  final $Res Function(_OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? orders = null,Object? limit = null,Object? offset = null,}) {
  return _then(_OrderModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,orders: null == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderData>,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$OrderData {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'order_number') String get orderNumber;@JsonKey(name: 'customer_id') int get customerId;@JsonKey(name: 'restaurant_id') int get restaurantId;@JsonKey(name: 'delivery_boy_id') int? get deliveryBoyId;@JsonKey(name: 'status') String get status;@JsonKey(name: 'tracking_status') String get trackingStatus;@JsonKey(name: 'total_amount') String get totalAmount;@JsonKey(name: 'discount_amount') String get discountAmount;@JsonKey(name: 'final_amount') String get finalAmount;@JsonKey(name: 'payment_method') String get paymentMethod;@JsonKey(name: 'payment_status') String get paymentStatus;@JsonKey(name: 'special_instructions') String get specialInstructions;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;@JsonKey(name: 'accepted_at') String? get acceptedAt;@JsonKey(name: 'ready_at') String get readyAt;@JsonKey(name: 'preparing_at') String get preparingAt;@JsonKey(name: 'delivery_accepted_at') String get deliveryAcceptedAt;@JsonKey(name: 'picked_up_at') String get pickedUpAt;@JsonKey(name: 'delivered_at') String? get deliveredAt;@JsonKey(name: 'canceled_at') String get canceledAt;@JsonKey(name: 'failed_at') String get failedAt;@JsonKey(name: 'last_location_update') String get lastLocationUpdate;@JsonKey(name: 'lat') String get lat;@JsonKey(name: 'lng') String get lng;@JsonKey(name: 'house_no') String get houseNo;@JsonKey(name: 'street') String get street;@JsonKey(name: 'city') String get city;@JsonKey(name: 'items') List<OrderItem> get items;
/// Create a copy of OrderData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDataCopyWith<OrderData> get copyWith => _$OrderDataCopyWithImpl<OrderData>(this as OrderData, _$identity);

  /// Serializes this OrderData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderData&&(identical(other.id, id) || other.id == id)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.deliveryBoyId, deliveryBoyId) || other.deliveryBoyId == deliveryBoyId)&&(identical(other.status, status) || other.status == status)&&(identical(other.trackingStatus, trackingStatus) || other.trackingStatus == trackingStatus)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.finalAmount, finalAmount) || other.finalAmount == finalAmount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.acceptedAt, acceptedAt) || other.acceptedAt == acceptedAt)&&(identical(other.readyAt, readyAt) || other.readyAt == readyAt)&&(identical(other.preparingAt, preparingAt) || other.preparingAt == preparingAt)&&(identical(other.deliveryAcceptedAt, deliveryAcceptedAt) || other.deliveryAcceptedAt == deliveryAcceptedAt)&&(identical(other.pickedUpAt, pickedUpAt) || other.pickedUpAt == pickedUpAt)&&(identical(other.deliveredAt, deliveredAt) || other.deliveredAt == deliveredAt)&&(identical(other.canceledAt, canceledAt) || other.canceledAt == canceledAt)&&(identical(other.failedAt, failedAt) || other.failedAt == failedAt)&&(identical(other.lastLocationUpdate, lastLocationUpdate) || other.lastLocationUpdate == lastLocationUpdate)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.houseNo, houseNo) || other.houseNo == houseNo)&&(identical(other.street, street) || other.street == street)&&(identical(other.city, city) || other.city == city)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,orderNumber,customerId,restaurantId,deliveryBoyId,status,trackingStatus,totalAmount,discountAmount,finalAmount,paymentMethod,paymentStatus,specialInstructions,createdAt,updatedAt,acceptedAt,readyAt,preparingAt,deliveryAcceptedAt,pickedUpAt,deliveredAt,canceledAt,failedAt,lastLocationUpdate,lat,lng,houseNo,street,city,const DeepCollectionEquality().hash(items)]);

@override
String toString() {
  return 'OrderData(id: $id, orderNumber: $orderNumber, customerId: $customerId, restaurantId: $restaurantId, deliveryBoyId: $deliveryBoyId, status: $status, trackingStatus: $trackingStatus, totalAmount: $totalAmount, discountAmount: $discountAmount, finalAmount: $finalAmount, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, specialInstructions: $specialInstructions, createdAt: $createdAt, updatedAt: $updatedAt, acceptedAt: $acceptedAt, readyAt: $readyAt, preparingAt: $preparingAt, deliveryAcceptedAt: $deliveryAcceptedAt, pickedUpAt: $pickedUpAt, deliveredAt: $deliveredAt, canceledAt: $canceledAt, failedAt: $failedAt, lastLocationUpdate: $lastLocationUpdate, lat: $lat, lng: $lng, houseNo: $houseNo, street: $street, city: $city, items: $items)';
}


}

/// @nodoc
abstract mixin class $OrderDataCopyWith<$Res>  {
  factory $OrderDataCopyWith(OrderData value, $Res Function(OrderData) _then) = _$OrderDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'order_number') String orderNumber,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'restaurant_id') int restaurantId,@JsonKey(name: 'delivery_boy_id') int? deliveryBoyId,@JsonKey(name: 'status') String status,@JsonKey(name: 'tracking_status') String trackingStatus,@JsonKey(name: 'total_amount') String totalAmount,@JsonKey(name: 'discount_amount') String discountAmount,@JsonKey(name: 'final_amount') String finalAmount,@JsonKey(name: 'payment_method') String paymentMethod,@JsonKey(name: 'payment_status') String paymentStatus,@JsonKey(name: 'special_instructions') String specialInstructions,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'accepted_at') String? acceptedAt,@JsonKey(name: 'ready_at') String readyAt,@JsonKey(name: 'preparing_at') String preparingAt,@JsonKey(name: 'delivery_accepted_at') String deliveryAcceptedAt,@JsonKey(name: 'picked_up_at') String pickedUpAt,@JsonKey(name: 'delivered_at') String? deliveredAt,@JsonKey(name: 'canceled_at') String canceledAt,@JsonKey(name: 'failed_at') String failedAt,@JsonKey(name: 'last_location_update') String lastLocationUpdate,@JsonKey(name: 'lat') String lat,@JsonKey(name: 'lng') String lng,@JsonKey(name: 'house_no') String houseNo,@JsonKey(name: 'street') String street,@JsonKey(name: 'city') String city,@JsonKey(name: 'items') List<OrderItem> items
});




}
/// @nodoc
class _$OrderDataCopyWithImpl<$Res>
    implements $OrderDataCopyWith<$Res> {
  _$OrderDataCopyWithImpl(this._self, this._then);

  final OrderData _self;
  final $Res Function(OrderData) _then;

/// Create a copy of OrderData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderNumber = null,Object? customerId = null,Object? restaurantId = null,Object? deliveryBoyId = freezed,Object? status = null,Object? trackingStatus = null,Object? totalAmount = null,Object? discountAmount = null,Object? finalAmount = null,Object? paymentMethod = null,Object? paymentStatus = null,Object? specialInstructions = null,Object? createdAt = null,Object? updatedAt = null,Object? acceptedAt = freezed,Object? readyAt = null,Object? preparingAt = null,Object? deliveryAcceptedAt = null,Object? pickedUpAt = null,Object? deliveredAt = freezed,Object? canceledAt = null,Object? failedAt = null,Object? lastLocationUpdate = null,Object? lat = null,Object? lng = null,Object? houseNo = null,Object? street = null,Object? city = null,Object? items = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as int,deliveryBoyId: freezed == deliveryBoyId ? _self.deliveryBoyId : deliveryBoyId // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,trackingStatus: null == trackingStatus ? _self.trackingStatus : trackingStatus // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as String,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as String,finalAmount: null == finalAmount ? _self.finalAmount : finalAmount // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,specialInstructions: null == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,acceptedAt: freezed == acceptedAt ? _self.acceptedAt : acceptedAt // ignore: cast_nullable_to_non_nullable
as String?,readyAt: null == readyAt ? _self.readyAt : readyAt // ignore: cast_nullable_to_non_nullable
as String,preparingAt: null == preparingAt ? _self.preparingAt : preparingAt // ignore: cast_nullable_to_non_nullable
as String,deliveryAcceptedAt: null == deliveryAcceptedAt ? _self.deliveryAcceptedAt : deliveryAcceptedAt // ignore: cast_nullable_to_non_nullable
as String,pickedUpAt: null == pickedUpAt ? _self.pickedUpAt : pickedUpAt // ignore: cast_nullable_to_non_nullable
as String,deliveredAt: freezed == deliveredAt ? _self.deliveredAt : deliveredAt // ignore: cast_nullable_to_non_nullable
as String?,canceledAt: null == canceledAt ? _self.canceledAt : canceledAt // ignore: cast_nullable_to_non_nullable
as String,failedAt: null == failedAt ? _self.failedAt : failedAt // ignore: cast_nullable_to_non_nullable
as String,lastLocationUpdate: null == lastLocationUpdate ? _self.lastLocationUpdate : lastLocationUpdate // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as String,houseNo: null == houseNo ? _self.houseNo : houseNo // ignore: cast_nullable_to_non_nullable
as String,street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderData].
extension OrderDataPatterns on OrderData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderData value)  $default,){
final _that = this;
switch (_that) {
case _OrderData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderData value)?  $default,){
final _that = this;
switch (_that) {
case _OrderData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'order_number')  String orderNumber, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'restaurant_id')  int restaurantId, @JsonKey(name: 'delivery_boy_id')  int? deliveryBoyId, @JsonKey(name: 'status')  String status, @JsonKey(name: 'tracking_status')  String trackingStatus, @JsonKey(name: 'total_amount')  String totalAmount, @JsonKey(name: 'discount_amount')  String discountAmount, @JsonKey(name: 'final_amount')  String finalAmount, @JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'payment_status')  String paymentStatus, @JsonKey(name: 'special_instructions')  String specialInstructions, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'accepted_at')  String? acceptedAt, @JsonKey(name: 'ready_at')  String readyAt, @JsonKey(name: 'preparing_at')  String preparingAt, @JsonKey(name: 'delivery_accepted_at')  String deliveryAcceptedAt, @JsonKey(name: 'picked_up_at')  String pickedUpAt, @JsonKey(name: 'delivered_at')  String? deliveredAt, @JsonKey(name: 'canceled_at')  String canceledAt, @JsonKey(name: 'failed_at')  String failedAt, @JsonKey(name: 'last_location_update')  String lastLocationUpdate, @JsonKey(name: 'lat')  String lat, @JsonKey(name: 'lng')  String lng, @JsonKey(name: 'house_no')  String houseNo, @JsonKey(name: 'street')  String street, @JsonKey(name: 'city')  String city, @JsonKey(name: 'items')  List<OrderItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderData() when $default != null:
return $default(_that.id,_that.orderNumber,_that.customerId,_that.restaurantId,_that.deliveryBoyId,_that.status,_that.trackingStatus,_that.totalAmount,_that.discountAmount,_that.finalAmount,_that.paymentMethod,_that.paymentStatus,_that.specialInstructions,_that.createdAt,_that.updatedAt,_that.acceptedAt,_that.readyAt,_that.preparingAt,_that.deliveryAcceptedAt,_that.pickedUpAt,_that.deliveredAt,_that.canceledAt,_that.failedAt,_that.lastLocationUpdate,_that.lat,_that.lng,_that.houseNo,_that.street,_that.city,_that.items);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'order_number')  String orderNumber, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'restaurant_id')  int restaurantId, @JsonKey(name: 'delivery_boy_id')  int? deliveryBoyId, @JsonKey(name: 'status')  String status, @JsonKey(name: 'tracking_status')  String trackingStatus, @JsonKey(name: 'total_amount')  String totalAmount, @JsonKey(name: 'discount_amount')  String discountAmount, @JsonKey(name: 'final_amount')  String finalAmount, @JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'payment_status')  String paymentStatus, @JsonKey(name: 'special_instructions')  String specialInstructions, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'accepted_at')  String? acceptedAt, @JsonKey(name: 'ready_at')  String readyAt, @JsonKey(name: 'preparing_at')  String preparingAt, @JsonKey(name: 'delivery_accepted_at')  String deliveryAcceptedAt, @JsonKey(name: 'picked_up_at')  String pickedUpAt, @JsonKey(name: 'delivered_at')  String? deliveredAt, @JsonKey(name: 'canceled_at')  String canceledAt, @JsonKey(name: 'failed_at')  String failedAt, @JsonKey(name: 'last_location_update')  String lastLocationUpdate, @JsonKey(name: 'lat')  String lat, @JsonKey(name: 'lng')  String lng, @JsonKey(name: 'house_no')  String houseNo, @JsonKey(name: 'street')  String street, @JsonKey(name: 'city')  String city, @JsonKey(name: 'items')  List<OrderItem> items)  $default,) {final _that = this;
switch (_that) {
case _OrderData():
return $default(_that.id,_that.orderNumber,_that.customerId,_that.restaurantId,_that.deliveryBoyId,_that.status,_that.trackingStatus,_that.totalAmount,_that.discountAmount,_that.finalAmount,_that.paymentMethod,_that.paymentStatus,_that.specialInstructions,_that.createdAt,_that.updatedAt,_that.acceptedAt,_that.readyAt,_that.preparingAt,_that.deliveryAcceptedAt,_that.pickedUpAt,_that.deliveredAt,_that.canceledAt,_that.failedAt,_that.lastLocationUpdate,_that.lat,_that.lng,_that.houseNo,_that.street,_that.city,_that.items);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'order_number')  String orderNumber, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'restaurant_id')  int restaurantId, @JsonKey(name: 'delivery_boy_id')  int? deliveryBoyId, @JsonKey(name: 'status')  String status, @JsonKey(name: 'tracking_status')  String trackingStatus, @JsonKey(name: 'total_amount')  String totalAmount, @JsonKey(name: 'discount_amount')  String discountAmount, @JsonKey(name: 'final_amount')  String finalAmount, @JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'payment_status')  String paymentStatus, @JsonKey(name: 'special_instructions')  String specialInstructions, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'accepted_at')  String? acceptedAt, @JsonKey(name: 'ready_at')  String readyAt, @JsonKey(name: 'preparing_at')  String preparingAt, @JsonKey(name: 'delivery_accepted_at')  String deliveryAcceptedAt, @JsonKey(name: 'picked_up_at')  String pickedUpAt, @JsonKey(name: 'delivered_at')  String? deliveredAt, @JsonKey(name: 'canceled_at')  String canceledAt, @JsonKey(name: 'failed_at')  String failedAt, @JsonKey(name: 'last_location_update')  String lastLocationUpdate, @JsonKey(name: 'lat')  String lat, @JsonKey(name: 'lng')  String lng, @JsonKey(name: 'house_no')  String houseNo, @JsonKey(name: 'street')  String street, @JsonKey(name: 'city')  String city, @JsonKey(name: 'items')  List<OrderItem> items)?  $default,) {final _that = this;
switch (_that) {
case _OrderData() when $default != null:
return $default(_that.id,_that.orderNumber,_that.customerId,_that.restaurantId,_that.deliveryBoyId,_that.status,_that.trackingStatus,_that.totalAmount,_that.discountAmount,_that.finalAmount,_that.paymentMethod,_that.paymentStatus,_that.specialInstructions,_that.createdAt,_that.updatedAt,_that.acceptedAt,_that.readyAt,_that.preparingAt,_that.deliveryAcceptedAt,_that.pickedUpAt,_that.deliveredAt,_that.canceledAt,_that.failedAt,_that.lastLocationUpdate,_that.lat,_that.lng,_that.houseNo,_that.street,_that.city,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderData implements OrderData {
  const _OrderData({@JsonKey(name: 'id') this.id = 0, @JsonKey(name: 'order_number') this.orderNumber = '', @JsonKey(name: 'customer_id') this.customerId = 0, @JsonKey(name: 'restaurant_id') this.restaurantId = 0, @JsonKey(name: 'delivery_boy_id') this.deliveryBoyId, @JsonKey(name: 'status') this.status = '', @JsonKey(name: 'tracking_status') this.trackingStatus = '', @JsonKey(name: 'total_amount') this.totalAmount = '0.00', @JsonKey(name: 'discount_amount') this.discountAmount = '0.00', @JsonKey(name: 'final_amount') this.finalAmount = '0.00', @JsonKey(name: 'payment_method') this.paymentMethod = '', @JsonKey(name: 'payment_status') this.paymentStatus = '', @JsonKey(name: 'special_instructions') this.specialInstructions = '', @JsonKey(name: 'created_at') this.createdAt = '', @JsonKey(name: 'updated_at') this.updatedAt = '', @JsonKey(name: 'accepted_at') this.acceptedAt, @JsonKey(name: 'ready_at') this.readyAt = '', @JsonKey(name: 'preparing_at') this.preparingAt = '', @JsonKey(name: 'delivery_accepted_at') this.deliveryAcceptedAt = '', @JsonKey(name: 'picked_up_at') this.pickedUpAt = '', @JsonKey(name: 'delivered_at') this.deliveredAt, @JsonKey(name: 'canceled_at') this.canceledAt = '', @JsonKey(name: 'failed_at') this.failedAt = '', @JsonKey(name: 'last_location_update') this.lastLocationUpdate = '', @JsonKey(name: 'lat') this.lat = '0.0', @JsonKey(name: 'lng') this.lng = '0.0', @JsonKey(name: 'house_no') this.houseNo = '', @JsonKey(name: 'street') this.street = '', @JsonKey(name: 'city') this.city = '', @JsonKey(name: 'items') final  List<OrderItem> items = const []}): _items = items;
  factory _OrderData.fromJson(Map<String, dynamic> json) => _$OrderDataFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'order_number') final  String orderNumber;
@override@JsonKey(name: 'customer_id') final  int customerId;
@override@JsonKey(name: 'restaurant_id') final  int restaurantId;
@override@JsonKey(name: 'delivery_boy_id') final  int? deliveryBoyId;
@override@JsonKey(name: 'status') final  String status;
@override@JsonKey(name: 'tracking_status') final  String trackingStatus;
@override@JsonKey(name: 'total_amount') final  String totalAmount;
@override@JsonKey(name: 'discount_amount') final  String discountAmount;
@override@JsonKey(name: 'final_amount') final  String finalAmount;
@override@JsonKey(name: 'payment_method') final  String paymentMethod;
@override@JsonKey(name: 'payment_status') final  String paymentStatus;
@override@JsonKey(name: 'special_instructions') final  String specialInstructions;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;
@override@JsonKey(name: 'accepted_at') final  String? acceptedAt;
@override@JsonKey(name: 'ready_at') final  String readyAt;
@override@JsonKey(name: 'preparing_at') final  String preparingAt;
@override@JsonKey(name: 'delivery_accepted_at') final  String deliveryAcceptedAt;
@override@JsonKey(name: 'picked_up_at') final  String pickedUpAt;
@override@JsonKey(name: 'delivered_at') final  String? deliveredAt;
@override@JsonKey(name: 'canceled_at') final  String canceledAt;
@override@JsonKey(name: 'failed_at') final  String failedAt;
@override@JsonKey(name: 'last_location_update') final  String lastLocationUpdate;
@override@JsonKey(name: 'lat') final  String lat;
@override@JsonKey(name: 'lng') final  String lng;
@override@JsonKey(name: 'house_no') final  String houseNo;
@override@JsonKey(name: 'street') final  String street;
@override@JsonKey(name: 'city') final  String city;
 final  List<OrderItem> _items;
@override@JsonKey(name: 'items') List<OrderItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of OrderData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDataCopyWith<_OrderData> get copyWith => __$OrderDataCopyWithImpl<_OrderData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderData&&(identical(other.id, id) || other.id == id)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.deliveryBoyId, deliveryBoyId) || other.deliveryBoyId == deliveryBoyId)&&(identical(other.status, status) || other.status == status)&&(identical(other.trackingStatus, trackingStatus) || other.trackingStatus == trackingStatus)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.finalAmount, finalAmount) || other.finalAmount == finalAmount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.acceptedAt, acceptedAt) || other.acceptedAt == acceptedAt)&&(identical(other.readyAt, readyAt) || other.readyAt == readyAt)&&(identical(other.preparingAt, preparingAt) || other.preparingAt == preparingAt)&&(identical(other.deliveryAcceptedAt, deliveryAcceptedAt) || other.deliveryAcceptedAt == deliveryAcceptedAt)&&(identical(other.pickedUpAt, pickedUpAt) || other.pickedUpAt == pickedUpAt)&&(identical(other.deliveredAt, deliveredAt) || other.deliveredAt == deliveredAt)&&(identical(other.canceledAt, canceledAt) || other.canceledAt == canceledAt)&&(identical(other.failedAt, failedAt) || other.failedAt == failedAt)&&(identical(other.lastLocationUpdate, lastLocationUpdate) || other.lastLocationUpdate == lastLocationUpdate)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.houseNo, houseNo) || other.houseNo == houseNo)&&(identical(other.street, street) || other.street == street)&&(identical(other.city, city) || other.city == city)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,orderNumber,customerId,restaurantId,deliveryBoyId,status,trackingStatus,totalAmount,discountAmount,finalAmount,paymentMethod,paymentStatus,specialInstructions,createdAt,updatedAt,acceptedAt,readyAt,preparingAt,deliveryAcceptedAt,pickedUpAt,deliveredAt,canceledAt,failedAt,lastLocationUpdate,lat,lng,houseNo,street,city,const DeepCollectionEquality().hash(_items)]);

@override
String toString() {
  return 'OrderData(id: $id, orderNumber: $orderNumber, customerId: $customerId, restaurantId: $restaurantId, deliveryBoyId: $deliveryBoyId, status: $status, trackingStatus: $trackingStatus, totalAmount: $totalAmount, discountAmount: $discountAmount, finalAmount: $finalAmount, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, specialInstructions: $specialInstructions, createdAt: $createdAt, updatedAt: $updatedAt, acceptedAt: $acceptedAt, readyAt: $readyAt, preparingAt: $preparingAt, deliveryAcceptedAt: $deliveryAcceptedAt, pickedUpAt: $pickedUpAt, deliveredAt: $deliveredAt, canceledAt: $canceledAt, failedAt: $failedAt, lastLocationUpdate: $lastLocationUpdate, lat: $lat, lng: $lng, houseNo: $houseNo, street: $street, city: $city, items: $items)';
}


}

/// @nodoc
abstract mixin class _$OrderDataCopyWith<$Res> implements $OrderDataCopyWith<$Res> {
  factory _$OrderDataCopyWith(_OrderData value, $Res Function(_OrderData) _then) = __$OrderDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'order_number') String orderNumber,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'restaurant_id') int restaurantId,@JsonKey(name: 'delivery_boy_id') int? deliveryBoyId,@JsonKey(name: 'status') String status,@JsonKey(name: 'tracking_status') String trackingStatus,@JsonKey(name: 'total_amount') String totalAmount,@JsonKey(name: 'discount_amount') String discountAmount,@JsonKey(name: 'final_amount') String finalAmount,@JsonKey(name: 'payment_method') String paymentMethod,@JsonKey(name: 'payment_status') String paymentStatus,@JsonKey(name: 'special_instructions') String specialInstructions,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'accepted_at') String? acceptedAt,@JsonKey(name: 'ready_at') String readyAt,@JsonKey(name: 'preparing_at') String preparingAt,@JsonKey(name: 'delivery_accepted_at') String deliveryAcceptedAt,@JsonKey(name: 'picked_up_at') String pickedUpAt,@JsonKey(name: 'delivered_at') String? deliveredAt,@JsonKey(name: 'canceled_at') String canceledAt,@JsonKey(name: 'failed_at') String failedAt,@JsonKey(name: 'last_location_update') String lastLocationUpdate,@JsonKey(name: 'lat') String lat,@JsonKey(name: 'lng') String lng,@JsonKey(name: 'house_no') String houseNo,@JsonKey(name: 'street') String street,@JsonKey(name: 'city') String city,@JsonKey(name: 'items') List<OrderItem> items
});




}
/// @nodoc
class __$OrderDataCopyWithImpl<$Res>
    implements _$OrderDataCopyWith<$Res> {
  __$OrderDataCopyWithImpl(this._self, this._then);

  final _OrderData _self;
  final $Res Function(_OrderData) _then;

/// Create a copy of OrderData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderNumber = null,Object? customerId = null,Object? restaurantId = null,Object? deliveryBoyId = freezed,Object? status = null,Object? trackingStatus = null,Object? totalAmount = null,Object? discountAmount = null,Object? finalAmount = null,Object? paymentMethod = null,Object? paymentStatus = null,Object? specialInstructions = null,Object? createdAt = null,Object? updatedAt = null,Object? acceptedAt = freezed,Object? readyAt = null,Object? preparingAt = null,Object? deliveryAcceptedAt = null,Object? pickedUpAt = null,Object? deliveredAt = freezed,Object? canceledAt = null,Object? failedAt = null,Object? lastLocationUpdate = null,Object? lat = null,Object? lng = null,Object? houseNo = null,Object? street = null,Object? city = null,Object? items = null,}) {
  return _then(_OrderData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as int,deliveryBoyId: freezed == deliveryBoyId ? _self.deliveryBoyId : deliveryBoyId // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,trackingStatus: null == trackingStatus ? _self.trackingStatus : trackingStatus // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as String,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as String,finalAmount: null == finalAmount ? _self.finalAmount : finalAmount // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,specialInstructions: null == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,acceptedAt: freezed == acceptedAt ? _self.acceptedAt : acceptedAt // ignore: cast_nullable_to_non_nullable
as String?,readyAt: null == readyAt ? _self.readyAt : readyAt // ignore: cast_nullable_to_non_nullable
as String,preparingAt: null == preparingAt ? _self.preparingAt : preparingAt // ignore: cast_nullable_to_non_nullable
as String,deliveryAcceptedAt: null == deliveryAcceptedAt ? _self.deliveryAcceptedAt : deliveryAcceptedAt // ignore: cast_nullable_to_non_nullable
as String,pickedUpAt: null == pickedUpAt ? _self.pickedUpAt : pickedUpAt // ignore: cast_nullable_to_non_nullable
as String,deliveredAt: freezed == deliveredAt ? _self.deliveredAt : deliveredAt // ignore: cast_nullable_to_non_nullable
as String?,canceledAt: null == canceledAt ? _self.canceledAt : canceledAt // ignore: cast_nullable_to_non_nullable
as String,failedAt: null == failedAt ? _self.failedAt : failedAt // ignore: cast_nullable_to_non_nullable
as String,lastLocationUpdate: null == lastLocationUpdate ? _self.lastLocationUpdate : lastLocationUpdate // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as String,houseNo: null == houseNo ? _self.houseNo : houseNo // ignore: cast_nullable_to_non_nullable
as String,street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,
  ));
}


}


/// @nodoc
mixin _$OrderItem {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'order_id') int get orderId;@JsonKey(name: 'item_id') int get itemId;@JsonKey(name: 'item_name') String get itemName;@JsonKey(name: 'quantity') int get quantity;@JsonKey(name: 'price') String get price;@JsonKey(name: 'discount_amount') String get discountAmount;@JsonKey(name: 'final_price') String get finalPrice;@JsonKey(name: 'total_price') String get totalPrice;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'variation_id') int? get variationId;@JsonKey(name: 'variation_name') String get variationName;
/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemCopyWith<OrderItem> get copyWith => _$OrderItemCopyWithImpl<OrderItem>(this as OrderItem, _$identity);

  /// Serializes this OrderItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.finalPrice, finalPrice) || other.finalPrice == finalPrice)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.variationId, variationId) || other.variationId == variationId)&&(identical(other.variationName, variationName) || other.variationName == variationName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,itemId,itemName,quantity,price,discountAmount,finalPrice,totalPrice,createdAt,variationId,variationName);

@override
String toString() {
  return 'OrderItem(id: $id, orderId: $orderId, itemId: $itemId, itemName: $itemName, quantity: $quantity, price: $price, discountAmount: $discountAmount, finalPrice: $finalPrice, totalPrice: $totalPrice, createdAt: $createdAt, variationId: $variationId, variationName: $variationName)';
}


}

/// @nodoc
abstract mixin class $OrderItemCopyWith<$Res>  {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) _then) = _$OrderItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'order_id') int orderId,@JsonKey(name: 'item_id') int itemId,@JsonKey(name: 'item_name') String itemName,@JsonKey(name: 'quantity') int quantity,@JsonKey(name: 'price') String price,@JsonKey(name: 'discount_amount') String discountAmount,@JsonKey(name: 'final_price') String finalPrice,@JsonKey(name: 'total_price') String totalPrice,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'variation_id') int? variationId,@JsonKey(name: 'variation_name') String variationName
});




}
/// @nodoc
class _$OrderItemCopyWithImpl<$Res>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._self, this._then);

  final OrderItem _self;
  final $Res Function(OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderId = null,Object? itemId = null,Object? itemName = null,Object? quantity = null,Object? price = null,Object? discountAmount = null,Object? finalPrice = null,Object? totalPrice = null,Object? createdAt = null,Object? variationId = freezed,Object? variationName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as String,finalPrice: null == finalPrice ? _self.finalPrice : finalPrice // ignore: cast_nullable_to_non_nullable
as String,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,variationId: freezed == variationId ? _self.variationId : variationId // ignore: cast_nullable_to_non_nullable
as int?,variationName: null == variationName ? _self.variationName : variationName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderItem].
extension OrderItemPatterns on OrderItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItem value)  $default,){
final _that = this;
switch (_that) {
case _OrderItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItem value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'order_id')  int orderId, @JsonKey(name: 'item_id')  int itemId, @JsonKey(name: 'item_name')  String itemName, @JsonKey(name: 'quantity')  int quantity, @JsonKey(name: 'price')  String price, @JsonKey(name: 'discount_amount')  String discountAmount, @JsonKey(name: 'final_price')  String finalPrice, @JsonKey(name: 'total_price')  String totalPrice, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'variation_id')  int? variationId, @JsonKey(name: 'variation_name')  String variationName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that.id,_that.orderId,_that.itemId,_that.itemName,_that.quantity,_that.price,_that.discountAmount,_that.finalPrice,_that.totalPrice,_that.createdAt,_that.variationId,_that.variationName);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'order_id')  int orderId, @JsonKey(name: 'item_id')  int itemId, @JsonKey(name: 'item_name')  String itemName, @JsonKey(name: 'quantity')  int quantity, @JsonKey(name: 'price')  String price, @JsonKey(name: 'discount_amount')  String discountAmount, @JsonKey(name: 'final_price')  String finalPrice, @JsonKey(name: 'total_price')  String totalPrice, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'variation_id')  int? variationId, @JsonKey(name: 'variation_name')  String variationName)  $default,) {final _that = this;
switch (_that) {
case _OrderItem():
return $default(_that.id,_that.orderId,_that.itemId,_that.itemName,_that.quantity,_that.price,_that.discountAmount,_that.finalPrice,_that.totalPrice,_that.createdAt,_that.variationId,_that.variationName);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'order_id')  int orderId, @JsonKey(name: 'item_id')  int itemId, @JsonKey(name: 'item_name')  String itemName, @JsonKey(name: 'quantity')  int quantity, @JsonKey(name: 'price')  String price, @JsonKey(name: 'discount_amount')  String discountAmount, @JsonKey(name: 'final_price')  String finalPrice, @JsonKey(name: 'total_price')  String totalPrice, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'variation_id')  int? variationId, @JsonKey(name: 'variation_name')  String variationName)?  $default,) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that.id,_that.orderId,_that.itemId,_that.itemName,_that.quantity,_that.price,_that.discountAmount,_that.finalPrice,_that.totalPrice,_that.createdAt,_that.variationId,_that.variationName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderItem implements OrderItem {
  const _OrderItem({@JsonKey(name: 'id') this.id = 0, @JsonKey(name: 'order_id') this.orderId = 0, @JsonKey(name: 'item_id') this.itemId = 0, @JsonKey(name: 'item_name') this.itemName = '', @JsonKey(name: 'quantity') this.quantity = 0, @JsonKey(name: 'price') this.price = '0.00', @JsonKey(name: 'discount_amount') this.discountAmount = '0.00', @JsonKey(name: 'final_price') this.finalPrice = '0.00', @JsonKey(name: 'total_price') this.totalPrice = '0.00', @JsonKey(name: 'created_at') this.createdAt = '', @JsonKey(name: 'variation_id') this.variationId, @JsonKey(name: 'variation_name') this.variationName = ''});
  factory _OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'order_id') final  int orderId;
@override@JsonKey(name: 'item_id') final  int itemId;
@override@JsonKey(name: 'item_name') final  String itemName;
@override@JsonKey(name: 'quantity') final  int quantity;
@override@JsonKey(name: 'price') final  String price;
@override@JsonKey(name: 'discount_amount') final  String discountAmount;
@override@JsonKey(name: 'final_price') final  String finalPrice;
@override@JsonKey(name: 'total_price') final  String totalPrice;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'variation_id') final  int? variationId;
@override@JsonKey(name: 'variation_name') final  String variationName;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemCopyWith<_OrderItem> get copyWith => __$OrderItemCopyWithImpl<_OrderItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.finalPrice, finalPrice) || other.finalPrice == finalPrice)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.variationId, variationId) || other.variationId == variationId)&&(identical(other.variationName, variationName) || other.variationName == variationName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,itemId,itemName,quantity,price,discountAmount,finalPrice,totalPrice,createdAt,variationId,variationName);

@override
String toString() {
  return 'OrderItem(id: $id, orderId: $orderId, itemId: $itemId, itemName: $itemName, quantity: $quantity, price: $price, discountAmount: $discountAmount, finalPrice: $finalPrice, totalPrice: $totalPrice, createdAt: $createdAt, variationId: $variationId, variationName: $variationName)';
}


}

/// @nodoc
abstract mixin class _$OrderItemCopyWith<$Res> implements $OrderItemCopyWith<$Res> {
  factory _$OrderItemCopyWith(_OrderItem value, $Res Function(_OrderItem) _then) = __$OrderItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'order_id') int orderId,@JsonKey(name: 'item_id') int itemId,@JsonKey(name: 'item_name') String itemName,@JsonKey(name: 'quantity') int quantity,@JsonKey(name: 'price') String price,@JsonKey(name: 'discount_amount') String discountAmount,@JsonKey(name: 'final_price') String finalPrice,@JsonKey(name: 'total_price') String totalPrice,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'variation_id') int? variationId,@JsonKey(name: 'variation_name') String variationName
});




}
/// @nodoc
class __$OrderItemCopyWithImpl<$Res>
    implements _$OrderItemCopyWith<$Res> {
  __$OrderItemCopyWithImpl(this._self, this._then);

  final _OrderItem _self;
  final $Res Function(_OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderId = null,Object? itemId = null,Object? itemName = null,Object? quantity = null,Object? price = null,Object? discountAmount = null,Object? finalPrice = null,Object? totalPrice = null,Object? createdAt = null,Object? variationId = freezed,Object? variationName = null,}) {
  return _then(_OrderItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as String,finalPrice: null == finalPrice ? _self.finalPrice : finalPrice // ignore: cast_nullable_to_non_nullable
as String,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,variationId: freezed == variationId ? _self.variationId : variationId // ignore: cast_nullable_to_non_nullable
as int?,variationName: null == variationName ? _self.variationName : variationName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
