// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchModel {

@JsonKey(name: "success") bool get success;@JsonKey(name: 'query') String get query;@JsonKey(name: 'count') int get count;@JsonKey(name: 'results') List<Results> get results;
/// Create a copy of SearchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchModelCopyWith<SearchModel> get copyWith => _$SearchModelCopyWithImpl<SearchModel>(this as SearchModel, _$identity);

  /// Serializes this SearchModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchModel&&(identical(other.success, success) || other.success == success)&&(identical(other.query, query) || other.query == query)&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,query,count,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'SearchModel(success: $success, query: $query, count: $count, results: $results)';
}


}

/// @nodoc
abstract mixin class $SearchModelCopyWith<$Res>  {
  factory $SearchModelCopyWith(SearchModel value, $Res Function(SearchModel) _then) = _$SearchModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "success") bool success,@JsonKey(name: 'query') String query,@JsonKey(name: 'count') int count,@JsonKey(name: 'results') List<Results> results
});




}
/// @nodoc
class _$SearchModelCopyWithImpl<$Res>
    implements $SearchModelCopyWith<$Res> {
  _$SearchModelCopyWithImpl(this._self, this._then);

  final SearchModel _self;
  final $Res Function(SearchModel) _then;

/// Create a copy of SearchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? query = null,Object? count = null,Object? results = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<Results>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchModel].
extension SearchModelPatterns on SearchModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchModel value)  $default,){
final _that = this;
switch (_that) {
case _SearchModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchModel value)?  $default,){
final _that = this;
switch (_that) {
case _SearchModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool success, @JsonKey(name: 'query')  String query, @JsonKey(name: 'count')  int count, @JsonKey(name: 'results')  List<Results> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchModel() when $default != null:
return $default(_that.success,_that.query,_that.count,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool success, @JsonKey(name: 'query')  String query, @JsonKey(name: 'count')  int count, @JsonKey(name: 'results')  List<Results> results)  $default,) {final _that = this;
switch (_that) {
case _SearchModel():
return $default(_that.success,_that.query,_that.count,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "success")  bool success, @JsonKey(name: 'query')  String query, @JsonKey(name: 'count')  int count, @JsonKey(name: 'results')  List<Results> results)?  $default,) {final _that = this;
switch (_that) {
case _SearchModel() when $default != null:
return $default(_that.success,_that.query,_that.count,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchModel implements SearchModel {
  const _SearchModel({@JsonKey(name: "success") this.success = false, @JsonKey(name: 'query') this.query = '', @JsonKey(name: 'count') this.count = 0, @JsonKey(name: 'results') final  List<Results> results = const []}): _results = results;
  factory _SearchModel.fromJson(Map<String, dynamic> json) => _$SearchModelFromJson(json);

@override@JsonKey(name: "success") final  bool success;
@override@JsonKey(name: 'query') final  String query;
@override@JsonKey(name: 'count') final  int count;
 final  List<Results> _results;
@override@JsonKey(name: 'results') List<Results> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of SearchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchModelCopyWith<_SearchModel> get copyWith => __$SearchModelCopyWithImpl<_SearchModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchModel&&(identical(other.success, success) || other.success == success)&&(identical(other.query, query) || other.query == query)&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,query,count,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'SearchModel(success: $success, query: $query, count: $count, results: $results)';
}


}

/// @nodoc
abstract mixin class _$SearchModelCopyWith<$Res> implements $SearchModelCopyWith<$Res> {
  factory _$SearchModelCopyWith(_SearchModel value, $Res Function(_SearchModel) _then) = __$SearchModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "success") bool success,@JsonKey(name: 'query') String query,@JsonKey(name: 'count') int count,@JsonKey(name: 'results') List<Results> results
});




}
/// @nodoc
class __$SearchModelCopyWithImpl<$Res>
    implements _$SearchModelCopyWith<$Res> {
  __$SearchModelCopyWithImpl(this._self, this._then);

  final _SearchModel _self;
  final $Res Function(_SearchModel) _then;

/// Create a copy of SearchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? query = null,Object? count = null,Object? results = null,}) {
  return _then(_SearchModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<Results>,
  ));
}


}


/// @nodoc
mixin _$Results {

@JsonKey(name: 'restaurant_id') int get restaurantId;@JsonKey(name: 'restaurant_name') String get restaurantName;@JsonKey(name: 'lat') String get lat;@JsonKey(name: 'lng') String get lng;@JsonKey(name: 'matched_item') String get matchedItem;@JsonKey(name: 'matched_category') String get matchedCategory;
/// Create a copy of Results
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultsCopyWith<Results> get copyWith => _$ResultsCopyWithImpl<Results>(this as Results, _$identity);

  /// Serializes this Results to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Results&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.restaurantName, restaurantName) || other.restaurantName == restaurantName)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.matchedItem, matchedItem) || other.matchedItem == matchedItem)&&(identical(other.matchedCategory, matchedCategory) || other.matchedCategory == matchedCategory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,restaurantId,restaurantName,lat,lng,matchedItem,matchedCategory);

@override
String toString() {
  return 'Results(restaurantId: $restaurantId, restaurantName: $restaurantName, lat: $lat, lng: $lng, matchedItem: $matchedItem, matchedCategory: $matchedCategory)';
}


}

