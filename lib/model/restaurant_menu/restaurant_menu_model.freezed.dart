// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_menu_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RestaurantMenuModel {

 bool get success; Restaurant get restaurant;
/// Create a copy of RestaurantMenuModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RestaurantMenuModelCopyWith<RestaurantMenuModel> get copyWith => _$RestaurantMenuModelCopyWithImpl<RestaurantMenuModel>(this as RestaurantMenuModel, _$identity);

  /// Serializes this RestaurantMenuModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RestaurantMenuModel&&(identical(other.success, success) || other.success == success)&&(identical(other.restaurant, restaurant) || other.restaurant == restaurant));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,restaurant);

@override
String toString() {
  return 'RestaurantMenuModel(success: $success, restaurant: $restaurant)';
}


}

/// @nodoc
abstract mixin class $RestaurantMenuModelCopyWith<$Res>  {
  factory $RestaurantMenuModelCopyWith(RestaurantMenuModel value, $Res Function(RestaurantMenuModel) _then) = _$RestaurantMenuModelCopyWithImpl;
@useResult
$Res call({
 bool success, Restaurant restaurant
});


$RestaurantCopyWith<$Res> get restaurant;

}
/// @nodoc
class _$RestaurantMenuModelCopyWithImpl<$Res>
    implements $RestaurantMenuModelCopyWith<$Res> {
  _$RestaurantMenuModelCopyWithImpl(this._self, this._then);

  final RestaurantMenuModel _self;
  final $Res Function(RestaurantMenuModel) _then;

/// Create a copy of RestaurantMenuModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? restaurant = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,restaurant: null == restaurant ? _self.restaurant : restaurant // ignore: cast_nullable_to_non_nullable
as Restaurant,
  ));
}
/// Create a copy of RestaurantMenuModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RestaurantCopyWith<$Res> get restaurant {
  
  return $RestaurantCopyWith<$Res>(_self.restaurant, (value) {
    return _then(_self.copyWith(restaurant: value));
  });
}
}


/// Adds pattern-matching-related methods to [RestaurantMenuModel].
extension RestaurantMenuModelPatterns on RestaurantMenuModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RestaurantMenuModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RestaurantMenuModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RestaurantMenuModel value)  $default,){
final _that = this;
switch (_that) {
case _RestaurantMenuModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RestaurantMenuModel value)?  $default,){
final _that = this;
switch (_that) {
case _RestaurantMenuModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  Restaurant restaurant)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RestaurantMenuModel() when $default != null:
return $default(_that.success,_that.restaurant);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  Restaurant restaurant)  $default,) {final _that = this;
switch (_that) {
case _RestaurantMenuModel():
return $default(_that.success,_that.restaurant);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  Restaurant restaurant)?  $default,) {final _that = this;
switch (_that) {
case _RestaurantMenuModel() when $default != null:
return $default(_that.success,_that.restaurant);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RestaurantMenuModel implements RestaurantMenuModel {
  const _RestaurantMenuModel({required this.success, required this.restaurant});
  factory _RestaurantMenuModel.fromJson(Map<String, dynamic> json) => _$RestaurantMenuModelFromJson(json);

@override final  bool success;
@override final  Restaurant restaurant;

/// Create a copy of RestaurantMenuModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RestaurantMenuModelCopyWith<_RestaurantMenuModel> get copyWith => __$RestaurantMenuModelCopyWithImpl<_RestaurantMenuModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RestaurantMenuModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestaurantMenuModel&&(identical(other.success, success) || other.success == success)&&(identical(other.restaurant, restaurant) || other.restaurant == restaurant));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,restaurant);

@override
String toString() {
  return 'RestaurantMenuModel(success: $success, restaurant: $restaurant)';
}


}

/// @nodoc
abstract mixin class _$RestaurantMenuModelCopyWith<$Res> implements $RestaurantMenuModelCopyWith<$Res> {
  factory _$RestaurantMenuModelCopyWith(_RestaurantMenuModel value, $Res Function(_RestaurantMenuModel) _then) = __$RestaurantMenuModelCopyWithImpl;
@override @useResult
$Res call({
 bool success, Restaurant restaurant
});


@override $RestaurantCopyWith<$Res> get restaurant;

}
/// @nodoc
class __$RestaurantMenuModelCopyWithImpl<$Res>
    implements _$RestaurantMenuModelCopyWith<$Res> {
  __$RestaurantMenuModelCopyWithImpl(this._self, this._then);

  final _RestaurantMenuModel _self;
  final $Res Function(_RestaurantMenuModel) _then;

/// Create a copy of RestaurantMenuModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? restaurant = null,}) {
  return _then(_RestaurantMenuModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,restaurant: null == restaurant ? _self.restaurant : restaurant // ignore: cast_nullable_to_non_nullable
as Restaurant,
  ));
}

/// Create a copy of RestaurantMenuModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RestaurantCopyWith<$Res> get restaurant {
  
  return $RestaurantCopyWith<$Res>(_self.restaurant, (value) {
    return _then(_self.copyWith(restaurant: value));
  });
}
}


