// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_suggestion_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationSuggestionModel {

@JsonKey(name: 'success') bool get success;@JsonKey(name: 'query') String get query;@JsonKey(name: 'suggestions') List<Suggestion> get suggestions;
/// Create a copy of LocationSuggestionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationSuggestionModelCopyWith<LocationSuggestionModel> get copyWith => _$LocationSuggestionModelCopyWithImpl<LocationSuggestionModel>(this as LocationSuggestionModel, _$identity);

  /// Serializes this LocationSuggestionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationSuggestionModel&&(identical(other.success, success) || other.success == success)&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other.suggestions, suggestions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,query,const DeepCollectionEquality().hash(suggestions));

@override
String toString() {
  return 'LocationSuggestionModel(success: $success, query: $query, suggestions: $suggestions)';
}


}

/// @nodoc
abstract mixin class $LocationSuggestionModelCopyWith<$Res>  {
  factory $LocationSuggestionModelCopyWith(LocationSuggestionModel value, $Res Function(LocationSuggestionModel) _then) = _$LocationSuggestionModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'success') bool success,@JsonKey(name: 'query') String query,@JsonKey(name: 'suggestions') List<Suggestion> suggestions
});




}
/// @nodoc
class _$LocationSuggestionModelCopyWithImpl<$Res>
    implements $LocationSuggestionModelCopyWith<$Res> {
  _$LocationSuggestionModelCopyWithImpl(this._self, this._then);

  final LocationSuggestionModel _self;
  final $Res Function(LocationSuggestionModel) _then;

/// Create a copy of LocationSuggestionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? query = null,Object? suggestions = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,suggestions: null == suggestions ? _self.suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<Suggestion>,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationSuggestionModel].
extension LocationSuggestionModelPatterns on LocationSuggestionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationSuggestionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationSuggestionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationSuggestionModel value)  $default,){
final _that = this;
switch (_that) {
case _LocationSuggestionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationSuggestionModel value)?  $default,){
final _that = this;
switch (_that) {
case _LocationSuggestionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool success, @JsonKey(name: 'query')  String query, @JsonKey(name: 'suggestions')  List<Suggestion> suggestions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationSuggestionModel() when $default != null:
return $default(_that.success,_that.query,_that.suggestions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool success, @JsonKey(name: 'query')  String query, @JsonKey(name: 'suggestions')  List<Suggestion> suggestions)  $default,) {final _that = this;
switch (_that) {
case _LocationSuggestionModel():
return $default(_that.success,_that.query,_that.suggestions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'success')  bool success, @JsonKey(name: 'query')  String query, @JsonKey(name: 'suggestions')  List<Suggestion> suggestions)?  $default,) {final _that = this;
switch (_that) {
case _LocationSuggestionModel() when $default != null:
return $default(_that.success,_that.query,_that.suggestions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocationSuggestionModel implements LocationSuggestionModel {
  const _LocationSuggestionModel({@JsonKey(name: 'success') this.success = false, @JsonKey(name: 'query') this.query = '', @JsonKey(name: 'suggestions') final  List<Suggestion> suggestions = const []}): _suggestions = suggestions;
  factory _LocationSuggestionModel.fromJson(Map<String, dynamic> json) => _$LocationSuggestionModelFromJson(json);

@override@JsonKey(name: 'success') final  bool success;
@override@JsonKey(name: 'query') final  String query;
 final  List<Suggestion> _suggestions;
@override@JsonKey(name: 'suggestions') List<Suggestion> get suggestions {
  if (_suggestions is EqualUnmodifiableListView) return _suggestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suggestions);
}


/// Create a copy of LocationSuggestionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationSuggestionModelCopyWith<_LocationSuggestionModel> get copyWith => __$LocationSuggestionModelCopyWithImpl<_LocationSuggestionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationSuggestionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationSuggestionModel&&(identical(other.success, success) || other.success == success)&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other._suggestions, _suggestions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,query,const DeepCollectionEquality().hash(_suggestions));

@override
String toString() {
  return 'LocationSuggestionModel(success: $success, query: $query, suggestions: $suggestions)';
}


}

/// @nodoc
abstract mixin class _$LocationSuggestionModelCopyWith<$Res> implements $LocationSuggestionModelCopyWith<$Res> {
  factory _$LocationSuggestionModelCopyWith(_LocationSuggestionModel value, $Res Function(_LocationSuggestionModel) _then) = __$LocationSuggestionModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'success') bool success,@JsonKey(name: 'query') String query,@JsonKey(name: 'suggestions') List<Suggestion> suggestions
});




}
/// @nodoc
class __$LocationSuggestionModelCopyWithImpl<$Res>
    implements _$LocationSuggestionModelCopyWith<$Res> {
  __$LocationSuggestionModelCopyWithImpl(this._self, this._then);

  final _LocationSuggestionModel _self;
  final $Res Function(_LocationSuggestionModel) _then;

/// Create a copy of LocationSuggestionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? query = null,Object? suggestions = null,}) {
  return _then(_LocationSuggestionModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,suggestions: null == suggestions ? _self._suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<Suggestion>,
  ));
}


}


