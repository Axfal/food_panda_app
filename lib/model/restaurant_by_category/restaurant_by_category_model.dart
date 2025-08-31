import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_by_category_model.freezed.dart';
part 'restaurant_by_category_model.g.dart';

@freezed
class RestaurantByCategory with _$RestaurantByCategory {
  const factory RestaurantByCategory({
    required bool success,
    required CategoryData category,
    required List<RestaurantData> restaurants,
  }) = _RestaurantByCategory;

  factory RestaurantByCategory.fromJson(Map<String, dynamic> json) =>
      _$RestaurantByCategoryFromJson(json);

  @override
  // TODO: implement category
  CategoryData get category => throw UnimplementedError();

  @override
  // TODO: implement restaurants
  List<RestaurantData> get restaurants => throw UnimplementedError();

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
class CategoryData with _$CategoryData {
  const factory CategoryData({
    required int id,
    required String name,
    required String image,
  }) = _CategoryData;

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);

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
class RestaurantData with _$RestaurantData {
  const factory RestaurantData({
    @JsonKey(name: 'restaurant_id') required int restaurantId,
    @JsonKey(name: 'restaurant_name') required String restaurantName,
    @JsonKey(name: 'restaurant_logo') String? restaurantLogo,
  }) = _RestaurantData;

  factory RestaurantData.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDataFromJson(json);

  @override
  // TODO: implement restaurantId
  int get restaurantId => throw UnimplementedError();

  @override
  // TODO: implement restaurantLogo
  String? get restaurantLogo => throw UnimplementedError();

  @override
  // TODO: implement restaurantName
  String get restaurantName => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

}
