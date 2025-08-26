// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_suggestion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationSuggestionModel _$LocationSuggestionModelFromJson(
  Map<String, dynamic> json,
) => _LocationSuggestionModel(
  success: json['success'] as bool? ?? false,
  query: json['query'] as String? ?? '',
  suggestions:
      (json['suggestions'] as List<dynamic>?)
          ?.map((e) => Suggestion.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$LocationSuggestionModelToJson(
  _LocationSuggestionModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'query': instance.query,
  'suggestions': instance.suggestions,
};

_Suggestion _$SuggestionFromJson(Map<String, dynamic> json) => _Suggestion(
  placeId: json['place_id'] as String? ?? '',
  description: json['description'] as String? ?? '',
);

Map<String, dynamic> _$SuggestionToJson(_Suggestion instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'description': instance.description,
    };
