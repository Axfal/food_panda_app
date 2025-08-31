// ignore_for_file: avoid_print

import 'package:excellent_trade_app/dependency_injection/dependency_injection.dart';
import 'package:excellent_trade_app/model/new_restaurant/new_restaurant_model.dart';
import '../../pages/auth/login/login_exports.dart';
part 'new_restaurant_event.dart';
part 'new_restaurant_state.dart';

class NewRestaurantBloc extends Bloc<NewRestaurantEvent, NewRestaurantState> {
  final RestaurantApiRepository restaurantApiRepository;

  NewRestaurantBloc({required this.restaurantApiRepository})
    : super(NewRestaurantState()) {
    on<FetchNewRestaurantEvent>(_onFetchNewRestaurant);
  }

  Future<void> _onFetchNewRestaurant(
    FetchNewRestaurantEvent event,
    Emitter<NewRestaurantState> emit,
  ) async {
    if (state.newRestaurantModel.success == true) return;

    emit(state.copyWith(apiResponse: ApiResponse.loading()));

    try {
      final Map<String, dynamic> data = {"lat": event.lat, "lng": event.lng};

      final response = await restaurantApiRepository.newRestaurant(data);

      if (response != null) {
        final model = NewRestaurantModel.fromJson(response);

        if (model.success == true) {
          emit(
            state.copyWith(
              apiResponse: ApiResponse.completed('fetched successfully'),
              newRestaurantModel: model,
            ),
          );
        } else {
          emit(
            state.copyWith(
              apiResponse: ApiResponse.error(
                response['error'] ?? "error while fetching new restaurant",
              ),
            ),
          );
        }
      } else {
        print('no response from server');
        emit(
          state.copyWith(
            apiResponse: ApiResponse.error("No response from server"),
          ),
        );
      }
    } catch (e, stack) {
      print('error: $e');
      print(stack);
      emit(
        state.copyWith(
          apiResponse: ApiResponse.error("Something went wrong: $e"),
        ),
      );
    }
  }
}