/// @nodoc
mixin _$Restaurant {

@JsonKey(name: 'restaurant_id') int get restaurantId;@JsonKey(name: 'restaurant_name') String get restaurantName;@JsonKey(name: 'restaurant_logo') String? get restaurantLogo; List<MenuCategory> get categories;
/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RestaurantCopyWith<Restaurant> get copyWith => _$RestaurantCopyWithImpl<Restaurant>(this as Restaurant, _$identity);

  /// Serializes this Restaurant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Restaurant&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.restaurantName, restaurantName) || other.restaurantName == restaurantName)&&(identical(other.restaurantLogo, restaurantLogo) || other.restaurantLogo == restaurantLogo)&&const DeepCollectionEquality().equals(other.categories, categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,restaurantId,restaurantName,restaurantLogo,const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'Restaurant(restaurantId: $restaurantId, restaurantName: $restaurantName, restaurantLogo: $restaurantLogo, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $RestaurantCopyWith<$Res>  {
  factory $RestaurantCopyWith(Restaurant value, $Res Function(Restaurant) _then) = _$RestaurantCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'restaurant_id') int restaurantId,@JsonKey(name: 'restaurant_name') String restaurantName,@JsonKey(name: 'restaurant_logo') String? restaurantLogo, List<MenuCategory> categories
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
@pragma('vm:prefer-inline') @override $Res call({Object? restaurantId = null,Object? restaurantName = null,Object? restaurantLogo = freezed,Object? categories = null,}) {
  return _then(_self.copyWith(
restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as int,restaurantName: null == restaurantName ? _self.restaurantName : restaurantName // ignore: cast_nullable_to_non_nullable
as String,restaurantLogo: freezed == restaurantLogo ? _self.restaurantLogo : restaurantLogo // ignore: cast_nullable_to_non_nullable
as String?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<MenuCategory>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'restaurant_id')  int restaurantId, @JsonKey(name: 'restaurant_name')  String restaurantName, @JsonKey(name: 'restaurant_logo')  String? restaurantLogo,  List<MenuCategory> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Restaurant() when $default != null:
return $default(_that.restaurantId,_that.restaurantName,_that.restaurantLogo,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'restaurant_id')  int restaurantId, @JsonKey(name: 'restaurant_name')  String restaurantName, @JsonKey(name: 'restaurant_logo')  String? restaurantLogo,  List<MenuCategory> categories)  $default,) {final _that = this;
switch (_that) {
case _Restaurant():
return $default(_that.restaurantId,_that.restaurantName,_that.restaurantLogo,_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'restaurant_id')  int restaurantId, @JsonKey(name: 'restaurant_name')  String restaurantName, @JsonKey(name: 'restaurant_logo')  String? restaurantLogo,  List<MenuCategory> categories)?  $default,) {final _that = this;
switch (_that) {
case _Restaurant() when $default != null:
return $default(_that.restaurantId,_that.restaurantName,_that.restaurantLogo,_that.categories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Restaurant implements Restaurant {
  const _Restaurant({@JsonKey(name: 'restaurant_id') required this.restaurantId, @JsonKey(name: 'restaurant_name') required this.restaurantName, @JsonKey(name: 'restaurant_logo') this.restaurantLogo, required final  List<MenuCategory> categories}): _categories = categories;
  factory _Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);

@override@JsonKey(name: 'restaurant_id') final  int restaurantId;
@override@JsonKey(name: 'restaurant_name') final  String restaurantName;
@override@JsonKey(name: 'restaurant_logo') final  String? restaurantLogo;
 final  List<MenuCategory> _categories;
@override List<MenuCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Restaurant&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.restaurantName, restaurantName) || other.restaurantName == restaurantName)&&(identical(other.restaurantLogo, restaurantLogo) || other.restaurantLogo == restaurantLogo)&&const DeepCollectionEquality().equals(other._categories, _categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,restaurantId,restaurantName,restaurantLogo,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'Restaurant(restaurantId: $restaurantId, restaurantName: $restaurantName, restaurantLogo: $restaurantLogo, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$RestaurantCopyWith<$Res> implements $RestaurantCopyWith<$Res> {
  factory _$RestaurantCopyWith(_Restaurant value, $Res Function(_Restaurant) _then) = __$RestaurantCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'restaurant_id') int restaurantId,@JsonKey(name: 'restaurant_name') String restaurantName,@JsonKey(name: 'restaurant_logo') String? restaurantLogo, List<MenuCategory> categories
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
@override @pragma('vm:prefer-inline') $Res call({Object? restaurantId = null,Object? restaurantName = null,Object? restaurantLogo = freezed,Object? categories = null,}) {
  return _then(_Restaurant(
restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as int,restaurantName: null == restaurantName ? _self.restaurantName : restaurantName // ignore: cast_nullable_to_non_nullable
as String,restaurantLogo: freezed == restaurantLogo ? _self.restaurantLogo : restaurantLogo // ignore: cast_nullable_to_non_nullable
as String?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<MenuCategory>,
  ));
}


}


