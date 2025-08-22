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

class NameChangeEvent extends ProfileEvent {
  final String name;
  const NameChangeEvent({required this.name});
  @override
  // TODO: implement props
  List<Object?> get props => [name];
}
class PhotoChangeEvent extends ProfileEvent {
  final File photo;
  const PhotoChangeEvent({required this.photo});
  @override
  List<Object> get props => [photo];
}

class OldPasswordChange extends ProfileEvent {
  final String oldPassword;
  const OldPasswordChange({required this.oldPassword});

  @override
  List<Object> get props => [oldPassword];
}

class NewPasswordChangeEvent extends ProfileEvent {
  final String newPassword;
  const NewPasswordChangeEvent({required this.newPassword});

  @override
  List<Object> get props => [newPassword];
}
