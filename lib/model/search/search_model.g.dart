// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => _SearchModel(
  success: json['success'] as bool? ?? false,
  query: json['query'] as String? ?? '',
  count: (json['count'] as num?)?.toInt() ?? 0,
  results:
      (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$SearchModelToJson(_SearchModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'query': instance.query,
      'count': instance.count,
      'results': instance.results,
    };

_Results _$ResultsFromJson(Map<String, dynamic> json) => _Results(
  restaurantId: (json['restaurant_id'] as num?)?.toInt() ?? 0,
  restaurantName: json['restaurant_name'] as String? ?? '',
  lat: json['lat'] as String? ?? '',
  lng: json['lng'] as String? ?? '',
  matchedItem: json['matched_item'] as String? ?? '',
  matchedCategory: json['matched_category'] as String? ?? '',
);

Map<String, dynamic> _$ResultsToJson(_Results instance) => <String, dynamic>{
  'restaurant_id': instance.restaurantId,
  'restaurant_name': instance.restaurantName,
  'lat': instance.lat,
  'lng': instance.lng,
  'matched_item': instance.matchedItem,
  'matched_category': instance.matchedCategory,
};