/// @nodoc
mixin _$MenuCategory {

@JsonKey(name: 'category_id') int get categoryId;@JsonKey(name: 'category_name') String get categoryName;@JsonKey(name: 'category_photo') String? get categoryPhoto; List<MenuItem> get items;
/// Create a copy of MenuCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuCategoryCopyWith<MenuCategory> get copyWith => _$MenuCategoryCopyWithImpl<MenuCategory>(this as MenuCategory, _$identity);

  /// Serializes this MenuCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuCategory&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.categoryPhoto, categoryPhoto) || other.categoryPhoto == categoryPhoto)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,categoryName,categoryPhoto,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'MenuCategory(categoryId: $categoryId, categoryName: $categoryName, categoryPhoto: $categoryPhoto, items: $items)';
}


}

/// @nodoc
abstract mixin class $MenuCategoryCopyWith<$Res>  {
  factory $MenuCategoryCopyWith(MenuCategory value, $Res Function(MenuCategory) _then) = _$MenuCategoryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'category_id') int categoryId,@JsonKey(name: 'category_name') String categoryName,@JsonKey(name: 'category_photo') String? categoryPhoto, List<MenuItem> items
});




}
/// @nodoc
class _$MenuCategoryCopyWithImpl<$Res>
    implements $MenuCategoryCopyWith<$Res> {
  _$MenuCategoryCopyWithImpl(this._self, this._then);

  final MenuCategory _self;
  final $Res Function(MenuCategory) _then;

/// Create a copy of MenuCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryId = null,Object? categoryName = null,Object? categoryPhoto = freezed,Object? items = null,}) {
  return _then(_self.copyWith(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,categoryPhoto: freezed == categoryPhoto ? _self.categoryPhoto : categoryPhoto // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<MenuItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuCategory].
extension MenuCategoryPatterns on MenuCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuCategory value)  $default,){
final _that = this;
switch (_that) {
case _MenuCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuCategory value)?  $default,){
final _that = this;
switch (_that) {
case _MenuCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'category_id')  int categoryId, @JsonKey(name: 'category_name')  String categoryName, @JsonKey(name: 'category_photo')  String? categoryPhoto,  List<MenuItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuCategory() when $default != null:
return $default(_that.categoryId,_that.categoryName,_that.categoryPhoto,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'category_id')  int categoryId, @JsonKey(name: 'category_name')  String categoryName, @JsonKey(name: 'category_photo')  String? categoryPhoto,  List<MenuItem> items)  $default,) {final _that = this;
switch (_that) {
case _MenuCategory():
return $default(_that.categoryId,_that.categoryName,_that.categoryPhoto,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'category_id')  int categoryId, @JsonKey(name: 'category_name')  String categoryName, @JsonKey(name: 'category_photo')  String? categoryPhoto,  List<MenuItem> items)?  $default,) {final _that = this;
switch (_that) {
case _MenuCategory() when $default != null:
return $default(_that.categoryId,_that.categoryName,_that.categoryPhoto,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuCategory implements MenuCategory {
  const _MenuCategory({@JsonKey(name: 'category_id') required this.categoryId, @JsonKey(name: 'category_name') required this.categoryName, @JsonKey(name: 'category_photo') required this.categoryPhoto, required final  List<MenuItem> items}): _items = items;
  factory _MenuCategory.fromJson(Map<String, dynamic> json) => _$MenuCategoryFromJson(json);

@override@JsonKey(name: 'category_id') final  int categoryId;
@override@JsonKey(name: 'category_name') final  String categoryName;
@override@JsonKey(name: 'category_photo') final  String? categoryPhoto;
 final  List<MenuItem> _items;
@override List<MenuItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of MenuCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuCategoryCopyWith<_MenuCategory> get copyWith => __$MenuCategoryCopyWithImpl<_MenuCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuCategory&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.categoryPhoto, categoryPhoto) || other.categoryPhoto == categoryPhoto)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,categoryName,categoryPhoto,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'MenuCategory(categoryId: $categoryId, categoryName: $categoryName, categoryPhoto: $categoryPhoto, items: $items)';
}


}

