// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuItemModel _$MenuItemModelFromJson(Map<String, dynamic> json) =>
    _MenuItemModel(
      success: json['success'] as bool? ?? false,
      count: (json['count'] as num?)?.toInt() ?? 0,
      error: json['error'] as String? ?? '',
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Item>[],
    );

Map<String, dynamic> _$MenuItemModelToJson(_MenuItemModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'error': instance.error,
      'items': instance.items,
    };

_Item _$ItemFromJson(Map<String, dynamic> json) => _Item(
  id: (json['id'] as num?)?.toInt() ?? 0,
  restaurantId: (json['restaurant_id'] as num?)?.toInt() ?? 0,
  categoryId: (json['category_id'] as num?)?.toInt() ?? 0,
  name: json['name'] as String? ?? '',
  description: json['description'] as String? ?? '',
  price: json['price'] as String? ?? '0.00',
  photo: json['photo'] as String? ?? '',
  status: json['status'] as String? ?? '',
  variations:
      (json['variations'] as List<dynamic>?)
          ?.map((e) => Variation.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Variation>[],
);

Map<String, dynamic> _$ItemToJson(_Item instance) => <String, dynamic>{
  'id': instance.id,
  'restaurant_id': instance.restaurantId,
  'category_id': instance.categoryId,
  'name': instance.name,
  'description': instance.description,
  'price': instance.price,
  'photo': instance.photo,
  'status': instance.status,
  'variations': instance.variations,
};

_Variation _$VariationFromJson(Map<String, dynamic> json) => _Variation(
  id: (json['id'] as num?)?.toInt() ?? 0,
  name: json['name'] as String? ?? '',
  price: json['price'] as String? ?? '0.00',
);

Map<String, dynamic> _$VariationToJson(_Variation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };
