// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuCategoryModel _$MenuCategoryModelFromJson(Map<String, dynamic> json) =>
    _MenuCategoryModel(
      success: json['success'] as bool? ?? false,
      count: (json['count'] as num?)?.toInt() ?? 0,
      error: json['error'] as String? ?? '',
      categories:
          (json['categories'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MenuCategoryModelToJson(_MenuCategoryModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'error': instance.error,
      'categories': instance.categories,
    };

_Category _$CategoryFromJson(Map<String, dynamic> json) => _Category(
  id: (json['id'] as num?)?.toInt() ?? 0,
  restaurantId: (json['restaurant_id'] as num?)?.toInt() ?? 0,
  name: json['name'] as String? ?? '',
  photo: json['photo'] as String? ?? '',
);

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
  'id': instance.id,
  'restaurant_id': instance.restaurantId,
  'name': instance.name,
  'photo': instance.photo,
};
