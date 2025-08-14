import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:io';
import '../../../data/response/api_response.dart';
import '../../../repository/auth/auth_api_repository.dart';
part '..//register_restaurant/register_restaurant_event.dart';
part 'register_restaurant_state.dart';

class RegisterRestaurantBloc
    extends Bloc<RegisterRestaurantEvent, RegisterRestaurantStates> {
  AuthApiRepository authApiRepository;
  RegisterRestaurantBloc({required this.authApiRepository})
    : super(RegisterRestaurantStates()) {
    on<RestaurantNameChangeEvent>(_onRestaurantNameChange);
    on<LogoChangeEvent>(_onLogoChange);
    on<DescriptionChangeEvent>(_onDescriptionChange);
    on<PhoneChangeEvent>(_onPhoneChange);
    on<AddressChangeEvent>(_onAddressChange);
    on<SubmitFormEvent>(_onSubmitForm);
  }

  void _onRestaurantNameChange(
    RestaurantNameChangeEvent event,
    Emitter<RegisterRestaurantStates> emit,
  ) {
    emit(state.copyWith(restaurantName: event.restaurantName));
  }

  void _onLogoChange(
    LogoChangeEvent event,
    Emitter<RegisterRestaurantStates> emit,
  ) {
    emit(state.copyWith(logo: event.logo));
  }

  void _onPhoneChange(
    PhoneChangeEvent event,
    Emitter<RegisterRestaurantStates> emit,
  ) {
    emit(state.copyWith(phone: event.phone));
  }

  void _onAddressChange(
    AddressChangeEvent event,
    Emitter<RegisterRestaurantStates> emit,
  ) {
    emit(state.copyWith(address: event.address));
  }

  void _onDescriptionChange(
    DescriptionChangeEvent event,
    Emitter<RegisterRestaurantStates> emit,
  ) {
    emit(state.copyWith(description: event.description));
  }

  void _onSubmitForm(
    SubmitFormEvent event,
    Emitter<RegisterRestaurantStates> emit,
  ) async {
    emit(
      state.copyWith(
        ownerId: event.ownerId,
        registerRestaurantApi: ApiResponse.loading(),
      ),
    );

    final Map<String, dynamic> data = {
      "owner_id": state.ownerId,
      "name": state.restaurantName,
      "description": state.description,
      "phone": state.phone,
      "address": state.address,
      "status": "open",
      "logo": state.logo,
      "hours": "24",
    };

    try {
      final response = await authApiRepository.registerRestaurant(data);

      if (response != null && response['success'] == true) {
        emit(
          state.copyWith(
            registerRestaurantApi: ApiResponse.completed(
              response['message'] ?? "Registration successful",
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            registerRestaurantApi: ApiResponse.error(
              response?['message'] ?? "Unknown error occurred",
            ),
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          registerRestaurantApi: ApiResponse.error("Something went wrong: $e"),
        ),
      );
    }
  }
}
