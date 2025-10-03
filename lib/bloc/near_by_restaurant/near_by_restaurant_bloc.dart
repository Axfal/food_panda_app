// ignore_for_file: avoid_print

import 'package:excellent_trade_app/dependency_injection/dependency_injection.dart';
import '../../model/near_by_restaurant/near_by_restaurant.dart';
import '../../pages/auth/login/login_exports.dart';

part 'near_by_restaurant_event.dart';
part 'near_by_restaurant_state.dart';

class NearByRestaurantBloc
    extends Bloc<NearByRestaurantEvent, NearByRestaurantState> {
  final RestaurantApiRepository restaurantApiRepository;

  NearByRestaurantBloc({required this.restaurantApiRepository})
    : super(const NearByRestaurantState()) {
    on<FetchNearByRestaurantEvent>(_onFetchNearByRestaurant);
  }

  Future<void> _onFetchNearByRestaurant(
    FetchNearByRestaurantEvent event,
    Emitter<NearByRestaurantState> emit,
  ) async {
    emit(state.copyWith(apiResponse: ApiResponse.loading()));

    try {
      final Map<String, dynamic> data = {
        "lat": event.lat.toString(),
        "lng": event.lng.toString(),
        "radius": "5",
        "limit": "10",
        "offset": "0",
      };

      final response = await restaurantApiRepository.nearByRestaurant(data);


      if (response != null) {
        final model = NearByRestaurant.fromJson(response);

        if (model.success == true) {
          emit(
            state.copyWith(
              apiResponse: ApiResponse.completed('fetched successfully'),
              nearByRestaurantModel: model,
            ),
          );
        } else {
          emit(
            state.copyWith(
              apiResponse: ApiResponse.error(
                response['error'] ?? "Error while fetching nearby restaurant",
              ),
            ),
          );
        }
      } else {
        print('No response from server');
        emit(
          state.copyWith(
            apiResponse: ApiResponse.error("No response from server"),
          ),
        );
      }
    } catch (e, stack) {
      print('Error: $e');
      print(stack);
      emit(
        state.copyWith(
          apiResponse: ApiResponse.error("Something went wrong: $e"),
        ),
      );
    }
  }
}
