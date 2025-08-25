// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_by_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RestaurantByCategory _$RestaurantByCategoryFromJson(
  Map<String, dynamic> json,
) => _RestaurantByCategory(
  success: json['success'] as bool,
  category: CategoryData.fromJson(json['category'] as Map<String, dynamic>),
  restaurants: (json['restaurants'] as List<dynamic>)
      .map((e) => RestaurantData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RestaurantByCategoryToJson(
  _RestaurantByCategory instance,
) => <String, dynamic>{
  'success': instance.success,
  'category': instance.category,
  'restaurants': instance.restaurants,
};

_CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) =>
    _CategoryData(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$CategoryDataToJson(_CategoryData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };

_RestaurantData _$RestaurantDataFromJson(Map<String, dynamic> json) =>
    _RestaurantData(
      restaurantId: (json['restaurant_id'] as num).toInt(),
      restaurantName: json['restaurant_name'] as String,
      restaurantLogo: json['restaurant_logo'] as String?,
    );

Map<String, dynamic> _$RestaurantDataToJson(_RestaurantData instance) =>
    <String, dynamic>{
      'restaurant_id': instance.restaurantId,
      'restaurant_name': instance.restaurantName,
      'restaurant_logo': instance.restaurantLogo,
    };
