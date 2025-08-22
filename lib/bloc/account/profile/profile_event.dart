part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class FetchProfileEvent extends ProfileEvent {
  final String id;
  const FetchProfileEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class UpdateProfileEvent extends ProfileEvent {
  final UserModel? userModel;
  const UpdateProfileEvent({this.userModel});

  @override
  List<Object?> get props => [userModel];
}