/// @nodoc
abstract mixin class _$MenuCategoryCopyWith<$Res> implements $MenuCategoryCopyWith<$Res> {
  factory _$MenuCategoryCopyWith(_MenuCategory value, $Res Function(_MenuCategory) _then) = __$MenuCategoryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'category_id') int categoryId,@JsonKey(name: 'category_name') String categoryName,@JsonKey(name: 'category_photo') String? categoryPhoto, List<MenuItem> items
});




}
/// @nodoc
class __$MenuCategoryCopyWithImpl<$Res>
    implements _$MenuCategoryCopyWith<$Res> {
  __$MenuCategoryCopyWithImpl(this._self, this._then);

  final _MenuCategory _self;
  final $Res Function(_MenuCategory) _then;

/// Create a copy of MenuCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? categoryName = null,Object? categoryPhoto = freezed,Object? items = null,}) {
  return _then(_MenuCategory(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,categoryPhoto: freezed == categoryPhoto ? _self.categoryPhoto : categoryPhoto // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MenuItem>,
  ));
}


}


/// @nodoc
mixin _$MenuItem {

@JsonKey(name: 'item_id') int get itemId;@JsonKey(name: 'item_name') String get itemName;@JsonKey(name: 'item_description') String get itemDescription;@JsonKey(name: 'item_price') String get itemPrice;@JsonKey(name: 'item_photo') String? get itemPhoto;@JsonKey(name: 'item_status') String get itemStatus;
/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuItemCopyWith<MenuItem> get copyWith => _$MenuItemCopyWithImpl<MenuItem>(this as MenuItem, _$identity);

  /// Serializes this MenuItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuItem&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemDescription, itemDescription) || other.itemDescription == itemDescription)&&(identical(other.itemPrice, itemPrice) || other.itemPrice == itemPrice)&&(identical(other.itemPhoto, itemPhoto) || other.itemPhoto == itemPhoto)&&(identical(other.itemStatus, itemStatus) || other.itemStatus == itemStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,itemName,itemDescription,itemPrice,itemPhoto,itemStatus);

@override
String toString() {
  return 'MenuItem(itemId: $itemId, itemName: $itemName, itemDescription: $itemDescription, itemPrice: $itemPrice, itemPhoto: $itemPhoto, itemStatus: $itemStatus)';
}


}

