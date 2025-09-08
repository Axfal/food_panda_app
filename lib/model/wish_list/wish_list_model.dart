import 'package:freezed_annotation/freezed_annotation.dart';

part 'wish_list_model.freezed.dart';
part 'wish_list_model.g.dart';

@freezed
class WishListModel with _$WishListModel {
  const factory WishListModel({
    @Default(false) @JsonKey(name: 'success') bool success,
    @Default(0) @JsonKey(name: 'count') int count,
    @Default([]) @JsonKey(name: 'restaurants') List<Restaurant> restaurants,
  }) = _WishListModel;

  factory WishListModel.fromJson(Map<String, dynamic> json) =>
      _$WishListModelFromJson(json);

  @override
  // TODO: implement count
  int get count => throw UnimplementedError();

  @override
  // TODO: implement restaurants
  List<Restaurant> get restaurants => throw UnimplementedError();

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
class Restaurant with _$Restaurant {
  const factory Restaurant({
    @Default(0) @JsonKey(name: 'id') int id,
    @Default(0) @JsonKey(name: 'owner_id') int ownerId,
    @Default('') @JsonKey(name: 'name') String name,
    @Default('') @JsonKey(name: 'description') String description,
    @Default('') @JsonKey(name: 'phone') String phone,
    @Default('') @JsonKey(name: 'logo') String logo,
    @Default('') @JsonKey(name: 'status') String status,
    @Default('') @JsonKey(name: 'hours') String hours,
    @Default('0.0') @JsonKey(name: 'rating') String rating,
    @Default('') @JsonKey(name: 'created_at') String createdAt,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  @override
  // TODO: implement createdAt
  String get createdAt => throw UnimplementedError();

  @override
  // TODO: implement description
  String get description => throw UnimplementedError();

  @override
  // TODO: implement hours
  String get hours => throw UnimplementedError();

  @override
  // TODO: implement id
  int get id => throw UnimplementedError();

  @override
  // TODO: implement logo
  String get logo => throw UnimplementedError();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement ownerId
  int get ownerId => throw UnimplementedError();

  @override
  // TODO: implement phone
  String get phone => throw UnimplementedError();

  @override
  // TODO: implement rating
  String get rating => throw UnimplementedError();

  @override
  // TODO: implement status
  String get status => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }


}
