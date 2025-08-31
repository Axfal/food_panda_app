// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_restaurant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewRestaurantModel {

@JsonKey(name: 'success') bool get success;@JsonKey(name: 'count') int get count;@JsonKey(name: 'limit') int get limit;@JsonKey(name: 'offset') int get offset;@JsonKey(name: 'radius') int get radius;@JsonKey(name: 'restaurants') List<Restaurant> get restaurants;
/// Create a copy of NewRestaurantModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewRestaurantModelCopyWith<NewRestaurantModel> get copyWith => _$NewRestaurantModelCopyWithImpl<NewRestaurantModel>(this as NewRestaurantModel, _$identity);

  /// Serializes this NewRestaurantModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewRestaurantModel&&(identical(other.success, success) || other.success == success)&&(identical(other.count, count) || other.count == count)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.radius, radius) || other.radius == radius)&&const DeepCollectionEquality().equals(other.restaurants, restaurants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,count,limit,offset,radius,const DeepCollectionEquality().hash(restaurants));

@override
String toString() {
  return 'NewRestaurantModel(success: $success, count: $count, limit: $limit, offset: $offset, radius: $radius, restaurants: $restaurants)';
}


}

/// @nodoc
abstract mixin class $NewRestaurantModelCopyWith<$Res>  {
  factory $NewRestaurantModelCopyWith(NewRestaurantModel value, $Res Function(NewRestaurantModel) _then) = _$NewRestaurantModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'success') bool success,@JsonKey(name: 'count') int count,@JsonKey(name: 'limit') int limit,@JsonKey(name: 'offset') int offset,@JsonKey(name: 'radius') int radius,@JsonKey(name: 'restaurants') List<Restaurant> restaurants
});




}
/// @nodoc
class _$NewRestaurantModelCopyWithImpl<$Res>
    implements $NewRestaurantModelCopyWith<$Res> {
  _$NewRestaurantModelCopyWithImpl(this._self, this._then);

  final NewRestaurantModel _self;
  final $Res Function(NewRestaurantModel) _then;

/// Create a copy of NewRestaurantModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? count = null,Object? limit = null,Object? offset = null,Object? radius = null,Object? restaurants = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,radius: null == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as int,restaurants: null == restaurants ? _self.restaurants : restaurants // ignore: cast_nullable_to_non_nullable
as List<Restaurant>,
  ));
}

}