/// @nodoc
mixin _$Suggestion {

@JsonKey(name: 'place_id') String get placeId;@JsonKey(name: 'description') String get description;
/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuggestionCopyWith<Suggestion> get copyWith => _$SuggestionCopyWithImpl<Suggestion>(this as Suggestion, _$identity);

  /// Serializes this Suggestion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Suggestion&&(identical(other.placeId, placeId) || other.placeId == placeId)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,placeId,description);

@override
String toString() {
  return 'Suggestion(placeId: $placeId, description: $description)';
}


}

/// @nodoc
abstract mixin class $SuggestionCopyWith<$Res>  {
  factory $SuggestionCopyWith(Suggestion value, $Res Function(Suggestion) _then) = _$SuggestionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'place_id') String placeId,@JsonKey(name: 'description') String description
});




}
/// @nodoc
class _$SuggestionCopyWithImpl<$Res>
    implements $SuggestionCopyWith<$Res> {
  _$SuggestionCopyWithImpl(this._self, this._then);

  final Suggestion _self;
  final $Res Function(Suggestion) _then;

/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? placeId = null,Object? description = null,}) {
  return _then(_self.copyWith(
placeId: null == placeId ? _self.placeId : placeId // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Suggestion].
extension SuggestionPatterns on Suggestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Suggestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Suggestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Suggestion value)  $default,){
final _that = this;
switch (_that) {
case _Suggestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Suggestion value)?  $default,){
final _that = this;
switch (_that) {
case _Suggestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'place_id')  String placeId, @JsonKey(name: 'description')  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Suggestion() when $default != null:
return $default(_that.placeId,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'place_id')  String placeId, @JsonKey(name: 'description')  String description)  $default,) {final _that = this;
switch (_that) {
case _Suggestion():
return $default(_that.placeId,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'place_id')  String placeId, @JsonKey(name: 'description')  String description)?  $default,) {final _that = this;
switch (_that) {
case _Suggestion() when $default != null:
return $default(_that.placeId,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Suggestion implements Suggestion {
  const _Suggestion({@JsonKey(name: 'place_id') this.placeId = '', @JsonKey(name: 'description') this.description = ''});
  factory _Suggestion.fromJson(Map<String, dynamic> json) => _$SuggestionFromJson(json);

@override@JsonKey(name: 'place_id') final  String placeId;
@override@JsonKey(name: 'description') final  String description;

/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuggestionCopyWith<_Suggestion> get copyWith => __$SuggestionCopyWithImpl<_Suggestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SuggestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Suggestion&&(identical(other.placeId, placeId) || other.placeId == placeId)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,placeId,description);

@override
String toString() {
  return 'Suggestion(placeId: $placeId, description: $description)';
}


}

/// @nodoc
abstract mixin class _$SuggestionCopyWith<$Res> implements $SuggestionCopyWith<$Res> {
  factory _$SuggestionCopyWith(_Suggestion value, $Res Function(_Suggestion) _then) = __$SuggestionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'place_id') String placeId,@JsonKey(name: 'description') String description
});




}
/// @nodoc
class __$SuggestionCopyWithImpl<$Res>
    implements _$SuggestionCopyWith<$Res> {
  __$SuggestionCopyWithImpl(this._self, this._then);

  final _Suggestion _self;
  final $Res Function(_Suggestion) _then;

/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? placeId = null,Object? description = null,}) {
  return _then(_Suggestion(
placeId: null == placeId ? _self.placeId : placeId // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
