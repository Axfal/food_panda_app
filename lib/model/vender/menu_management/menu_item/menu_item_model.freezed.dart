// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuItemModel {

@JsonKey(name: 'success') bool get success;@JsonKey(name: 'count') int get count;@JsonKey(name: 'error') String get error;@JsonKey(name: 'items') List<Item> get items;
/// Create a copy of MenuItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuItemModelCopyWith<MenuItemModel> get copyWith => _$MenuItemModelCopyWithImpl<MenuItemModel>(this as MenuItemModel, _$identity);

  /// Serializes this MenuItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuItemModel&&(identical(other.success, success) || other.success == success)&&(identical(other.count, count) || other.count == count)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,count,error,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'MenuItemModel(success: $success, count: $count, error: $error, items: $items)';
}


}

/// @nodoc
abstract mixin class $MenuItemModelCopyWith<$Res>  {
  factory $MenuItemModelCopyWith(MenuItemModel value, $Res Function(MenuItemModel) _then) = _$MenuItemModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'success') bool success,@JsonKey(name: 'count') int count,@JsonKey(name: 'error') String error,@JsonKey(name: 'items') List<Item> items
});




}
/// @nodoc
class _$MenuItemModelCopyWithImpl<$Res>
    implements $MenuItemModelCopyWith<$Res> {
  _$MenuItemModelCopyWithImpl(this._self, this._then);

  final MenuItemModel _self;
  final $Res Function(MenuItemModel) _then;

/// Create a copy of MenuItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? count = null,Object? error = null,Object? items = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Item>,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuItemModel].
extension MenuItemModelPatterns on MenuItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuItemModel value)  $default,){
final _that = this;
switch (_that) {
case _MenuItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _MenuItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool success, @JsonKey(name: 'count')  int count, @JsonKey(name: 'error')  String error, @JsonKey(name: 'items')  List<Item> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuItemModel() when $default != null:
return $default(_that.success,_that.count,_that.error,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool success, @JsonKey(name: 'count')  int count, @JsonKey(name: 'error')  String error, @JsonKey(name: 'items')  List<Item> items)  $default,) {final _that = this;
switch (_that) {
case _MenuItemModel():
return $default(_that.success,_that.count,_that.error,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'success')  bool success, @JsonKey(name: 'count')  int count, @JsonKey(name: 'error')  String error, @JsonKey(name: 'items')  List<Item> items)?  $default,) {final _that = this;
switch (_that) {
case _MenuItemModel() when $default != null:
return $default(_that.success,_that.count,_that.error,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuItemModel extends MenuItemModel {
  const _MenuItemModel({@JsonKey(name: 'success') this.success = false, @JsonKey(name: 'count') this.count = 0, @JsonKey(name: 'error') this.error = '', @JsonKey(name: 'items') final  List<Item> items = const <Item>[]}): _items = items,super._();
  factory _MenuItemModel.fromJson(Map<String, dynamic> json) => _$MenuItemModelFromJson(json);

@override@JsonKey(name: 'success') final  bool success;
@override@JsonKey(name: 'count') final  int count;
@override@JsonKey(name: 'error') final  String error;
 final  List<Item> _items;
@override@JsonKey(name: 'items') List<Item> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of MenuItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuItemModelCopyWith<_MenuItemModel> get copyWith => __$MenuItemModelCopyWithImpl<_MenuItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuItemModel&&(identical(other.success, success) || other.success == success)&&(identical(other.count, count) || other.count == count)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,count,error,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'MenuItemModel(success: $success, count: $count, error: $error, items: $items)';
}


}

/// @nodoc
abstract mixin class _$MenuItemModelCopyWith<$Res> implements $MenuItemModelCopyWith<$Res> {
  factory _$MenuItemModelCopyWith(_MenuItemModel value, $Res Function(_MenuItemModel) _then) = __$MenuItemModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'success') bool success,@JsonKey(name: 'count') int count,@JsonKey(name: 'error') String error,@JsonKey(name: 'items') List<Item> items
});




}
/// @nodoc
class __$MenuItemModelCopyWithImpl<$Res>
    implements _$MenuItemModelCopyWith<$Res> {
  __$MenuItemModelCopyWithImpl(this._self, this._then);

  final _MenuItemModel _self;
  final $Res Function(_MenuItemModel) _then;

/// Create a copy of MenuItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? count = null,Object? error = null,Object? items = null,}) {
  return _then(_MenuItemModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Item>,
  ));
}


}


