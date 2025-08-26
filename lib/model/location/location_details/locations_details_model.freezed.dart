// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'locations_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationDetailsModel {

@JsonKey(name: 'success') bool get success;@JsonKey(name: 'place') Place? get place;// make place optional
 String get error;
/// Create a copy of LocationDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationDetailsModelCopyWith<LocationDetailsModel> get copyWith => _$LocationDetailsModelCopyWithImpl<LocationDetailsModel>(this as LocationDetailsModel, _$identity);

  /// Serializes this LocationDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationDetailsModel&&(identical(other.success, success) || other.success == success)&&(identical(other.place, place) || other.place == place)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,place,error);

@override
String toString() {
  return 'LocationDetailsModel(success: $success, place: $place, error: $error)';
}


}

/// @nodoc
abstract mixin class $LocationDetailsModelCopyWith<$Res>  {
  factory $LocationDetailsModelCopyWith(LocationDetailsModel value, $Res Function(LocationDetailsModel) _then) = _$LocationDetailsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'success') bool success,@JsonKey(name: 'place') Place? place, String error
});


$PlaceCopyWith<$Res>? get place;

}
/// @nodoc
class _$LocationDetailsModelCopyWithImpl<$Res>
    implements $LocationDetailsModelCopyWith<$Res> {
  _$LocationDetailsModelCopyWithImpl(this._self, this._then);

  final LocationDetailsModel _self;
  final $Res Function(LocationDetailsModel) _then;

/// Create a copy of LocationDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? place = freezed,Object? error = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,place: freezed == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as Place?,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of LocationDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaceCopyWith<$Res>? get place {
    if (_self.place == null) {
    return null;
  }

  return $PlaceCopyWith<$Res>(_self.place!, (value) {
    return _then(_self.copyWith(place: value));
  });
}
}


