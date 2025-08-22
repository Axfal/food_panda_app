part of 'profile_bloc.dart';

class ProfileState extends Equatable{
  final UserModel userModel;
  final ApiResponse<String> profileApiResponse;
  const ProfileState({this.userModel = const UserModel(), this.profileApiResponse = const ApiResponse.completed('')});

  ProfileState copyWith({
    UserModel? userModel,
    ApiResponse<String>? profileApiResponse
}) {
    return ProfileState(
      userModel: userModel ?? this.userModel,
      profileApiResponse: profileApiResponse ?? this.profileApiResponse
    );
  }

  @override
  List<Object?> get props => [
    userModel, profileApiResponse];
}
