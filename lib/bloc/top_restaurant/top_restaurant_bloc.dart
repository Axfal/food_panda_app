// ignore_for_file: avoid_print

import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/dependency_injection/dependency_injection.dart';
import 'package:excellent_trade_app/model/top_restaurant/top_restaurant_model.dart';

part 'top_restaurant_event.dart';
part 'top_restaurant_state.dart';

class TopRestaurantBloc extends Bloc<TopRestaurantEvent, TopRestaurantState> {
  final RestaurantApiRepository restaurantApiRepository;

  TopRestaurantBloc({required this.restaurantApiRepository})
    : super(const TopRestaurantState()) {
    on<FetchTopRestaurantEvent>(_onFetchTopRestaurant);
  }

  Future<void> _onFetchTopRestaurant(
    FetchTopRestaurantEvent event,
    Emitter<TopRestaurantState> emit,
  ) async {
    try {
      emit(state.copyWith(apiResponse: ApiResponse.loading()));

      Map<String, dynamic> data = {
        "lat": event.lat,
        "lng": event.lng,
        "radius": event.radius,
      };

      final response = await restaurantApiRepository.topRestaurant(data);

      if (response != null) {
        if (response['success'] == true && response['restaurants'] != null) {
          final model = TopRestaurantModel.fromJson(response);

          emit(
            state.copyWith(
              apiResponse: const ApiResponse.completed("Fetched Successfully"),
              topRestaurantModel: model,
            ),
          );
        } else {
          emit(
            state.copyWith(
              apiResponse: ApiResponse.error(
                response['error'] ?? "Error while fetching top restaurant data",
              ),
            ),
          );
          print(
            response['error'] ?? "Error while fetching top restaurant data",
          );
        }
      } else {
        emit(
          state.copyWith(
            apiResponse: ApiResponse.error("No response from server"),
          ),
        );
        print("No response from server");
      }
    } catch (e) {
      emit(state.copyWith(apiResponse: ApiResponse.error("Exception: $e")));
      print('Error: $e');
    }
  }
}
