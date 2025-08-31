// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wish_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WishListModel {

@JsonKey(name: 'success') bool get success;@JsonKey(name: 'count') int get count;@JsonKey(name: 'restaurants') List<Restaurant> get restaurants;
/// Create a copy of WishListModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WishListModelCopyWith<WishListModel> get copyWith => _$WishListModelCopyWithImpl<WishListModel>(this as WishListModel, _$identity);

  /// Serializes this WishListModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WishListModel&&(identical(other.success, success) || other.success == success)&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other.restaurants, restaurants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,count,const DeepCollectionEquality().hash(restaurants));

@override
String toString() {
  return 'WishListModel(success: $success, count: $count, restaurants: $restaurants)';
}


}

/// @nodoc
abstract mixin class $WishListModelCopyWith<$Res>  {
  factory $WishListModelCopyWith(WishListModel value, $Res Function(WishListModel) _then) = _$WishListModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'success') bool success,@JsonKey(name: 'count') int count,@JsonKey(name: 'restaurants') List<Restaurant> restaurants
});




}
/// @nodoc
class _$WishListModelCopyWithImpl<$Res>
    implements $WishListModelCopyWith<$Res> {
  _$WishListModelCopyWithImpl(this._self, this._then);

  final WishListModel _self;
  final $Res Function(WishListModel) _then;

/// Create a copy of WishListModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? count = null,Object? restaurants = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,restaurants: null == restaurants ? _self.restaurants : restaurants // ignore: cast_nullable_to_non_nullable
as List<Restaurant>,
  ));
}

}


/// Adds pattern-matching-related methods to [WishListModel].
extension WishListModelPatterns on WishListModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WishListModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WishListModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WishListModel value)  $default,){
final _that = this;
switch (_that) {
case _WishListModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WishListModel value)?  $default,){
final _that = this;
switch (_that) {
case _WishListModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool success, @JsonKey(name: 'count')  int count, @JsonKey(name: 'restaurants')  List<Restaurant> restaurants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WishListModel() when $default != null:
return $default(_that.success,_that.count,_that.restaurants);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool success, @JsonKey(name: 'count')  int count, @JsonKey(name: 'restaurants')  List<Restaurant> restaurants)  $default,) {final _that = this;
switch (_that) {
case _WishListModel():
return $default(_that.success,_that.count,_that.restaurants);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'success')  bool success, @JsonKey(name: 'count')  int count, @JsonKey(name: 'restaurants')  List<Restaurant> restaurants)?  $default,) {final _that = this;
switch (_that) {
case _WishListModel() when $default != null:
return $default(_that.success,_that.count,_that.restaurants);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WishListModel implements WishListModel {
  const _WishListModel({@JsonKey(name: 'success') this.success = false, @JsonKey(name: 'count') this.count = 0, @JsonKey(name: 'restaurants') final  List<Restaurant> restaurants = const []}): _restaurants = restaurants;
  factory _WishListModel.fromJson(Map<String, dynamic> json) => _$WishListModelFromJson(json);

@override@JsonKey(name: 'success') final  bool success;
@override@JsonKey(name: 'count') final  int count;
 final  List<Restaurant> _restaurants;
@override@JsonKey(name: 'restaurants') List<Restaurant> get restaurants {
  if (_restaurants is EqualUnmodifiableListView) return _restaurants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_restaurants);
}


/// Create a copy of WishListModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WishListModelCopyWith<_WishListModel> get copyWith => __$WishListModelCopyWithImpl<_WishListModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WishListModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WishListModel&&(identical(other.success, success) || other.success == success)&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other._restaurants, _restaurants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,count,const DeepCollectionEquality().hash(_restaurants));

@override
String toString() {
  return 'WishListModel(success: $success, count: $count, restaurants: $restaurants)';
}


}

/// @nodoc
abstract mixin class _$WishListModelCopyWith<$Res> implements $WishListModelCopyWith<$Res> {
  factory _$WishListModelCopyWith(_WishListModel value, $Res Function(_WishListModel) _then) = __$WishListModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'success') bool success,@JsonKey(name: 'count') int count,@JsonKey(name: 'restaurants') List<Restaurant> restaurants
});




}
/// @nodoc
class __$WishListModelCopyWithImpl<$Res>
    implements _$WishListModelCopyWith<$Res> {
  __$WishListModelCopyWithImpl(this._self, this._then);

  final _WishListModel _self;
  final $Res Function(_WishListModel) _then;

/// Create a copy of WishListModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? count = null,Object? restaurants = null,}) {
  return _then(_WishListModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,restaurants: null == restaurants ? _self._restaurants : restaurants // ignore: cast_nullable_to_non_nullable
as List<Restaurant>,
  ));
}


}


/// @nodoc
mixin _$Restaurant {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'owner_id') int get ownerId;@JsonKey(name: 'name') String get name;@JsonKey(name: 'description') String get description;@JsonKey(name: 'phone') String get phone;@JsonKey(name: 'logo') String get logo;@JsonKey(name: 'status') String get status;@JsonKey(name: 'hours') String get hours;@JsonKey(name: 'rating') String get rating;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RestaurantCopyWith<Restaurant> get copyWith => _$RestaurantCopyWithImpl<Restaurant>(this as Restaurant, _$identity);

  /// Serializes this Restaurant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Restaurant&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.status, status) || other.status == status)&&(identical(other.hours, hours) || other.hours == hours)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,name,description,phone,logo,status,hours,rating,createdAt);