/// Adds pattern-matching-related methods to [LocationDetailsModel].
extension LocationDetailsModelPatterns on LocationDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _LocationDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _LocationDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool success, @JsonKey(name: 'place')  Place? place,  String error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationDetailsModel() when $default != null:
return $default(_that.success,_that.place,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool success, @JsonKey(name: 'place')  Place? place,  String error)  $default,) {final _that = this;
switch (_that) {
case _LocationDetailsModel():
return $default(_that.success,_that.place,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'success')  bool success, @JsonKey(name: 'place')  Place? place,  String error)?  $default,) {final _that = this;
switch (_that) {
case _LocationDetailsModel() when $default != null:
return $default(_that.success,_that.place,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocationDetailsModel implements LocationDetailsModel {
  const _LocationDetailsModel({@JsonKey(name: 'success') this.success = false, @JsonKey(name: 'place') this.place, this.error = ''});
  factory _LocationDetailsModel.fromJson(Map<String, dynamic> json) => _$LocationDetailsModelFromJson(json);

@override@JsonKey(name: 'success') final  bool success;
@override@JsonKey(name: 'place') final  Place? place;
// make place optional
@override@JsonKey() final  String error;

/// Create a copy of LocationDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationDetailsModelCopyWith<_LocationDetailsModel> get copyWith => __$LocationDetailsModelCopyWithImpl<_LocationDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationDetailsModel&&(identical(other.success, success) || other.success == success)&&(identical(other.place, place) || other.place == place)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,place,error);

@override
String toString() {
  return 'LocationDetailsModel(success: $success, place: $place, error: $error)';
}


}

/// @nodoc
abstract mixin class _$LocationDetailsModelCopyWith<$Res> implements $LocationDetailsModelCopyWith<$Res> {
  factory _$LocationDetailsModelCopyWith(_LocationDetailsModel value, $Res Function(_LocationDetailsModel) _then) = __$LocationDetailsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'success') bool success,@JsonKey(name: 'place') Place? place, String error
});


@override $PlaceCopyWith<$Res>? get place;

}
/// @nodoc
class __$LocationDetailsModelCopyWithImpl<$Res>
    implements _$LocationDetailsModelCopyWith<$Res> {
  __$LocationDetailsModelCopyWithImpl(this._self, this._then);

  final _LocationDetailsModel _self;
  final $Res Function(_LocationDetailsModel) _then;

/// Create a copy of LocationDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? place = freezed,Object? error = null,}) {
  return _then(_LocationDetailsModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,place: freezed == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as Place?,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of LocationDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaceCopyWith<$Res>? get place {
    if (_self.place == null) {
    return null;
  }

  return $PlaceCopyWith<$Res>(_self.place!, (value) {
    return _then(_self.copyWith(place: value));
  });
}
}


/// @nodoc
mixin _$Place {

@JsonKey(name: 'place_id') String get placeId; String get name; String get address; double get lat; double get lng;
/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceCopyWith<Place> get copyWith => _$PlaceCopyWithImpl<Place>(this as Place, _$identity);

  /// Serializes this Place to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Place&&(identical(other.placeId, placeId) || other.placeId == placeId)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,placeId,name,address,lat,lng);

@override
String toString() {
  return 'Place(placeId: $placeId, name: $name, address: $address, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $PlaceCopyWith<$Res>  {
  factory $PlaceCopyWith(Place value, $Res Function(Place) _then) = _$PlaceCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'place_id') String placeId, String name, String address, double lat, double lng
});




}
/// @nodoc
class _$PlaceCopyWithImpl<$Res>
    implements $PlaceCopyWith<$Res> {
  _$PlaceCopyWithImpl(this._self, this._then);

  final Place _self;
  final $Res Function(Place) _then;

/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? placeId = null,Object? name = null,Object? address = null,Object? lat = null,Object? lng = null,}) {
  return _then(_self.copyWith(
placeId: null == placeId ? _self.placeId : placeId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Place].
extension PlacePatterns on Place {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Place value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Place() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Place value)  $default,){
final _that = this;
switch (_that) {
case _Place():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Place value)?  $default,){
final _that = this;
switch (_that) {
case _Place() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'place_id')  String placeId,  String name,  String address,  double lat,  double lng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Place() when $default != null:
return $default(_that.placeId,_that.name,_that.address,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'place_id')  String placeId,  String name,  String address,  double lat,  double lng)  $default,) {final _that = this;
switch (_that) {
case _Place():
return $default(_that.placeId,_that.name,_that.address,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'place_id')  String placeId,  String name,  String address,  double lat,  double lng)?  $default,) {final _that = this;
switch (_that) {
case _Place() when $default != null:
return $default(_that.placeId,_that.name,_that.address,_that.lat,_that.lng);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Place implements Place {
  const _Place({@JsonKey(name: 'place_id') this.placeId = '', this.name = '', this.address = '', this.lat = 0.0, this.lng = 0.0});
  factory _Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

@override@JsonKey(name: 'place_id') final  String placeId;
@override@JsonKey() final  String name;
@override@JsonKey() final  String address;
@override@JsonKey() final  double lat;
@override@JsonKey() final  double lng;

/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceCopyWith<_Place> get copyWith => __$PlaceCopyWithImpl<_Place>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Place&&(identical(other.placeId, placeId) || other.placeId == placeId)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,placeId,name,address,lat,lng);

@override
String toString() {
  return 'Place(placeId: $placeId, name: $name, address: $address, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$PlaceCopyWith<$Res> implements $PlaceCopyWith<$Res> {
  factory _$PlaceCopyWith(_Place value, $Res Function(_Place) _then) = __$PlaceCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'place_id') String placeId, String name, String address, double lat, double lng
});




}
/// @nodoc
class __$PlaceCopyWithImpl<$Res>
    implements _$PlaceCopyWith<$Res> {
  __$PlaceCopyWithImpl(this._self, this._then);

  final _Place _self;
  final $Res Function(_Place) _then;

/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? placeId = null,Object? name = null,Object? address = null,Object? lat = null,Object? lng = null,}) {
  return _then(_Place(
placeId: null == placeId ? _self.placeId : placeId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