/// @nodoc
mixin _$Item {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'restaurant_id') int get restaurantId;@JsonKey(name: 'category_id') int get categoryId;@JsonKey(name: 'name') String get name;@JsonKey(name: 'description') String get description;// If API gives null for price, default string is used
@JsonKey(name: 'price') String get price;@JsonKey(name: 'photo') String get photo;@JsonKey(name: 'status') String get status;@JsonKey(name: 'variations') List<Variation> get variations;
/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemCopyWith<Item> get copyWith => _$ItemCopyWithImpl<Item>(this as Item, _$identity);

  /// Serializes this Item to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Item&&(identical(other.id, id) || other.id == id)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.variations, variations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,restaurantId,categoryId,name,description,price,photo,status,const DeepCollectionEquality().hash(variations));

@override
String toString() {
  return 'Item(id: $id, restaurantId: $restaurantId, categoryId: $categoryId, name: $name, description: $description, price: $price, photo: $photo, status: $status, variations: $variations)';
}


}

/// @nodoc
abstract mixin class $ItemCopyWith<$Res>  {
  factory $ItemCopyWith(Item value, $Res Function(Item) _then) = _$ItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'restaurant_id') int restaurantId,@JsonKey(name: 'category_id') int categoryId,@JsonKey(name: 'name') String name,@JsonKey(name: 'description') String description,@JsonKey(name: 'price') String price,@JsonKey(name: 'photo') String photo,@JsonKey(name: 'status') String status,@JsonKey(name: 'variations') List<Variation> variations
});




}
/// @nodoc
class _$ItemCopyWithImpl<$Res>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._self, this._then);

  final Item _self;
  final $Res Function(Item) _then;

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? restaurantId = null,Object? categoryId = null,Object? name = null,Object? description = null,Object? price = null,Object? photo = null,Object? status = null,Object? variations = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,variations: null == variations ? _self.variations : variations // ignore: cast_nullable_to_non_nullable
as List<Variation>,
  ));
}

}


/// Adds pattern-matching-related methods to [Item].
extension ItemPatterns on Item {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Item value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Item() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Item value)  $default,){
final _that = this;
switch (_that) {
case _Item():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Item value)?  $default,){
final _that = this;
switch (_that) {
case _Item() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'restaurant_id')  int restaurantId, @JsonKey(name: 'category_id')  int categoryId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'description')  String description, @JsonKey(name: 'price')  String price, @JsonKey(name: 'photo')  String photo, @JsonKey(name: 'status')  String status, @JsonKey(name: 'variations')  List<Variation> variations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Item() when $default != null:
return $default(_that.id,_that.restaurantId,_that.categoryId,_that.name,_that.description,_that.price,_that.photo,_that.status,_that.variations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'restaurant_id')  int restaurantId, @JsonKey(name: 'category_id')  int categoryId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'description')  String description, @JsonKey(name: 'price')  String price, @JsonKey(name: 'photo')  String photo, @JsonKey(name: 'status')  String status, @JsonKey(name: 'variations')  List<Variation> variations)  $default,) {final _that = this;
switch (_that) {
case _Item():
return $default(_that.id,_that.restaurantId,_that.categoryId,_that.name,_that.description,_that.price,_that.photo,_that.status,_that.variations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'restaurant_id')  int restaurantId, @JsonKey(name: 'category_id')  int categoryId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'description')  String description, @JsonKey(name: 'price')  String price, @JsonKey(name: 'photo')  String photo, @JsonKey(name: 'status')  String status, @JsonKey(name: 'variations')  List<Variation> variations)?  $default,) {final _that = this;
switch (_that) {
case _Item() when $default != null:
return $default(_that.id,_that.restaurantId,_that.categoryId,_that.name,_that.description,_that.price,_that.photo,_that.status,_that.variations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Item extends Item {
  const _Item({@JsonKey(name: 'id') this.id = 0, @JsonKey(name: 'restaurant_id') this.restaurantId = 0, @JsonKey(name: 'category_id') this.categoryId = 0, @JsonKey(name: 'name') this.name = '', @JsonKey(name: 'description') this.description = '', @JsonKey(name: 'price') this.price = '0.00', @JsonKey(name: 'photo') this.photo = '', @JsonKey(name: 'status') this.status = '', @JsonKey(name: 'variations') final  List<Variation> variations = const <Variation>[]}): _variations = variations,super._();
  factory _Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'restaurant_id') final  int restaurantId;
@override@JsonKey(name: 'category_id') final  int categoryId;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'description') final  String description;
// If API gives null for price, default string is used
@override@JsonKey(name: 'price') final  String price;
@override@JsonKey(name: 'photo') final  String photo;
@override@JsonKey(name: 'status') final  String status;
 final  List<Variation> _variations;
@override@JsonKey(name: 'variations') List<Variation> get variations {
  if (_variations is EqualUnmodifiableListView) return _variations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_variations);
}


/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemCopyWith<_Item> get copyWith => __$ItemCopyWithImpl<_Item>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Item&&(identical(other.id, id) || other.id == id)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._variations, _variations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,restaurantId,categoryId,name,description,price,photo,status,const DeepCollectionEquality().hash(_variations));

