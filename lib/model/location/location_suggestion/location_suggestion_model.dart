import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_suggestion_model.freezed.dart';
part 'location_suggestion_model.g.dart';

@freezed
class LocationSuggestionModel with _$LocationSuggestionModel {
  const factory LocationSuggestionModel({
    @Default(false) @JsonKey(name: 'success') bool success,
    @Default('') @JsonKey(name: 'query') String query,
    @Default([]) @JsonKey(name: 'suggestions') List<Suggestion> suggestions,
  }) = _LocationSuggestionModel;

  factory LocationSuggestionModel.fromJson(Map<String, dynamic> json) =>
      _$LocationSuggestionModelFromJson(json);

  @override
  // TODO: implement query
  String get query => throw UnimplementedError();

  @override
  // TODO: implement success
  bool get success => throw UnimplementedError();

  @override
  // TODO: implement suggestions
  List<Suggestion> get suggestions => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

}

@freezed
class Suggestion with _$Suggestion {
  const factory Suggestion({
    @Default('') @JsonKey(name: 'place_id') String placeId,
    @Default('') @JsonKey(name: 'description') String description,
  }) = _Suggestion;

  factory Suggestion.fromJson(Map<String, dynamic> json) =>
      _$SuggestionFromJson(json);

  @override
  // TODO: implement description
  String get description => throw UnimplementedError();

  @override
  // TODO: implement placeId
  String get placeId => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

}
