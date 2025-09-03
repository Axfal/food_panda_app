// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'near_by_restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NearByRestaurant _$NearByRestaurantFromJson(Map<String, dynamic> json) =>
    _NearByRestaurant(
      success: json['success'] as bool? ?? false,
      count: (json['count'] as num?)?.toInt() ?? 0,
      limit: (json['limit'] as num?)?.toInt() ?? 0,
      offset: (json['offset'] as num?)?.toInt() ?? 0,
      radius: (json['radius'] as num?)?.toInt() ?? 0,
      restaurants:
          (json['restaurants'] as List<dynamic>?)
              ?.map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$NearByRestaurantToJson(_NearByRestaurant instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'limit': instance.limit,
      'offset': instance.offset,
      'radius': instance.radius,
      'restaurants': instance.restaurants,
    };

_Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => _Restaurant(
  id: (json['id'] as num?)?.toInt() ?? 0,
  ownerId: (json['owner_id'] as num?)?.toInt() ?? 0,
  name: json['name'] as String? ?? '',
  description: json['description'] as String? ?? '',
  phone: json['phone'] as String? ?? '',
  logo: json['logo'] as String?,
  status: json['status'] as String? ?? '',
  hours: json['hours'] as String? ?? '',
  rating: json['rating'] as String? ?? '0.0',
  createdAt: json['created_at'] as String? ?? '',
  lat: _stringToDouble(json['lat']),
  lng: _stringToDouble(json['lng']),
  distance: (json['distance'] as num?)?.toDouble() ?? 0,
  categories: json['categories'] as List<dynamic>? ?? const [],
  location: json['location'] == null
      ? null
      : Location.fromJson(json['location'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RestaurantToJson(_Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'name': instance.name,
      'description': instance.description,
      'phone': instance.phone,
      'logo': instance.logo,
      'status': instance.status,
      'hours': instance.hours,
      'rating': instance.rating,
      'created_at': instance.createdAt,
      'lat': _doubleToString(instance.lat),
      'lng': _doubleToString(instance.lng),
      'distance': instance.distance,
      'categories': instance.categories,
      'location': instance.location,
    };

_Location _$LocationFromJson(Map<String, dynamic> json) => _Location(
  restaurantId: (json['restaurant_id'] as num?)?.toInt() ?? 0,
  placeId: json['place_id'] as String? ?? '',
  address: json['address'] as String? ?? '',
  lat: _stringToDouble(json['lat']),
  lng: _stringToDouble(json['lng']),
);

Map<String, dynamic> _$LocationToJson(_Location instance) => <String, dynamic>{
  'restaurant_id': instance.restaurantId,
  'place_id': instance.placeId,
  'address': instance.address,
  'lat': _doubleToString(instance.lat),
  'lng': _doubleToString(instance.lng),
};
