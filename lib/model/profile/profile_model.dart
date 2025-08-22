import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const ProfileModel._();

  const factory ProfileModel({
    @Default(false) @JsonKey(name: 'success') bool success,
    @JsonKey(name: 'user') UserModel? user,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

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
  const UserModel._();

  const factory UserModel({
    @Default(0) @JsonKey(name: 'id') int id,
    @Default('') @JsonKey(name: 'name') String name,
    @Default('') @JsonKey(name: 'email') String email,
    @Default('') @JsonKey(name: 'phone') String phone,
    @JsonKey(name: 'address') String? address,
    @Default('') @JsonKey(name: 'photo') String photo,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  // TODO: implement address
  String? get address => throw UnimplementedError();

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
  // TODO: implement phone
  String get phone => throw UnimplementedError();

  @override
  // TODO: implement photo
  String get photo => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
