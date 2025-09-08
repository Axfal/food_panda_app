import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_model.freezed.dart';
part 'search_model.g.dart';

@freezed
class SearchModel with _$SearchModel {
  const factory SearchModel({
    @Default(false) @JsonKey(name: "success") bool success,
    @Default('') @JsonKey(name: 'query') String query,
    @Default(0) @JsonKey(name: 'count') int count,
    @Default([]) @JsonKey(name: 'results') List<Results> results,
  }) = _SearchModel;

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  @override
  // TODO: implement count
  int get count => throw UnimplementedError();

  @override
  // TODO: implement query
  String get query => throw UnimplementedError();

  @override
  // TODO: implement results
  List<Results> get results => throw UnimplementedError();

  @override
  // TODO: implement success
  bool get success => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

}

@freezed
class Results with _$Results {
  const factory Results({
    @Default(0) @JsonKey(name: 'restaurant_id') int restaurantId,
    @Default('') @JsonKey(name: 'restaurant_name') String restaurantName,
    @Default('') @JsonKey(name: 'lat') String lat,
    @Default('') @JsonKey(name: 'lng') String lng,
    @Default('') @JsonKey(name: 'matched_item') String matchedItem,
    @Default('') @JsonKey(name: 'matched_category') String matchedCategory,
  }) = _Results;

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  @override
  // TODO: implement lat
  String get lat => throw UnimplementedError();

  @override
  // TODO: implement lng
  String get lng => throw UnimplementedError();

  @override
  // TODO: implement matchedCategory
  String get matchedCategory => throw UnimplementedError();

  @override
  // TODO: implement matchedItem
  String get matchedItem => throw UnimplementedError();

  @override
  // TODO: implement restaurantId
  int get restaurantId => throw UnimplementedError();

  @override
  // TODO: implement restaurantName
  String get restaurantName => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

}
