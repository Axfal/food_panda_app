import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/model/vender/restaurant/restaurant_model.dart';
import 'package:excellent_trade_app/repository/vendor/restaurant/restaurant_api_repository.dart';
import 'dart:io';
part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc
    extends Bloc<RestaurantEvent, RestaurantStates> {
  RestaurantApiRepository restaurantApiRepository;
  RestaurantBloc({required this.restaurantApiRepository})
    : super(RestaurantStates()) {
    on<RestaurantNameChangeEvent>(_onRestaurantNameChange);
    on<LogoChangeEvent>(_onLogoChange);
    on<PhoneChangeEvent>(_onPhoneChange);
    on<DescriptionChangeEvent>(_onDescriptionChange);
    on<AddressChangeEvent>(_onAddressChange);
    on<SubmitFormEvent>(_onSubmitForm);
    on<FetchRestaurantEvent>(_onFetchRestaurants);
    on<DeleteRestaurantEvent>(_onDeleteRestaurant);
  }

  void _onRestaurantNameChange(
    RestaurantNameChangeEvent event,
    Emitter<RestaurantStates> emit,
  ) {
    emit(state.copyWith(restaurantName: event.restaurantName));
  }

  void _onLogoChange(
    LogoChangeEvent event,
    Emitter<RestaurantStates> emit,
  ) {
    emit(state.copyWith(logo: event.logo));
  }

  void _onPhoneChange(
    PhoneChangeEvent event,
    Emitter<RestaurantStates> emit,
  ) {
    emit(state.copyWith(phone: event.phone));
  }

  void _onAddressChange(
    AddressChangeEvent event,
    Emitter<RestaurantStates> emit,
  ) {
    emit(state.copyWith(address: event.address));
  }

  void _onDescriptionChange(
    DescriptionChangeEvent event,
    Emitter<RestaurantStates> emit,
  ) {
    emit(state.copyWith(description: event.description));
  }

  void _onSubmitForm(
    SubmitFormEvent event,
    Emitter<RestaurantStates> emit,
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
      final response = await restaurantApiRepository.addRestaurant(data);

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

  void _onDeleteRestaurant(
      DeleteRestaurantEvent event,
      Emitter<RestaurantStates> emit,
      ) async {
    // Indicate loading state
    emit(state.copyWith(registerRestaurantApi: ApiResponse.loading()));
final userId = SessionController.user.id;
    final Map<String, dynamic> data = {
      "id": event.id,
      "owner_id": userId
    };

    try {
      final response = await restaurantApiRepository.deleteRestaurant(data);

      if (response != null && response['success'] == true) {
        /// Remove deleted restaurant from state
        final List<Restaurant> updatedList = state.restaurants
            .where((r) => r != null && r.id.toString() != event.id)
            .cast<Restaurant>()
            .toList();

        emit(state.copyWith(
          restaurants: updatedList,
          registerRestaurantApi: ApiResponse.completed(
            response['message'] ?? 'Restaurant deleted successfully',
          ),
        ));
      } else {
        emit(state.copyWith(
          registerRestaurantApi: ApiResponse.error(
            response?['message'] ?? 'Failed to delete restaurant',
          ),
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        registerRestaurantApi: ApiResponse.error('Error deleting restaurant: $e'),
      ));
    }
  }

  void _onFetchRestaurants(FetchRestaurantEvent event, Emitter<RestaurantStates> emit) async {
    emit(state.copyWith(registerRestaurantApi: ApiResponse.loading()));
    try {
      final userId = SessionController.user.id.toString();
      final response = await restaurantApiRepository.fetchRestaurant(userId);

      if (response != null) {
        final restaurantModel = RestaurantModel.fromJson(response);

        if (restaurantModel.success) {
          emit(state.copyWith(
            restaurants: restaurantModel.restaurants,
            registerRestaurantApi: ApiResponse.completed(
              "${restaurantModel.count} restaurants fetched successfully",
            ),
          ));
        } else {
          emit(state.copyWith(
            registerRestaurantApi: ApiResponse.error("Failed to fetch restaurants"),
          ));
        }
      } else {
        emit(state.copyWith(
          registerRestaurantApi: ApiResponse.error("No response from server"),
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        registerRestaurantApi: ApiResponse.error("Error: $e"),
      ));
    }
  }

}
