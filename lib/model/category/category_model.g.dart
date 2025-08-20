// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoriesModel _$CategoriesModelFromJson(Map<String, dynamic> json) =>
    _CategoriesModel(
      success: json['success'] as bool? ?? false,
      error: json['error'] as String? ?? '',
      categories:
          (json['categories'] as List<dynamic>?)
              ?.map((e) => Categories.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CategoriesModelToJson(_CategoriesModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'categories': instance.categories,
    };

_Categories _$CategoriesFromJson(Map<String, dynamic> json) => _Categories(
  id: (json['id'] as num?)?.toInt() ?? 0,
  name: json['name'] as String? ?? '',
  image_url: json['image_url'] as String? ?? '',
);

Map<String, dynamic> _$CategoriesToJson(_Categories instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.image_url,
    };
