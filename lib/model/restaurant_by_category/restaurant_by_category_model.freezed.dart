// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_by_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RestaurantByCategory {

 bool get success; CategoryData get category; List<RestaurantData> get restaurants;
/// Create a copy of RestaurantByCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RestaurantByCategoryCopyWith<RestaurantByCategory> get copyWith => _$RestaurantByCategoryCopyWithImpl<RestaurantByCategory>(this as RestaurantByCategory, _$identity);

  /// Serializes this RestaurantByCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RestaurantByCategory&&(identical(other.success, success) || other.success == success)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.restaurants, restaurants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,category,const DeepCollectionEquality().hash(restaurants));

@override
String toString() {
  return 'RestaurantByCategory(success: $success, category: $category, restaurants: $restaurants)';
}


}

/// @nodoc
abstract mixin class $RestaurantByCategoryCopyWith<$Res>  {
  factory $RestaurantByCategoryCopyWith(RestaurantByCategory value, $Res Function(RestaurantByCategory) _then) = _$RestaurantByCategoryCopyWithImpl;
@useResult
$Res call({
 bool success, CategoryData category, List<RestaurantData> restaurants
});


$CategoryDataCopyWith<$Res> get category;

}
/// @nodoc
class _$RestaurantByCategoryCopyWithImpl<$Res>
    implements $RestaurantByCategoryCopyWith<$Res> {
  _$RestaurantByCategoryCopyWithImpl(this._self, this._then);

  final RestaurantByCategory _self;
  final $Res Function(RestaurantByCategory) _then;

/// Create a copy of RestaurantByCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? category = null,Object? restaurants = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryData,restaurants: null == restaurants ? _self.restaurants : restaurants // ignore: cast_nullable_to_non_nullable
as List<RestaurantData>,
  ));
}
/// Create a copy of RestaurantByCategory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryDataCopyWith<$Res> get category {
  
  return $CategoryDataCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [RestaurantByCategory].
