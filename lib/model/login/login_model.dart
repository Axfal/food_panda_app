import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel {
  const factory LoginModel({
    @Default(false) @JsonKey(name: "success") bool success,
    @Default('') @JsonKey(name: "message") String message,
    @JsonKey(name: "user") UserModel? user,
    @Default('') String error,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  @override
  // TODO: implement error
  String get error => throw UnimplementedError();

  @override
  // TODO: implement message
  String get message => throw UnimplementedError();

  @override
  // TODO: implement success
  bool get success => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement user
  UserModel? get user => throw UnimplementedError();

}

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @Default(0) @JsonKey(name: "id") int id,
    @Default('') @JsonKey(name: "name") String name,
    @Default('') @JsonKey(name: "email") String email,
    @Default('') @JsonKey(name: "role") String role,
    @Default(0) @JsonKey(name: "restaurant_id") int restaurantId,
    @Default('') @JsonKey(name: "token") String token,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  // TODO: implement email
  String get email => throw UnimplementedError();

  @override
  // TODO: implement id
  int get id => throw UnimplementedError();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement restaurantId
  int get restaurantId => throw UnimplementedError();

  @override
  // TODO: implement role
  String get role => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement token
  String get token => throw UnimplementedError();

}
