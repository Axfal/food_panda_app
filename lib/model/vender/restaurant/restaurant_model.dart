import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_model.freezed.dart';
part 'restaurant_model.g.dart';

@freezed
class RestaurantModel with _$RestaurantModel {
  const factory RestaurantModel({
    @JsonKey(name: 'success') required bool success,
    @JsonKey(name: 'count') required int count,
    @JsonKey(name: 'restaurants') required List<Restaurant> restaurants,
  }) = _RestaurantModel;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);

  @override
  // TODO: implement count
  int get count => throw UnimplementedError();

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
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'owner_id') required int ownerId,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'phone') required String phone,
    @JsonKey(name: 'logo') String? logo,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'hours') required String hours,
    @JsonKey(name: 'rating') required String rating,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'categories') required List<Category> categories,
    @JsonKey(name: 'location') required Location location,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  @override
  // TODO: implement categories
  List<Category> get categories => throw UnimplementedError();

  @override
  // TODO: implement createdAt
  String get createdAt => throw UnimplementedError();

  @override
  // TODO: implement description
  String get description => throw UnimplementedError();

  @override
  // TODO: implement hours
  String get hours => throw UnimplementedError();

  @override
  // TODO: implement id
  int get id => throw UnimplementedError();

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
class Category with _$Category {
  const factory Category({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'image') required String image,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  @override
  // TODO: implement id
  int get id => throw UnimplementedError();

  @override
  // TODO: implement image
  String get image => throw UnimplementedError();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

}

@freezed
class Location with _$Location {
  const factory Location({
    @JsonKey(name: 'restaurant_id') required int restaurantId,
    @JsonKey(name: 'place_id') required String placeId,
    @JsonKey(name: 'address') required String address,
    @JsonKey(name: 'lat') required String lat,
    @JsonKey(name: 'lng') required String lng,
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
