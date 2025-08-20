import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoriesModel with _$CategoriesModel {
  const CategoriesModel._();

  const factory CategoriesModel({
    @Default(false) @JsonKey(name: 'success') bool success,
    @Default('') @JsonKey(name: 'error') String error,
    @Default([]) @JsonKey(name: 'categories') List<Categories> categories,
  }) = _CategoriesModel;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);

  @override
  // TODO: implement categories
  List<Categories> get categories => throw UnimplementedError();

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
class Categories with _$Categories {
  const Categories._();

  const factory Categories({
    @Default(0) @JsonKey(name: 'id') int id,
    @Default('') @JsonKey(name: 'name') String name,
    @Default('') @JsonKey(name: 'image_url') String image_url,
  }) = _Categories;

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);

  @override
  // TODO: implement id
  int get id => throw UnimplementedError();

  @override
  // TODO: implement image_url
  String get image_url => throw UnimplementedError();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
