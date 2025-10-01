// ignore_for_file: avoid_print

import 'dart:io';

import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/dependency_injection/dependency_injection.dart';
import 'package:excellent_trade_app/model/profile/profile_model.dart';

import '../../../utils/constants/app_urls.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileApiRepository profileApiRepository;
  ProfileBloc({required this.profileApiRepository}) : super(ProfileState()) {
    on<FetchProfileEvent>(_onFetchProfile);
    on<UpdateProfileEvent>(_onUpdateProfile);
    on<NameChangeEvent>(_onNameChange);
    on<PhotoChangeEvent>(_onPhotoChange);
    on<OldPasswordChange>(_onOldPasswordChange);
    on<NewPasswordChangeEvent>(_onNewPasswordChange);
  }
  void _onFetchProfile(
    FetchProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    if (state.userModel.id != 0) {
      emit(
        state.copyWith(
          profileApiResponse: ApiResponse.completed('Profile already loaded'),
        ),
      );
      return;
    }

    emit(state.copyWith(profileApiResponse: ApiResponse.loading()));

    try {
      final response = await profileApiRepository.getProfile(event.id);

      if (response != null) {
        if (response['success'] == true && response['user'] != null) {
          final user = UserModel.fromJson(response['user']);

          emit(
            state.copyWith(
              userModel: user,
              profileApiResponse: ApiResponse.completed('Profile data fetched'),
            ),
          );
        } else {
          emit(
            state.copyWith(
              profileApiResponse: ApiResponse.error(
                response['error'] ?? 'Failed to fetch profile',
              ),
            ),
          );
        }
      } else {
        emit(
          state.copyWith(
            profileApiResponse: ApiResponse.error('No response from server'),
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(profileApiResponse: ApiResponse.error('Exception: $e')),
      );
    }
  }

  void _onUpdateProfile(
    UpdateProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(profileApiResponse: ApiResponse.loading()));

    if ((state.oldPassword.isNotEmpty && state.newPassword.isEmpty) ||
        (state.oldPassword.isEmpty && state.newPassword.isNotEmpty)) {
      emit(
        state.copyWith(
          profileApiResponse: const ApiResponse.error(
            "Both old and new password are required.",
          ),
        ),
      );
      return;
    }

    final Map<String, dynamic> data = {"id": state.userModel.id};

    if (state.name.isNotEmpty) data["name"] = state.name;
    if (state.photo != null) data["photo"] = state.photo;
    if (state.oldPassword.isNotEmpty && state.newPassword.isNotEmpty) {
      data["old_password"] = state.oldPassword;
      data["new_password"] = state.newPassword;
    }

    try {
      final response = await profileApiRepository.updateProfile(data);

      if (response != null && response['success'] == true) {
        // Build full photo url
        String? photoUrl;
        if (response['photo_url'] != null) {
          photoUrl = "${AppUrl.baseUrl}/${response['photo_url']}";
        }

        // Patch existing userModel with updated fields
        final updatedUser = state.userModel.copyWith(
          name: data["name"] ?? state.userModel.name,
          photo: photoUrl ?? state.userModel.photo,
        );

        emit(
          state.copyWith(
            userModel: updatedUser,
            profileApiResponse: ApiResponse.completed(
              response['message'] ?? "Profile updated successfully",
            ),
            oldPassword: '',
            newPassword: '',
          ),
        );
      } else {
        emit(
          state.copyWith(
            profileApiResponse: ApiResponse.error(
              response?['error'] ?? "Update failed",
            ),
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(profileApiResponse: ApiResponse.error("Error: $e")));
    }
  }

  void _onNameChange(NameChangeEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _onPhotoChange(PhotoChangeEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(photo: event.photo));
  }

  void _onOldPasswordChange(
    OldPasswordChange event,
    Emitter<ProfileState> emit,
  ) {
    emit(state.copyWith(oldPassword: event.oldPassword));
  }

  void _onNewPasswordChange(
    NewPasswordChangeEvent event,
    Emitter<ProfileState> emit,
  ) {
    emit(state.copyWith(newPassword: event.newPassword));
  }
}
