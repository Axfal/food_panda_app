// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RestaurantModel _$RestaurantModelFromJson(Map<String, dynamic> json) =>
    _RestaurantModel(
      success: json['success'] as bool,
      count: (json['count'] as num).toInt(),
      restaurants: (json['restaurants'] as List<dynamic>)
          .map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurantModelToJson(_RestaurantModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'restaurants': instance.restaurants,
    };

_Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => _Restaurant(
  id: (json['id'] as num).toInt(),
  ownerId: (json['owner_id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  phone: json['phone'] as String,
  logo: json['logo'] as String?,
  status: json['status'] as String,
  hours: json['hours'] as String,
  rating: json['rating'] as String,
  createdAt: json['created_at'] as String,
  categories: (json['categories'] as List<dynamic>)
      .map((e) => Category.fromJson(e as Map<String, dynamic>))
      .toList(),
  location: Location.fromJson(json['location'] as Map<String, dynamic>),
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
      'categories': instance.categories,
      'location': instance.location,
    };

_Category _$CategoryFromJson(Map<String, dynamic> json) => _Category(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  image: json['image'] as String,
);

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
};

_Location _$LocationFromJson(Map<String, dynamic> json) => _Location(
  restaurantId: (json['restaurant_id'] as num).toInt(),
  placeId: json['place_id'] as String,
  address: json['address'] as String,
  lat: json['lat'] as String,
  lng: json['lng'] as String,
);

Map<String, dynamic> _$LocationToJson(_Location instance) => <String, dynamic>{
  'restaurant_id': instance.restaurantId,
  'place_id': instance.placeId,
  'address': instance.address,
  'lat': instance.lat,
  'lng': instance.lng,
};