/// Adds pattern-matching-related methods to [NewRestaurantModel].
extension NewRestaurantModelPatterns on NewRestaurantModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewRestaurantModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewRestaurantModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewRestaurantModel value)  $default,){
final _that = this;
switch (_that) {
case _NewRestaurantModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewRestaurantModel value)?  $default,){
final _that = this;
switch (_that) {
case _NewRestaurantModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool success, @JsonKey(name: 'count')  int count, @JsonKey(name: 'limit')  int limit, @JsonKey(name: 'offset')  int offset, @JsonKey(name: 'radius')  int radius, @JsonKey(name: 'restaurants')  List<Restaurant> restaurants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewRestaurantModel() when $default != null:
return $default(_that.success,_that.count,_that.limit,_that.offset,_that.radius,_that.restaurants);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool success, @JsonKey(name: 'count')  int count, @JsonKey(name: 'limit')  int limit, @JsonKey(name: 'offset')  int offset, @JsonKey(name: 'radius')  int radius, @JsonKey(name: 'restaurants')  List<Restaurant> restaurants)  $default,) {final _that = this;
switch (_that) {
case _NewRestaurantModel():
return $default(_that.success,_that.count,_that.limit,_that.offset,_that.radius,_that.restaurants);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'success')  bool success, @JsonKey(name: 'count')  int count, @JsonKey(name: 'limit')  int limit, @JsonKey(name: 'offset')  int offset, @JsonKey(name: 'radius')  int radius, @JsonKey(name: 'restaurants')  List<Restaurant> restaurants)?  $default,) {final _that = this;
switch (_that) {
case _NewRestaurantModel() when $default != null:
return $default(_that.success,_that.count,_that.limit,_that.offset,_that.radius,_that.restaurants);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NewRestaurantModel implements NewRestaurantModel {
  const _NewRestaurantModel({@JsonKey(name: 'success') this.success = false, @JsonKey(name: 'count') this.count = 0, @JsonKey(name: 'limit') this.limit = 0, @JsonKey(name: 'offset') this.offset = 0, @JsonKey(name: 'radius') this.radius = 0, @JsonKey(name: 'restaurants') final  List<Restaurant> restaurants = const []}): _restaurants = restaurants;
  factory _NewRestaurantModel.fromJson(Map<String, dynamic> json) => _$NewRestaurantModelFromJson(json);

@override@JsonKey(name: 'success') final  bool success;
@override@JsonKey(name: 'count') final  int count;
@override@JsonKey(name: 'limit') final  int limit;
@override@JsonKey(name: 'offset') final  int offset;
@override@JsonKey(name: 'radius') final  int radius;
 final  List<Restaurant> _restaurants;
@override@JsonKey(name: 'restaurants') List<Restaurant> get restaurants {
  if (_restaurants is EqualUnmodifiableListView) return _restaurants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_restaurants);
}


/// Create a copy of NewRestaurantModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewRestaurantModelCopyWith<_NewRestaurantModel> get copyWith => __$NewRestaurantModelCopyWithImpl<_NewRestaurantModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewRestaurantModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewRestaurantModel&&(identical(other.success, success) || other.success == success)&&(identical(other.count, count) || other.count == count)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.radius, radius) || other.radius == radius)&&const DeepCollectionEquality().equals(other._restaurants, _restaurants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,count,limit,offset,radius,const DeepCollectionEquality().hash(_restaurants));

@override
String toString() {
  return 'NewRestaurantModel(success: $success, count: $count, limit: $limit, offset: $offset, radius: $radius, restaurants: $restaurants)';
}


}

/// @nodoc
abstract mixin class _$NewRestaurantModelCopyWith<$Res> implements $NewRestaurantModelCopyWith<$Res> {
  factory _$NewRestaurantModelCopyWith(_NewRestaurantModel value, $Res Function(_NewRestaurantModel) _then) = __$NewRestaurantModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'success') bool success,@JsonKey(name: 'count') int count,@JsonKey(name: 'limit') int limit,@JsonKey(name: 'offset') int offset,@JsonKey(name: 'radius') int radius,@JsonKey(name: 'restaurants') List<Restaurant> restaurants
});




}
/// @nodoc
class __$NewRestaurantModelCopyWithImpl<$Res>
    implements _$NewRestaurantModelCopyWith<$Res> {
  __$NewRestaurantModelCopyWithImpl(this._self, this._then);

  final _NewRestaurantModel _self;
  final $Res Function(_NewRestaurantModel) _then;

/// Create a copy of NewRestaurantModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? count = null,Object? limit = null,Object? offset = null,Object? radius = null,Object? restaurants = null,}) {
  return _then(_NewRestaurantModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,radius: null == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as int,restaurants: null == restaurants ? _self._restaurants : restaurants // ignore: cast_nullable_to_non_nullable
as List<Restaurant>,
  ));
}


}


/// @nodoc
mixin _$Restaurant {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'owner_id') int get ownerId;@JsonKey(name: 'name') String get name;@JsonKey(name: 'description') String get description;@JsonKey(name: 'phone') String get phone;@JsonKey(name: 'logo') String? get logo;@JsonKey(name: 'status') String get status;@JsonKey(name: 'hours') String get hours;@JsonKey(name: 'rating') String get rating;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'lat') String get lat;@JsonKey(name: 'lng') String get lng;@JsonKey(name: 'distance') int get distance;@JsonKey(name: 'categories') List<dynamic> get categories;@JsonKey(name: 'location') Location get location;
/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RestaurantCopyWith<Restaurant> get copyWith => _$RestaurantCopyWithImpl<Restaurant>(this as Restaurant, _$identity);

  /// Serializes this Restaurant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Restaurant&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.status, status) || other.status == status)&&(identical(other.hours, hours) || other.hours == hours)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.distance, distance) || other.distance == distance)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,name,description,phone,logo,status,hours,rating,createdAt,lat,lng,distance,const DeepCollectionEquality().hash(categories),location);

