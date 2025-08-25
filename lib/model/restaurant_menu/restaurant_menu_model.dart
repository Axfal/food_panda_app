import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_menu_model.freezed.dart';
part 'restaurant_menu_model.g.dart';

@freezed
class RestaurantMenuModel with _$RestaurantMenuModel {
  const factory RestaurantMenuModel({
    required bool success,
    required Restaurant restaurant,
  }) = _RestaurantMenuModel;

  factory RestaurantMenuModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantMenuModelFromJson(json);

  @override
  // TODO: implement restaurant
  Restaurant get restaurant => throw UnimplementedError();

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
    @JsonKey(name: 'restaurant_id') required int restaurantId,
    @JsonKey(name: 'restaurant_name') required String restaurantName,
    @JsonKey(name: 'restaurant_logo') String? restaurantLogo,
    required List<MenuCategory> categories,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  @override
  // TODO: implement categories
  List<MenuCategory> get categories => throw UnimplementedError();

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

@freezed
class MenuCategory with _$MenuCategory {
  const factory MenuCategory({
    @JsonKey(name: 'category_id') required int categoryId,
    @JsonKey(name: 'category_name') required String categoryName,
    @JsonKey(name: 'category_photo') required String? categoryPhoto,
    required List<MenuItem> items,
  }) = _MenuCategory;

  factory MenuCategory.fromJson(Map<String, dynamic> json) =>
      _$MenuCategoryFromJson(json);

  @override
  // TODO: implement categoryId
  int get categoryId => throw UnimplementedError();

  @override
  // TODO: implement categoryName
  String get categoryName => throw UnimplementedError();

  @override
  // TODO: implement categoryPhoto
  String? get categoryPhoto => throw UnimplementedError();

  @override
  // TODO: implement items
  List<MenuItem> get items => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

@freezed
class MenuItem with _$MenuItem {
  const factory MenuItem({
    @JsonKey(name: 'item_id') required int itemId,
    @JsonKey(name: 'item_name') required String itemName,
    @JsonKey(name: 'item_description') required String itemDescription,
    @JsonKey(name: 'item_price') required String itemPrice,
    @JsonKey(name: 'item_photo') String? itemPhoto,
    @JsonKey(name: 'item_status') required String itemStatus,
  }) = _MenuItem;

  factory MenuItem.fromJson(Map<String, dynamic> json) =>
      _$MenuItemFromJson(json);

  @override
  // TODO: implement itemDescription
  String get itemDescription => throw UnimplementedError();

  @override
  // TODO: implement itemId
  int get itemId => throw UnimplementedError();

  @override
  // TODO: implement itemName
  String get itemName => throw UnimplementedError();

  @override
  // TODO: implement itemPhoto
  String? get itemPhoto => throw UnimplementedError();

  @override
  // TODO: implement itemPrice
  String get itemPrice => throw UnimplementedError();

  @override
  // TODO: implement itemStatus
  String get itemStatus => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