extension RestaurantByCategoryPatterns on RestaurantByCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RestaurantByCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RestaurantByCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RestaurantByCategory value)  $default,){
final _that = this;
switch (_that) {
case _RestaurantByCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RestaurantByCategory value)?  $default,){
final _that = this;
switch (_that) {
case _RestaurantByCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  CategoryData category,  List<RestaurantData> restaurants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RestaurantByCategory() when $default != null:
return $default(_that.success,_that.category,_that.restaurants);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  CategoryData category,  List<RestaurantData> restaurants)  $default,) {final _that = this;
switch (_that) {
case _RestaurantByCategory():
return $default(_that.success,_that.category,_that.restaurants);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  CategoryData category,  List<RestaurantData> restaurants)?  $default,) {final _that = this;
switch (_that) {
case _RestaurantByCategory() when $default != null:
return $default(_that.success,_that.category,_that.restaurants);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RestaurantByCategory implements RestaurantByCategory {
  const _RestaurantByCategory({required this.success, required this.category, required final  List<RestaurantData> restaurants}): _restaurants = restaurants;
  factory _RestaurantByCategory.fromJson(Map<String, dynamic> json) => _$RestaurantByCategoryFromJson(json);

@override final  bool success;
@override final  CategoryData category;
 final  List<RestaurantData> _restaurants;
@override List<RestaurantData> get restaurants {
  if (_restaurants is EqualUnmodifiableListView) return _restaurants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_restaurants);
}


/// Create a copy of RestaurantByCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RestaurantByCategoryCopyWith<_RestaurantByCategory> get copyWith => __$RestaurantByCategoryCopyWithImpl<_RestaurantByCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RestaurantByCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestaurantByCategory&&(identical(other.success, success) || other.success == success)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._restaurants, _restaurants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,category,const DeepCollectionEquality().hash(_restaurants));

@override
String toString() {
  return 'RestaurantByCategory(success: $success, category: $category, restaurants: $restaurants)';
}


}

/// @nodoc
abstract mixin class _$RestaurantByCategoryCopyWith<$Res> implements $RestaurantByCategoryCopyWith<$Res> {
  factory _$RestaurantByCategoryCopyWith(_RestaurantByCategory value, $Res Function(_RestaurantByCategory) _then) = __$RestaurantByCategoryCopyWithImpl;
@override @useResult
$Res call({
 bool success, CategoryData category, List<RestaurantData> restaurants
});


@override $CategoryDataCopyWith<$Res> get category;

}
/// @nodoc
class __$RestaurantByCategoryCopyWithImpl<$Res>
    implements _$RestaurantByCategoryCopyWith<$Res> {
  __$RestaurantByCategoryCopyWithImpl(this._self, this._then);

  final _RestaurantByCategory _self;
  final $Res Function(_RestaurantByCategory) _then;

/// Create a copy of RestaurantByCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? category = null,Object? restaurants = null,}) {
  return _then(_RestaurantByCategory(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryData,restaurants: null == restaurants ? _self._restaurants : restaurants // ignore: cast_nullable_to_non_nullable
as List<RestaurantData>,
  ));
}

/// Create a copy of RestaurantByCategory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryDataCopyWith<$Res> get category {
  
  return $CategoryDataCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// @nodoc
mixin _$CategoryData {

 int get id; String get name; String get image;
/// Create a copy of CategoryData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryDataCopyWith<CategoryData> get copyWith => _$CategoryDataCopyWithImpl<CategoryData>(this as CategoryData, _$identity);

  /// Serializes this CategoryData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image);

@override
String toString() {
  return 'CategoryData(id: $id, name: $name, image: $image)';
}


}

/// @nodoc
abstract mixin class $CategoryDataCopyWith<$Res>  {
  factory $CategoryDataCopyWith(CategoryData value, $Res Function(CategoryData) _then) = _$CategoryDataCopyWithImpl;
@useResult
$Res call({
 int id, String name, String image
});




}
/// @nodoc
class _$CategoryDataCopyWithImpl<$Res>
    implements $CategoryDataCopyWith<$Res> {
  _$CategoryDataCopyWithImpl(this._self, this._then);

  final CategoryData _self;
  final $Res Function(CategoryData) _then;

/// Create a copy of CategoryData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? image = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryData].
extension CategoryDataPatterns on CategoryData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryData value)  $default,){
final _that = this;
switch (_that) {
case _CategoryData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryData value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryData() when $default != null:
return $default(_that.id,_that.name,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String image)  $default,) {final _that = this;
switch (_that) {
case _CategoryData():
return $default(_that.id,_that.name,_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String image)?  $default,) {final _that = this;
switch (_that) {
case _CategoryData() when $default != null:
return $default(_that.id,_that.name,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryData implements CategoryData {
  const _CategoryData({required this.id, required this.name, required this.image});
  factory _CategoryData.fromJson(Map<String, dynamic> json) => _$CategoryDataFromJson(json);

@override final  int id;
@override final  String name;
@override final  String image;

/// Create a copy of CategoryData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryDataCopyWith<_CategoryData> get copyWith => __$CategoryDataCopyWithImpl<_CategoryData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image);

@override
String toString() {
  return 'CategoryData(id: $id, name: $name, image: $image)';
}


}

/// @nodoc
abstract mixin class _$CategoryDataCopyWith<$Res> implements $CategoryDataCopyWith<$Res> {
  factory _$CategoryDataCopyWith(_CategoryData value, $Res Function(_CategoryData) _then) = __$CategoryDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String image
});




}
/// @nodoc
class __$CategoryDataCopyWithImpl<$Res>
    implements _$CategoryDataCopyWith<$Res> {
  __$CategoryDataCopyWithImpl(this._self, this._then);

  final _CategoryData _self;
  final $Res Function(_CategoryData) _then;

/// Create a copy of CategoryData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? image = null,}) {
  return _then(_CategoryData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RestaurantData {

@JsonKey(name: 'restaurant_id') int get restaurantId;@JsonKey(name: 'restaurant_name') String get restaurantName;@JsonKey(name: 'restaurant_logo') String? get restaurantLogo;
/// Create a copy of RestaurantData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RestaurantDataCopyWith<RestaurantData> get copyWith => _$RestaurantDataCopyWithImpl<RestaurantData>(this as RestaurantData, _$identity);

  /// Serializes this RestaurantData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RestaurantData&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.restaurantName, restaurantName) || other.restaurantName == restaurantName)&&(identical(other.restaurantLogo, restaurantLogo) || other.restaurantLogo == restaurantLogo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,restaurantId,restaurantName,restaurantLogo);

@override
String toString() {
  return 'RestaurantData(restaurantId: $restaurantId, restaurantName: $restaurantName, restaurantLogo: $restaurantLogo)';
}


}

/// @nodoc
abstract mixin class $RestaurantDataCopyWith<$Res>  {
  factory $RestaurantDataCopyWith(RestaurantData value, $Res Function(RestaurantData) _then) = _$RestaurantDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'restaurant_id') int restaurantId,@JsonKey(name: 'restaurant_name') String restaurantName,@JsonKey(name: 'restaurant_logo') String? restaurantLogo
});




}
/// @nodoc
class _$RestaurantDataCopyWithImpl<$Res>
    implements $RestaurantDataCopyWith<$Res> {
  _$RestaurantDataCopyWithImpl(this._self, this._then);

  final RestaurantData _self;
  final $Res Function(RestaurantData) _then;

/// Create a copy of RestaurantData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? restaurantId = null,Object? restaurantName = null,Object? restaurantLogo = freezed,}) {
  return _then(_self.copyWith(
restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as int,restaurantName: null == restaurantName ? _self.restaurantName : restaurantName // ignore: cast_nullable_to_non_nullable
as String,restaurantLogo: freezed == restaurantLogo ? _self.restaurantLogo : restaurantLogo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RestaurantData].
extension RestaurantDataPatterns on RestaurantData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RestaurantData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RestaurantData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RestaurantData value)  $default,){
final _that = this;
switch (_that) {
case _RestaurantData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RestaurantData value)?  $default,){
final _that = this;
switch (_that) {
case _RestaurantData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'restaurant_id')  int restaurantId, @JsonKey(name: 'restaurant_name')  String restaurantName, @JsonKey(name: 'restaurant_logo')  String? restaurantLogo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RestaurantData() when $default != null:
return $default(_that.restaurantId,_that.restaurantName,_that.restaurantLogo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'restaurant_id')  int restaurantId, @JsonKey(name: 'restaurant_name')  String restaurantName, @JsonKey(name: 'restaurant_logo')  String? restaurantLogo)  $default,) {final _that = this;
switch (_that) {
case _RestaurantData():
return $default(_that.restaurantId,_that.restaurantName,_that.restaurantLogo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'restaurant_id')  int restaurantId, @JsonKey(name: 'restaurant_name')  String restaurantName, @JsonKey(name: 'restaurant_logo')  String? restaurantLogo)?  $default,) {final _that = this;
switch (_that) {
case _RestaurantData() when $default != null:
return $default(_that.restaurantId,_that.restaurantName,_that.restaurantLogo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RestaurantData implements RestaurantData {
  const _RestaurantData({@JsonKey(name: 'restaurant_id') required this.restaurantId, @JsonKey(name: 'restaurant_name') required this.restaurantName, @JsonKey(name: 'restaurant_logo') this.restaurantLogo});
  factory _RestaurantData.fromJson(Map<String, dynamic> json) => _$RestaurantDataFromJson(json);

@override@JsonKey(name: 'restaurant_id') final  int restaurantId;
@override@JsonKey(name: 'restaurant_name') final  String restaurantName;
@override@JsonKey(name: 'restaurant_logo') final  String? restaurantLogo;

/// Create a copy of RestaurantData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RestaurantDataCopyWith<_RestaurantData> get copyWith => __$RestaurantDataCopyWithImpl<_RestaurantData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RestaurantDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestaurantData&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.restaurantName, restaurantName) || other.restaurantName == restaurantName)&&(identical(other.restaurantLogo, restaurantLogo) || other.restaurantLogo == restaurantLogo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,restaurantId,restaurantName,restaurantLogo);

@override
String toString() {
  return 'RestaurantData(restaurantId: $restaurantId, restaurantName: $restaurantName, restaurantLogo: $restaurantLogo)';
}


}

/// @nodoc
abstract mixin class _$RestaurantDataCopyWith<$Res> implements $RestaurantDataCopyWith<$Res> {
  factory _$RestaurantDataCopyWith(_RestaurantData value, $Res Function(_RestaurantData) _then) = __$RestaurantDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'restaurant_id') int restaurantId,@JsonKey(name: 'restaurant_name') String restaurantName,@JsonKey(name: 'restaurant_logo') String? restaurantLogo
});




}
/// @nodoc
class __$RestaurantDataCopyWithImpl<$Res>
    implements _$RestaurantDataCopyWith<$Res> {
  __$RestaurantDataCopyWithImpl(this._self, this._then);

  final _RestaurantData _self;
  final $Res Function(_RestaurantData) _then;

/// Create a copy of RestaurantData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? restaurantId = null,Object? restaurantName = null,Object? restaurantLogo = freezed,}) {
  return _then(_RestaurantData(
restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as int,restaurantName: null == restaurantName ? _self.restaurantName : restaurantName // ignore: cast_nullable_to_non_nullable
as String,restaurantLogo: freezed == restaurantLogo ? _self.restaurantLogo : restaurantLogo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
