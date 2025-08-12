import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_item_model.freezed.dart';
part 'menu_item_model.g.dart';

@freezed
class MenuItemModel with _$MenuItemModel {
  const factory MenuItemModel({
    @Default(false) @JsonKey(name: 'success') bool success,
    @Default(0) @JsonKey(name: 'count') int count,
    @Default('') @JsonKey(name: 'error') String error,
    @Default([]) @JsonKey(name: 'items') List<Item> items,
  }) = _MenuItemModel;

  factory MenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemModelFromJson(json);

  @override
  // TODO: implement count
  int get count => throw UnimplementedError();

  @override
  // TODO: implement error
  String get error => throw UnimplementedError();

  @override
  // TODO: implement items
  List<Item> get items => throw UnimplementedError();

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
class Item with _$Item {
  const factory Item({
    @Default(0) @JsonKey(name: 'id') int id,
    @Default(0) @JsonKey(name: 'restaurant_id') int restaurantId,
    @Default(0) @JsonKey(name: 'category_id') int categoryId,
    @Default('') @JsonKey(name: 'name') String name,
    @Default('') @JsonKey(name: 'description') String description,
    @Default('0.00') @JsonKey(name: 'price') String price,
    @Default('') @JsonKey(name: 'photo') String photo,
    @Default('') @JsonKey(name: 'status') String status,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  @override
  // TODO: implement categoryId
  int get categoryId => throw UnimplementedError();

  @override
  // TODO: implement description
  String get description => throw UnimplementedError();

  @override
  // TODO: implement id
  int get id => throw UnimplementedError();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement photo
  String get photo => throw UnimplementedError();

  @override
  // TODO: implement price
  String get price => throw UnimplementedError();

  @override
  // TODO: implement restaurantId
  int get restaurantId => throw UnimplementedError();

  @override
  // TODO: implement status
  String get status => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
