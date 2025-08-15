import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_category_model.freezed.dart';
part 'menu_category_model.g.dart';

@freezed
class MenuCategoryModel with _$MenuCategoryModel {
  const factory MenuCategoryModel({
    @Default(false) @JsonKey(name: 'success') bool success,
    @Default(0) @JsonKey(name: 'count') int count,
    @Default('') @JsonKey(name: 'error') String error,
    @Default([]) @JsonKey(name: 'categories') List<Category> categories,
  }) = _MenuCategoryModel;

  const MenuCategoryModel._(); // ✅ Needed if you want custom getters

  factory MenuCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$MenuCategoryModelFromJson(json);

  @override
  // TODO: implement categories
  List<Category> get categories => throw UnimplementedError();

  @override
  // TODO: implement count
  int get count => throw UnimplementedError();

  @override
  // TODO: implement error
  String get error => throw UnimplementedError();

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
class Category with _$Category {
  const factory Category({
    @Default(0) int id,
    @JsonKey(name: 'restaurant_id') @Default(0) int restaurantId,
    @Default('') String name,
    @Default('') String photo,
  }) = _Category;

  const Category._(); // ✅ Needed if you want custom getters

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

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
  // TODO: implement restaurantId
  int get restaurantId => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