/// @nodoc
abstract mixin class $MenuItemCopyWith<$Res>  {
  factory $MenuItemCopyWith(MenuItem value, $Res Function(MenuItem) _then) = _$MenuItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'item_id') int itemId,@JsonKey(name: 'item_name') String itemName,@JsonKey(name: 'item_description') String itemDescription,@JsonKey(name: 'item_price') String itemPrice,@JsonKey(name: 'item_photo') String? itemPhoto,@JsonKey(name: 'item_status') String itemStatus
});




}
/// @nodoc
class _$MenuItemCopyWithImpl<$Res>
    implements $MenuItemCopyWith<$Res> {
  _$MenuItemCopyWithImpl(this._self, this._then);

  final MenuItem _self;
  final $Res Function(MenuItem) _then;

/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? itemName = null,Object? itemDescription = null,Object? itemPrice = null,Object? itemPhoto = freezed,Object? itemStatus = null,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemDescription: null == itemDescription ? _self.itemDescription : itemDescription // ignore: cast_nullable_to_non_nullable
as String,itemPrice: null == itemPrice ? _self.itemPrice : itemPrice // ignore: cast_nullable_to_non_nullable
as String,itemPhoto: freezed == itemPhoto ? _self.itemPhoto : itemPhoto // ignore: cast_nullable_to_non_nullable
as String?,itemStatus: null == itemStatus ? _self.itemStatus : itemStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuItem].
extension MenuItemPatterns on MenuItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuItem value)  $default,){
final _that = this;
switch (_that) {
case _MenuItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuItem value)?  $default,){
final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'item_id')  int itemId, @JsonKey(name: 'item_name')  String itemName, @JsonKey(name: 'item_description')  String itemDescription, @JsonKey(name: 'item_price')  String itemPrice, @JsonKey(name: 'item_photo')  String? itemPhoto, @JsonKey(name: 'item_status')  String itemStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
return $default(_that.itemId,_that.itemName,_that.itemDescription,_that.itemPrice,_that.itemPhoto,_that.itemStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'item_id')  int itemId, @JsonKey(name: 'item_name')  String itemName, @JsonKey(name: 'item_description')  String itemDescription, @JsonKey(name: 'item_price')  String itemPrice, @JsonKey(name: 'item_photo')  String? itemPhoto, @JsonKey(name: 'item_status')  String itemStatus)  $default,) {final _that = this;
switch (_that) {
case _MenuItem():
return $default(_that.itemId,_that.itemName,_that.itemDescription,_that.itemPrice,_that.itemPhoto,_that.itemStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'item_id')  int itemId, @JsonKey(name: 'item_name')  String itemName, @JsonKey(name: 'item_description')  String itemDescription, @JsonKey(name: 'item_price')  String itemPrice, @JsonKey(name: 'item_photo')  String? itemPhoto, @JsonKey(name: 'item_status')  String itemStatus)?  $default,) {final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
return $default(_that.itemId,_that.itemName,_that.itemDescription,_that.itemPrice,_that.itemPhoto,_that.itemStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuItem implements MenuItem {
  const _MenuItem({@JsonKey(name: 'item_id') required this.itemId, @JsonKey(name: 'item_name') required this.itemName, @JsonKey(name: 'item_description') required this.itemDescription, @JsonKey(name: 'item_price') required this.itemPrice, @JsonKey(name: 'item_photo') this.itemPhoto, @JsonKey(name: 'item_status') required this.itemStatus});
  factory _MenuItem.fromJson(Map<String, dynamic> json) => _$MenuItemFromJson(json);

@override@JsonKey(name: 'item_id') final  int itemId;
@override@JsonKey(name: 'item_name') final  String itemName;
@override@JsonKey(name: 'item_description') final  String itemDescription;
@override@JsonKey(name: 'item_price') final  String itemPrice;
@override@JsonKey(name: 'item_photo') final  String? itemPhoto;
@override@JsonKey(name: 'item_status') final  String itemStatus;

/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuItemCopyWith<_MenuItem> get copyWith => __$MenuItemCopyWithImpl<_MenuItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuItem&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemDescription, itemDescription) || other.itemDescription == itemDescription)&&(identical(other.itemPrice, itemPrice) || other.itemPrice == itemPrice)&&(identical(other.itemPhoto, itemPhoto) || other.itemPhoto == itemPhoto)&&(identical(other.itemStatus, itemStatus) || other.itemStatus == itemStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,itemName,itemDescription,itemPrice,itemPhoto,itemStatus);

@override
String toString() {
  return 'MenuItem(itemId: $itemId, itemName: $itemName, itemDescription: $itemDescription, itemPrice: $itemPrice, itemPhoto: $itemPhoto, itemStatus: $itemStatus)';
}


}

/// @nodoc
abstract mixin class _$MenuItemCopyWith<$Res> implements $MenuItemCopyWith<$Res> {
  factory _$MenuItemCopyWith(_MenuItem value, $Res Function(_MenuItem) _then) = __$MenuItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'item_id') int itemId,@JsonKey(name: 'item_name') String itemName,@JsonKey(name: 'item_description') String itemDescription,@JsonKey(name: 'item_price') String itemPrice,@JsonKey(name: 'item_photo') String? itemPhoto,@JsonKey(name: 'item_status') String itemStatus
});




}
/// @nodoc
class __$MenuItemCopyWithImpl<$Res>
    implements _$MenuItemCopyWith<$Res> {
  __$MenuItemCopyWithImpl(this._self, this._then);

  final _MenuItem _self;
  final $Res Function(_MenuItem) _then;

/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? itemName = null,Object? itemDescription = null,Object? itemPrice = null,Object? itemPhoto = freezed,Object? itemStatus = null,}) {
  return _then(_MenuItem(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemDescription: null == itemDescription ? _self.itemDescription : itemDescription // ignore: cast_nullable_to_non_nullable
as String,itemPrice: null == itemPrice ? _self.itemPrice : itemPrice // ignore: cast_nullable_to_non_nullable
as String,itemPhoto: freezed == itemPhoto ? _self.itemPhoto : itemPhoto // ignore: cast_nullable_to_non_nullable
as String?,itemStatus: null == itemStatus ? _self.itemStatus : itemStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