@override
String toString() {
  return 'Restaurant(id: $id, ownerId: $ownerId, name: $name, description: $description, phone: $phone, logo: $logo, status: $status, hours: $hours, rating: $rating, createdAt: $createdAt, lat: $lat, lng: $lng, distance: $distance, categories: $categories, location: $location)';
}


}

/// @nodoc
abstract mixin class $RestaurantCopyWith<$Res>  {
  factory $RestaurantCopyWith(Restaurant value, $Res Function(Restaurant) _then) = _$RestaurantCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'owner_id') int ownerId,@JsonKey(name: 'name') String name,@JsonKey(name: 'description') String description,@JsonKey(name: 'phone') String phone,@JsonKey(name: 'logo') String? logo,@JsonKey(name: 'status') String status,@JsonKey(name: 'hours') String hours,@JsonKey(name: 'rating') String rating,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'lat') String lat,@JsonKey(name: 'lng') String lng,@JsonKey(name: 'distance') int distance,@JsonKey(name: 'categories') List<dynamic> categories,@JsonKey(name: 'location') Location location
});


$LocationCopyWith<$Res> get location;

}
/// @nodoc
class _$RestaurantCopyWithImpl<$Res>
    implements $RestaurantCopyWith<$Res> {
  _$RestaurantCopyWithImpl(this._self, this._then);

  final Restaurant _self;
  final $Res Function(Restaurant) _then;

/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ownerId = null,Object? name = null,Object? description = null,Object? phone = null,Object? logo = freezed,Object? status = null,Object? hours = null,Object? rating = null,Object? createdAt = null,Object? lat = null,Object? lng = null,Object? distance = null,Object? categories = null,Object? location = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,hours: null == hours ? _self.hours : hours // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as String,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<dynamic>,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location,
  ));
}
/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res> get location {
  
  return $LocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'owner_id')  int ownerId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'description')  String description, @JsonKey(name: 'phone')  String phone, @JsonKey(name: 'logo')  String? logo, @JsonKey(name: 'status')  String status, @JsonKey(name: 'hours')  String hours, @JsonKey(name: 'rating')  String rating, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'lat')  String lat, @JsonKey(name: 'lng')  String lng, @JsonKey(name: 'distance')  int distance, @JsonKey(name: 'categories')  List<dynamic> categories, @JsonKey(name: 'location')  Location location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Restaurant() when $default != null:
return $default(_that.id,_that.ownerId,_that.name,_that.description,_that.phone,_that.logo,_that.status,_that.hours,_that.rating,_that.createdAt,_that.lat,_that.lng,_that.distance,_that.categories,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'owner_id')  int ownerId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'description')  String description, @JsonKey(name: 'phone')  String phone, @JsonKey(name: 'logo')  String? logo, @JsonKey(name: 'status')  String status, @JsonKey(name: 'hours')  String hours, @JsonKey(name: 'rating')  String rating, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'lat')  String lat, @JsonKey(name: 'lng')  String lng, @JsonKey(name: 'distance')  int distance, @JsonKey(name: 'categories')  List<dynamic> categories, @JsonKey(name: 'location')  Location location)  $default,) {final _that = this;
switch (_that) {
case _Restaurant():
return $default(_that.id,_that.ownerId,_that.name,_that.description,_that.phone,_that.logo,_that.status,_that.hours,_that.rating,_that.createdAt,_that.lat,_that.lng,_that.distance,_that.categories,_that.location);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'owner_id')  int ownerId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'description')  String description, @JsonKey(name: 'phone')  String phone, @JsonKey(name: 'logo')  String? logo, @JsonKey(name: 'status')  String status, @JsonKey(name: 'hours')  String hours, @JsonKey(name: 'rating')  String rating, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'lat')  String lat, @JsonKey(name: 'lng')  String lng, @JsonKey(name: 'distance')  int distance, @JsonKey(name: 'categories')  List<dynamic> categories, @JsonKey(name: 'location')  Location location)?  $default,) {final _that = this;
switch (_that) {
case _Restaurant() when $default != null:
return $default(_that.id,_that.ownerId,_that.name,_that.description,_that.phone,_that.logo,_that.status,_that.hours,_that.rating,_that.createdAt,_that.lat,_that.lng,_that.distance,_that.categories,_that.location);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Restaurant implements Restaurant {
  const _Restaurant({@JsonKey(name: 'id') this.id = 0, @JsonKey(name: 'owner_id') this.ownerId = 0, @JsonKey(name: 'name') this.name = '', @JsonKey(name: 'description') this.description = '', @JsonKey(name: 'phone') this.phone = '', @JsonKey(name: 'logo') this.logo = '', @JsonKey(name: 'status') this.status = '', @JsonKey(name: 'hours') this.hours = '', @JsonKey(name: 'rating') this.rating = '0.0', @JsonKey(name: 'created_at') this.createdAt = '', @JsonKey(name: 'lat') this.lat = '', @JsonKey(name: 'lng') this.lng = '', @JsonKey(name: 'distance') this.distance = 0, @JsonKey(name: 'categories') final  List<dynamic> categories = const [], @JsonKey(name: 'location') this.location = const Location()}): _categories = categories;
  factory _Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'owner_id') final  int ownerId;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'description') final  String description;
@override@JsonKey(name: 'phone') final  String phone;
@override@JsonKey(name: 'logo') final  String? logo;
@override@JsonKey(name: 'status') final  String status;
@override@JsonKey(name: 'hours') final  String hours;
@override@JsonKey(name: 'rating') final  String rating;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'lat') final  String lat;
@override@JsonKey(name: 'lng') final  String lng;
@override@JsonKey(name: 'distance') final  int distance;
 final  List<dynamic> _categories;