@override
String toString() {
  return 'Restaurant(id: $id, ownerId: $ownerId, name: $name, description: $description, phone: $phone, logo: $logo, status: $status, hours: $hours, rating: $rating, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $RestaurantCopyWith<$Res>  {
  factory $RestaurantCopyWith(Restaurant value, $Res Function(Restaurant) _then) = _$RestaurantCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'owner_id') int ownerId,@JsonKey(name: 'name') String name,@JsonKey(name: 'description') String description,@JsonKey(name: 'phone') String phone,@JsonKey(name: 'logo') String logo,@JsonKey(name: 'status') String status,@JsonKey(name: 'hours') String hours,@JsonKey(name: 'rating') String rating,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$RestaurantCopyWithImpl<$Res>
    implements $RestaurantCopyWith<$Res> {
  _$RestaurantCopyWithImpl(this._self, this._then);

  final Restaurant _self;
  final $Res Function(Restaurant) _then;

/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ownerId = null,Object? name = null,Object? description = null,Object? phone = null,Object? logo = null,Object? status = null,Object? hours = null,Object? rating = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,hours: null == hours ? _self.hours : hours // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Restaurant].
extension RestaurantPatterns on Restaurant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Restaurant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Restaurant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Restaurant value)  $default,){
final _that = this;
switch (_that) {
case _Restaurant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Restaurant value)?  $default,){
final _that = this;
switch (_that) {
case _Restaurant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'owner_id')  int ownerId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'description')  String description, @JsonKey(name: 'phone')  String phone, @JsonKey(name: 'logo')  String logo, @JsonKey(name: 'status')  String status, @JsonKey(name: 'hours')  String hours, @JsonKey(name: 'rating')  String rating, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Restaurant() when $default != null:
return $default(_that.id,_that.ownerId,_that.name,_that.description,_that.phone,_that.logo,_that.status,_that.hours,_that.rating,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'owner_id')  int ownerId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'description')  String description, @JsonKey(name: 'phone')  String phone, @JsonKey(name: 'logo')  String logo, @JsonKey(name: 'status')  String status, @JsonKey(name: 'hours')  String hours, @JsonKey(name: 'rating')  String rating, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _Restaurant():
return $default(_that.id,_that.ownerId,_that.name,_that.description,_that.phone,_that.logo,_that.status,_that.hours,_that.rating,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'owner_id')  int ownerId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'description')  String description, @JsonKey(name: 'phone')  String phone, @JsonKey(name: 'logo')  String logo, @JsonKey(name: 'status')  String status, @JsonKey(name: 'hours')  String hours, @JsonKey(name: 'rating')  String rating, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Restaurant() when $default != null:
return $default(_that.id,_that.ownerId,_that.name,_that.description,_that.phone,_that.logo,_that.status,_that.hours,_that.rating,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Restaurant implements Restaurant {
  const _Restaurant({@JsonKey(name: 'id') this.id = 0, @JsonKey(name: 'owner_id') this.ownerId = 0, @JsonKey(name: 'name') this.name = '', @JsonKey(name: 'description') this.description = '', @JsonKey(name: 'phone') this.phone = '', @JsonKey(name: 'logo') this.logo = '', @JsonKey(name: 'status') this.status = '', @JsonKey(name: 'hours') this.hours = '', @JsonKey(name: 'rating') this.rating = '0.0', @JsonKey(name: 'created_at') this.createdAt = ''});
  factory _Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'owner_id') final  int ownerId;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'description') final  String description;
@override@JsonKey(name: 'phone') final  String phone;
@override@JsonKey(name: 'logo') final  String logo;
@override@JsonKey(name: 'status') final  String status;
@override@JsonKey(name: 'hours') final  String hours;
@override@JsonKey(name: 'rating') final  String rating;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RestaurantCopyWith<_Restaurant> get copyWith => __$RestaurantCopyWithImpl<_Restaurant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RestaurantToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Restaurant&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.status, status) || other.status == status)&&(identical(other.hours, hours) || other.hours == hours)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,name,description,phone,logo,status,hours,rating,createdAt);

@override
String toString() {
  return 'Restaurant(id: $id, ownerId: $ownerId, name: $name, description: $description, phone: $phone, logo: $logo, status: $status, hours: $hours, rating: $rating, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$RestaurantCopyWith<$Res> implements $RestaurantCopyWith<$Res> {
  factory _$RestaurantCopyWith(_Restaurant value, $Res Function(_Restaurant) _then) = __$RestaurantCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'owner_id') int ownerId,@JsonKey(name: 'name') String name,@JsonKey(name: 'description') String description,@JsonKey(name: 'phone') String phone,@JsonKey(name: 'logo') String logo,@JsonKey(name: 'status') String status,@JsonKey(name: 'hours') String hours,@JsonKey(name: 'rating') String rating,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$RestaurantCopyWithImpl<$Res>
    implements _$RestaurantCopyWith<$Res> {
  __$RestaurantCopyWithImpl(this._self, this._then);

  final _Restaurant _self;
  final $Res Function(_Restaurant) _then;

/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ownerId = null,Object? name = null,Object? description = null,Object? phone = null,Object? logo = null,Object? status = null,Object? hours = null,Object? rating = null,Object? createdAt = null,}) {
  return _then(_Restaurant(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,hours: null == hours ? _self.hours : hours // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