@override
String toString() {
  return 'Item(id: $id, restaurantId: $restaurantId, categoryId: $categoryId, name: $name, description: $description, price: $price, photo: $photo, status: $status, variations: $variations)';
}


}

/// @nodoc
abstract mixin class _$ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$ItemCopyWith(_Item value, $Res Function(_Item) _then) = __$ItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'restaurant_id') int restaurantId,@JsonKey(name: 'category_id') int categoryId,@JsonKey(name: 'name') String name,@JsonKey(name: 'description') String description,@JsonKey(name: 'price') String price,@JsonKey(name: 'photo') String photo,@JsonKey(name: 'status') String status,@JsonKey(name: 'variations') List<Variation> variations
});




}
/// @nodoc
class __$ItemCopyWithImpl<$Res>
    implements _$ItemCopyWith<$Res> {
  __$ItemCopyWithImpl(this._self, this._then);

  final _Item _self;
  final $Res Function(_Item) _then;

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? restaurantId = null,Object? categoryId = null,Object? name = null,Object? description = null,Object? price = null,Object? photo = null,Object? status = null,Object? variations = null,}) {
  return _then(_Item(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,variations: null == variations ? _self._variations : variations // ignore: cast_nullable_to_non_nullable
as List<Variation>,
  ));
}


}


/// @nodoc
mixin _$Variation {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'price') String get price;
/// Create a copy of Variation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VariationCopyWith<Variation> get copyWith => _$VariationCopyWithImpl<Variation>(this as Variation, _$identity);

  /// Serializes this Variation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Variation&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price);

@override
String toString() {
  return 'Variation(id: $id, name: $name, price: $price)';
}


}

/// @nodoc
abstract mixin class $VariationCopyWith<$Res>  {
  factory $VariationCopyWith(Variation value, $Res Function(Variation) _then) = _$VariationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'price') String price
});




}
/// @nodoc
class _$VariationCopyWithImpl<$Res>
    implements $VariationCopyWith<$Res> {
  _$VariationCopyWithImpl(this._self, this._then);

  final Variation _self;
  final $Res Function(Variation) _then;

/// Create a copy of Variation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? price = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Variation].
extension VariationPatterns on Variation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Variation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Variation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Variation value)  $default,){
final _that = this;
switch (_that) {
case _Variation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Variation value)?  $default,){
final _that = this;
switch (_that) {
case _Variation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'price')  String price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Variation() when $default != null:
return $default(_that.id,_that.name,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'price')  String price)  $default,) {final _that = this;
switch (_that) {
case _Variation():
return $default(_that.id,_that.name,_that.price);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'price')  String price)?  $default,) {final _that = this;
switch (_that) {
case _Variation() when $default != null:
return $default(_that.id,_that.name,_that.price);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Variation extends Variation {
  const _Variation({@JsonKey(name: 'id') this.id = 0, @JsonKey(name: 'name') this.name = '', @JsonKey(name: 'price') this.price = '0.00'}): super._();
  factory _Variation.fromJson(Map<String, dynamic> json) => _$VariationFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'price') final  String price;

/// Create a copy of Variation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VariationCopyWith<_Variation> get copyWith => __$VariationCopyWithImpl<_Variation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VariationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Variation&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price);

@override
String toString() {
  return 'Variation(id: $id, name: $name, price: $price)';
}


}

/// @nodoc
abstract mixin class _$VariationCopyWith<$Res> implements $VariationCopyWith<$Res> {
  factory _$VariationCopyWith(_Variation value, $Res Function(_Variation) _then) = __$VariationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'price') String price
});




}
/// @nodoc
class __$VariationCopyWithImpl<$Res>
    implements _$VariationCopyWith<$Res> {
  __$VariationCopyWithImpl(this._self, this._then);

  final _Variation _self;
  final $Res Function(_Variation) _then;

/// Create a copy of Variation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? price = null,}) {
  return _then(_Variation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
