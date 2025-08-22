part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final File? photo;
  final String name;
  final String oldPassword;
  final String newPassword;
  final UserModel userModel;
  final ApiResponse<String> profileApiResponse;
  const ProfileState({
    this.name = '',
    this.photo,
    this.oldPassword = '',
    this.newPassword = '',
    this.userModel = const UserModel(),
    this.profileApiResponse = const ApiResponse.completed(''),
  });

  ProfileState copyWith({
    String? name,
    File? photo,
    String? oldPassword,
    String? newPassword,
    UserModel? userModel,
    ApiResponse<String>? profileApiResponse,
  }) {
    return ProfileState(
      name: name ?? this.name,
      photo: photo ?? photo,
      oldPassword: oldPassword ?? this.oldPassword,
      newPassword: newPassword ?? this.newPassword,
      userModel: userModel ?? this.userModel,
      profileApiResponse: profileApiResponse ?? this.profileApiResponse,
    );
  }

  @override
  List<Object?> get props => [userModel, profileApiResponse, name, photo, oldPassword, newPassword];
}
