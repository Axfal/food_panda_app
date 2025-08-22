import 'package:excellent_trade_app/model/category/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_model.freezed.dart';
part 'restaurant_model.g.dart';

@freezed
class RestaurantModel with _$RestaurantModel {
  const RestaurantModel._(); // 👈 required if you want to add custom getters later

  const factory RestaurantModel({
    @Default(false) @JsonKey(name: 'success') bool success,
    @Default(0) @JsonKey(name: 'count') int count,
    @Default([]) @JsonKey(name: 'restaurants') List<Restaurant> restaurants,
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
  const Restaurant._();

  const factory Restaurant({
    @Default(0) @JsonKey(name: 'id') int id,
    @Default(0) @JsonKey(name: 'owner_id') int ownerId,
    @Default('') @JsonKey(name: 'name') String name,
    @Default('') @JsonKey(name: 'description') String description,
    @Default('') @JsonKey(name: 'phone') String phone,
    @Default('') @JsonKey(name: 'address') String address,
    @JsonKey(name: 'logo') String? logo,
    @Default('') @JsonKey(name: 'status') String status,
    @Default('') @JsonKey(name: 'hours') String hours,
    @Default('') @JsonKey(name: 'rating') String rating,
    @Default('') @JsonKey(name: 'created_at') String createdAt,
    @Default([]) @JsonKey(name: 'categories') List<Categories> categories,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  @override
  // TODO: implement address
  String get address => throw UnimplementedError();

  @override
  // TODO: implement categories
  List<Categories> get categories => throw UnimplementedError();

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
