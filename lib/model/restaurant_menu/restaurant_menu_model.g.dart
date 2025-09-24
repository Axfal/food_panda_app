// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RestaurantMenuModel _$RestaurantMenuModelFromJson(Map<String, dynamic> json) =>
    _RestaurantMenuModel(
      success: json['success'] as bool? ?? false,
      restaurant: Restaurant.fromJson(
        json['restaurant'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$RestaurantMenuModelToJson(
  _RestaurantMenuModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'restaurant': instance.restaurant,
};

_Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => _Restaurant(
  restaurantId: (json['restaurant_id'] as num?)?.toInt() ?? 0,
  restaurantName: json['restaurant_name'] as String? ?? '',
  restaurantLogo: json['restaurant_logo'] as String? ?? '',
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => MenuCategory.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$RestaurantToJson(_Restaurant instance) =>
    <String, dynamic>{
      'restaurant_id': instance.restaurantId,
      'restaurant_name': instance.restaurantName,
      'restaurant_logo': instance.restaurantLogo,
      'categories': instance.categories,
    };

_MenuCategory _$MenuCategoryFromJson(Map<String, dynamic> json) =>
    _MenuCategory(
      categoryId: (json['category_id'] as num?)?.toInt() ?? 0,
      categoryName: json['category_name'] as String? ?? '',
      categoryPhoto: json['category_photo'] as String? ?? '',
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => MenuItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MenuCategoryToJson(_MenuCategory instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'category_photo': instance.categoryPhoto,
      'items': instance.items,
    };

_MenuItem _$MenuItemFromJson(Map<String, dynamic> json) => _MenuItem(
  itemId: (json['item_id'] as num?)?.toInt() ?? 0,
  itemName: json['item_name'] as String? ?? '',
  itemDescription: json['item_description'] as String? ?? '',
  itemPrice: json['item_price'] as String? ?? '0.0',
  itemPhoto: json['item_photo'] as String? ?? '',
  itemStatus: json['item_status'] as String? ?? 'unavailable',
);

Map<String, dynamic> _$MenuItemToJson(_MenuItem instance) => <String, dynamic>{
  'item_id': instance.itemId,
  'item_name': instance.itemName,
  'item_description': instance.itemDescription,
  'item_price': instance.itemPrice,
  'item_photo': instance.itemPhoto,
  'item_status': instance.itemStatus,
};