@override@JsonKey(name: 'categories') List<dynamic> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override@JsonKey(name: 'location') final  Location location;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Restaurant&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.status, status) || other.status == status)&&(identical(other.hours, hours) || other.hours == hours)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.distance, distance) || other.distance == distance)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,name,description,phone,logo,status,hours,rating,createdAt,lat,lng,distance,const DeepCollectionEquality().hash(_categories),location);

@override
String toString() {
  return 'Restaurant(id: $id, ownerId: $ownerId, name: $name, description: $description, phone: $phone, logo: $logo, status: $status, hours: $hours, rating: $rating, createdAt: $createdAt, lat: $lat, lng: $lng, distance: $distance, categories: $categories, location: $location)';
}


}

/// @nodoc
abstract mixin class _$RestaurantCopyWith<$Res> implements $RestaurantCopyWith<$Res> {
  factory _$RestaurantCopyWith(_Restaurant value, $Res Function(_Restaurant) _then) = __$RestaurantCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'owner_id') int ownerId,@JsonKey(name: 'name') String name,@JsonKey(name: 'description') String description,@JsonKey(name: 'phone') String phone,@JsonKey(name: 'logo') String? logo,@JsonKey(name: 'status') String status,@JsonKey(name: 'hours') String hours,@JsonKey(name: 'rating') String rating,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'lat') String lat,@JsonKey(name: 'lng') String lng,@JsonKey(name: 'distance') int distance,@JsonKey(name: 'categories') List<dynamic> categories,@JsonKey(name: 'location') Location location
});


@override $LocationCopyWith<$Res> get location;

}
/// @nodoc
class __$RestaurantCopyWithImpl<$Res>
    implements _$RestaurantCopyWith<$Res> {
  __$RestaurantCopyWithImpl(this._self, this._then);

  final _Restaurant _self;
  final $Res Function(_Restaurant) _then;

/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ownerId = null,Object? name = null,Object? description = null,Object? phone = null,Object? logo = freezed,Object? status = null,Object? hours = null,Object? rating = null,Object? createdAt = null,Object? lat = null,Object? lng = null,Object? distance = null,Object? categories = null,Object? location = null,}) {
  return _then(_Restaurant(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,hours: null == hours ? _self.hours : hours // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as String,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<dynamic>,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location,
  ));
}

