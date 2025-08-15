// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RestaurantModel _$RestaurantModelFromJson(Map<String, dynamic> json) =>
    _RestaurantModel(
      success: json['success'] as bool? ?? false,
      count: (json['count'] as num?)?.toInt() ?? 0,
      restaurants:
          (json['restaurants'] as List<dynamic>?)
              ?.map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RestaurantModelToJson(_RestaurantModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'restaurants': instance.restaurants,
    };

_Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => _Restaurant(
  id: (json['id'] as num?)?.toInt() ?? 0,
  ownerId: (json['owner_id'] as num?)?.toInt() ?? 0,
  name: json['name'] as String? ?? '',
  description: json['description'] as String? ?? '',
  phone: json['phone'] as String? ?? '',
  address: json['address'] as String? ?? '',
  logo: json['logo'] as String?,
  status: json['status'] as String? ?? '',
  hours: json['hours'] as String? ?? '',
  rating: json['rating'] as String? ?? '',
  createdAt: json['created_at'] as String? ?? '',
);

Map<String, dynamic> _$RestaurantToJson(_Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'name': instance.name,
      'description': instance.description,
      'phone': instance.phone,
      'address': instance.address,
      'logo': instance.logo,
      'status': instance.status,
      'hours': instance.hours,
      'rating': instance.rating,
      'created_at': instance.createdAt,
    };
