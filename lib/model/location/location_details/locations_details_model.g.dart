// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationDetailsModel _$LocationDetailsModelFromJson(
  Map<String, dynamic> json,
) => _LocationDetailsModel(
  success: json['success'] as bool? ?? false,
  place: json['place'] == null
      ? null
      : Place.fromJson(json['place'] as Map<String, dynamic>),
  error: json['error'] as String? ?? '',
);

Map<String, dynamic> _$LocationDetailsModelToJson(
  _LocationDetailsModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'place': instance.place,
  'error': instance.error,
};

_Place _$PlaceFromJson(Map<String, dynamic> json) => _Place(
  placeId: json['place_id'] as String? ?? '',
  name: json['name'] as String? ?? '',
  address: json['address'] as String? ?? '',
  lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
  lng: (json['lng'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$PlaceToJson(_Place instance) => <String, dynamic>{
  'place_id': instance.placeId,
  'name': instance.name,
  'address': instance.address,
  'lat': instance.lat,
  'lng': instance.lng,
};