/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res> get location {
  
  return $LocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// @nodoc
mixin _$Location {

@JsonKey(name: 'restaurant_id') int get restaurantId;@JsonKey(name: 'place_id') String get placeId;@JsonKey(name: 'address') String get address;@JsonKey(name: 'lat') String get lat;@JsonKey(name: 'lng') String get lng;
/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationCopyWith<Location> get copyWith => _$LocationCopyWithImpl<Location>(this as Location, _$identity);

  /// Serializes this Location to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Location&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.placeId, placeId) || other.placeId == placeId)&&(identical(other.address, address) || other.address == address)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,restaurantId,placeId,address,lat,lng);

@override
String toString() {
  return 'Location(restaurantId: $restaurantId, placeId: $placeId, address: $address, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $LocationCopyWith<$Res>  {
  factory $LocationCopyWith(Location value, $Res Function(Location) _then) = _$LocationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'restaurant_id') int restaurantId,@JsonKey(name: 'place_id') String placeId,@JsonKey(name: 'address') String address,@JsonKey(name: 'lat') String lat,@JsonKey(name: 'lng') String lng
});




}
/// @nodoc
class _$LocationCopyWithImpl<$Res>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._self, this._then);

  final Location _self;
  final $Res Function(Location) _then;

/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? restaurantId = null,Object? placeId = null,Object? address = null,Object? lat = null,Object? lng = null,}) {
  return _then(_self.copyWith(
restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as int,placeId: null == placeId ? _self.placeId : placeId // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Location].
extension LocationPatterns on Location {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Location value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Location() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Location value)  $default,){
final _that = this;
switch (_that) {
case _Location():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Location value)?  $default,){
final _that = this;
switch (_that) {
case _Location() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'restaurant_id')  int restaurantId, @JsonKey(name: 'place_id')  String placeId, @JsonKey(name: 'address')  String address, @JsonKey(name: 'lat')  String lat, @JsonKey(name: 'lng')  String lng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Location() when $default != null:
return $default(_that.restaurantId,_that.placeId,_that.address,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'restaurant_id')  int restaurantId, @JsonKey(name: 'place_id')  String placeId, @JsonKey(name: 'address')  String address, @JsonKey(name: 'lat')  String lat, @JsonKey(name: 'lng')  String lng)  $default,) {final _that = this;
switch (_that) {
case _Location():
return $default(_that.restaurantId,_that.placeId,_that.address,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'restaurant_id')  int restaurantId, @JsonKey(name: 'place_id')  String placeId, @JsonKey(name: 'address')  String address, @JsonKey(name: 'lat')  String lat, @JsonKey(name: 'lng')  String lng)?  $default,) {final _that = this;
switch (_that) {
case _Location() when $default != null:
return $default(_that.restaurantId,_that.placeId,_that.address,_that.lat,_that.lng);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Location implements Location {
  const _Location({@JsonKey(name: 'restaurant_id') this.restaurantId = 0, @JsonKey(name: 'place_id') this.placeId = '', @JsonKey(name: 'address') this.address = '', @JsonKey(name: 'lat') this.lat = '', @JsonKey(name: 'lng') this.lng = ''});
  factory _Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

@override@JsonKey(name: 'restaurant_id') final  int restaurantId;
@override@JsonKey(name: 'place_id') final  String placeId;
@override@JsonKey(name: 'address') final  String address;
@override@JsonKey(name: 'lat') final  String lat;
@override@JsonKey(name: 'lng') final  String lng;

/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationCopyWith<_Location> get copyWith => __$LocationCopyWithImpl<_Location>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Location&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.placeId, placeId) || other.placeId == placeId)&&(identical(other.address, address) || other.address == address)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,restaurantId,placeId,address,lat,lng);

@override
String toString() {
  return 'Location(restaurantId: $restaurantId, placeId: $placeId, address: $address, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$LocationCopyWith(_Location value, $Res Function(_Location) _then) = __$LocationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'restaurant_id') int restaurantId,@JsonKey(name: 'place_id') String placeId,@JsonKey(name: 'address') String address,@JsonKey(name: 'lat') String lat,@JsonKey(name: 'lng') String lng
});




}
/// @nodoc
class __$LocationCopyWithImpl<$Res>
    implements _$LocationCopyWith<$Res> {
  __$LocationCopyWithImpl(this._self, this._then);

  final _Location _self;
  final $Res Function(_Location) _then;

/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? restaurantId = null,Object? placeId = null,Object? address = null,Object? lat = null,Object? lng = null,}) {
  return _then(_Location(
restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as int,placeId: null == placeId ? _self.placeId : placeId // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