/// @nodoc
abstract mixin class $ResultsCopyWith<$Res>  {
  factory $ResultsCopyWith(Results value, $Res Function(Results) _then) = _$ResultsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'restaurant_id') int restaurantId,@JsonKey(name: 'restaurant_name') String restaurantName,@JsonKey(name: 'lat') String lat,@JsonKey(name: 'lng') String lng,@JsonKey(name: 'matched_item') String matchedItem,@JsonKey(name: 'matched_category') String matchedCategory
});




}
/// @nodoc
class _$ResultsCopyWithImpl<$Res>
    implements $ResultsCopyWith<$Res> {
  _$ResultsCopyWithImpl(this._self, this._then);

  final Results _self;
  final $Res Function(Results) _then;

/// Create a copy of Results
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? restaurantId = null,Object? restaurantName = null,Object? lat = null,Object? lng = null,Object? matchedItem = null,Object? matchedCategory = null,}) {
  return _then(_self.copyWith(
restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as int,restaurantName: null == restaurantName ? _self.restaurantName : restaurantName // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as String,matchedItem: null == matchedItem ? _self.matchedItem : matchedItem // ignore: cast_nullable_to_non_nullable
as String,matchedCategory: null == matchedCategory ? _self.matchedCategory : matchedCategory // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Results].
extension ResultsPatterns on Results {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Results value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Results() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Results value)  $default,){
final _that = this;
switch (_that) {
case _Results():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Results value)?  $default,){
final _that = this;
switch (_that) {
case _Results() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'restaurant_id')  int restaurantId, @JsonKey(name: 'restaurant_name')  String restaurantName, @JsonKey(name: 'lat')  String lat, @JsonKey(name: 'lng')  String lng, @JsonKey(name: 'matched_item')  String matchedItem, @JsonKey(name: 'matched_category')  String matchedCategory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Results() when $default != null:
return $default(_that.restaurantId,_that.restaurantName,_that.lat,_that.lng,_that.matchedItem,_that.matchedCategory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'restaurant_id')  int restaurantId, @JsonKey(name: 'restaurant_name')  String restaurantName, @JsonKey(name: 'lat')  String lat, @JsonKey(name: 'lng')  String lng, @JsonKey(name: 'matched_item')  String matchedItem, @JsonKey(name: 'matched_category')  String matchedCategory)  $default,) {final _that = this;
switch (_that) {
case _Results():
return $default(_that.restaurantId,_that.restaurantName,_that.lat,_that.lng,_that.matchedItem,_that.matchedCategory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'restaurant_id')  int restaurantId, @JsonKey(name: 'restaurant_name')  String restaurantName, @JsonKey(name: 'lat')  String lat, @JsonKey(name: 'lng')  String lng, @JsonKey(name: 'matched_item')  String matchedItem, @JsonKey(name: 'matched_category')  String matchedCategory)?  $default,) {final _that = this;
switch (_that) {
case _Results() when $default != null:
return $default(_that.restaurantId,_that.restaurantName,_that.lat,_that.lng,_that.matchedItem,_that.matchedCategory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Results implements Results {
  const _Results({@JsonKey(name: 'restaurant_id') this.restaurantId = 0, @JsonKey(name: 'restaurant_name') this.restaurantName = '', @JsonKey(name: 'lat') this.lat = '', @JsonKey(name: 'lng') this.lng = '', @JsonKey(name: 'matched_item') this.matchedItem = '', @JsonKey(name: 'matched_category') this.matchedCategory = ''});
  factory _Results.fromJson(Map<String, dynamic> json) => _$ResultsFromJson(json);

@override@JsonKey(name: 'restaurant_id') final  int restaurantId;
@override@JsonKey(name: 'restaurant_name') final  String restaurantName;
@override@JsonKey(name: 'lat') final  String lat;
@override@JsonKey(name: 'lng') final  String lng;
@override@JsonKey(name: 'matched_item') final  String matchedItem;
@override@JsonKey(name: 'matched_category') final  String matchedCategory;

/// Create a copy of Results
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultsCopyWith<_Results> get copyWith => __$ResultsCopyWithImpl<_Results>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResultsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Results&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.restaurantName, restaurantName) || other.restaurantName == restaurantName)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.matchedItem, matchedItem) || other.matchedItem == matchedItem)&&(identical(other.matchedCategory, matchedCategory) || other.matchedCategory == matchedCategory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,restaurantId,restaurantName,lat,lng,matchedItem,matchedCategory);

@override
String toString() {
  return 'Results(restaurantId: $restaurantId, restaurantName: $restaurantName, lat: $lat, lng: $lng, matchedItem: $matchedItem, matchedCategory: $matchedCategory)';
}


}

/// @nodoc
abstract mixin class _$ResultsCopyWith<$Res> implements $ResultsCopyWith<$Res> {
  factory _$ResultsCopyWith(_Results value, $Res Function(_Results) _then) = __$ResultsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'restaurant_id') int restaurantId,@JsonKey(name: 'restaurant_name') String restaurantName,@JsonKey(name: 'lat') String lat,@JsonKey(name: 'lng') String lng,@JsonKey(name: 'matched_item') String matchedItem,@JsonKey(name: 'matched_category') String matchedCategory
});




}
/// @nodoc
class __$ResultsCopyWithImpl<$Res>
    implements _$ResultsCopyWith<$Res> {
  __$ResultsCopyWithImpl(this._self, this._then);

  final _Results _self;
  final $Res Function(_Results) _then;

/// Create a copy of Results
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? restaurantId = null,Object? restaurantName = null,Object? lat = null,Object? lng = null,Object? matchedItem = null,Object? matchedCategory = null,}) {
  return _then(_Results(
restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as int,restaurantName: null == restaurantName ? _self.restaurantName : restaurantName // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as String,matchedItem: null == matchedItem ? _self.matchedItem : matchedItem // ignore: cast_nullable_to_non_nullable
as String,matchedCategory: null == matchedCategory ? _self.matchedCategory : matchedCategory // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
