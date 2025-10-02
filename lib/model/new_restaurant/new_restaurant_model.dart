import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_restaurant_model.freezed.dart';
part 'new_restaurant_model.g.dart';

@freezed
class NewRestaurantModel with _$NewRestaurantModel {
  const factory NewRestaurantModel({
    @Default(false) @JsonKey(name: 'success') bool success,
    @Default(0) @JsonKey(name: 'count') int count,
    @Default(0) @JsonKey(name: 'limit') int limit,
    @Default(0) @JsonKey(name: 'offset') int offset,
    @Default(0) @JsonKey(name: 'radius') int radius,
    @Default([]) @JsonKey(name: 'restaurants') List<Restaurant> restaurants,
  }) = _NewRestaurantModel;

  factory NewRestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$NewRestaurantModelFromJson(json);

  @override
  // TODO: implement count
  int get count => throw UnimplementedError();

  @override
  // TODO: implement limit
  int get limit => throw UnimplementedError();

  @override
  // TODO: implement offset
  int get offset => throw UnimplementedError();

  @override
  // TODO: implement radius
  int get radius => throw UnimplementedError();

  @override
  // TODO: implement restaurants
  List<Restaurant> get restaurants => throw UnimplementedError();

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
class Restaurant with _$Restaurant {
  const factory Restaurant({
    @Default(0) @JsonKey(name: 'id') int id,
    @Default(0) @JsonKey(name: 'owner_id') int ownerId,
    @Default('') @JsonKey(name: 'name') String name,
    @Default('') @JsonKey(name: 'description') String description,
    @Default('') @JsonKey(name: 'phone') String phone,
    @Default('') @JsonKey(name: 'logo') String? logo,
    @Default('') @JsonKey(name: 'status') String status,
    @Default('') @JsonKey(name: 'hours') String hours,
    @Default('0.0') @JsonKey(name: 'rating') String rating,
    @Default('') @JsonKey(name: 'created_at') String createdAt,
    @Default('') @JsonKey(name: 'lat') String lat,
    @Default('') @JsonKey(name: 'lng') String lng,
    @Default(0) @JsonKey(name: 'distance') int distance,
    @Default([]) @JsonKey(name: 'categories') List<dynamic> categories,
    @Default(Location()) @JsonKey(name: 'location') Location location,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  @override
  // TODO: implement categories
  List get categories => throw UnimplementedError();

  @override
  // TODO: implement createdAt
  String get createdAt => throw UnimplementedError();

  @override
  // TODO: implement description
  String get description => throw UnimplementedError();

  @override
  // TODO: implement distance
  int get distance => throw UnimplementedError();

  @override
  // TODO: implement hours
  String get hours => throw UnimplementedError();

  @override
  // TODO: implement id
  int get id => throw UnimplementedError();

  @override
  // TODO: implement lat
  String get lat => throw UnimplementedError();

  @override
  // TODO: implement lng
  String get lng => throw UnimplementedError();

  @override
  // TODO: implement location
  Location get location => throw UnimplementedError();

  @override
  // TODO: implement logo
  String? get logo => throw UnimplementedError();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement ownerId
  int get ownerId => throw UnimplementedError();

  @override
  // TODO: implement phone
  String get phone => throw UnimplementedError();

  @override
  // TODO: implement rating
  String get rating => throw UnimplementedError();

  @override
  // TODO: implement status
  String get status => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

}

@freezed
class Location with _$Location {
  const factory Location({
    @Default(0) @JsonKey(name: 'restaurant_id') int restaurantId,
    @Default('') @JsonKey(name: 'place_id') String placeId,
    @Default('') @JsonKey(name: 'address') String address,
    @Default('') @JsonKey(name: 'lat') String lat,
    @Default('') @JsonKey(name: 'lng') String lng,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  @override
  // TODO: implement address
  String get address => throw UnimplementedError();

  @override
  // TODO: implement lat
  String get lat => throw UnimplementedError();

  @override
  // TODO: implement lng
  String get lng => throw UnimplementedError();

  @override
  // TODO: implement placeId
  String get placeId => throw UnimplementedError();

  @override
  // TODO: implement restaurantId
  int get restaurantId => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }


}
