// ignore_for_file: avoid_print

import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/dependency_injection/dependency_injection.dart';
import 'package:excellent_trade_app/model/profile/profile_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileApiRepository profileApiRepository;
  ProfileBloc({required this.profileApiRepository}) : super(ProfileState()) {
    on<FetchProfileEvent>(_onFetchProfile);
    on<UpdateProfileEvent>(_onUpdateProfile);
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
  ) async {}
}
