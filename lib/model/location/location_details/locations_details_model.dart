import 'package:freezed_annotation/freezed_annotation.dart';

part 'locations_details_model.freezed.dart';
part 'locations_details_model.g.dart';

@freezed
class LocationDetailsModel with _$LocationDetailsModel {
  const factory LocationDetailsModel({
    @Default(false) @JsonKey(name: 'success') bool success,
    @JsonKey(name: 'place') Place? place, // make place optional
    @Default('') String error, // error message if API fails
  }) = _LocationDetailsModel;

  factory LocationDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$LocationDetailsModelFromJson(json);

  @override
  // TODO: implement error
  String get error => throw UnimplementedError();

  @override
  // TODO: implement place
  Place? get place => throw UnimplementedError();

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
class Place with _$Place {
  const factory Place({
    @JsonKey(name: 'place_id') @Default('') String placeId,
    @Default('') String name,
    @Default('') String address,
    @Default(0.0) double lat,
    @Default(0.0) double lng,
  }) = _Place;

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  @override
  // TODO: implement address
  String get address => throw UnimplementedError();

  @override
  // TODO: implement lat
  double get lat => throw UnimplementedError();

  @override
  // TODO: implement lng
  double get lng => throw UnimplementedError();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement placeId
  String get placeId => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }



}
