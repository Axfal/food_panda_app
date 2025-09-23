// ignore_for_file: avoid_print

import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/dependency_injection/dependency_injection.dart';
import 'package:excellent_trade_app/model/top_restaurant/top_restaurant_model.dart';

part 'top_restaurant_event.dart';
part 'top_restaurant_state.dart';

class TopRestaurantBloc extends Bloc<TopRestaurantEvent, TopRestaurantState> {
  final RestaurantApiRepository restaurantApiRepository;
  TopRestaurantBloc({required this.restaurantApiRepository})
    : super(TopRestaurantState()) {
    on<TopRestaurantEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  Future<void> _onFetchTopRestaurant(
    FetchTopRestaurantEvent event,
    Emitter<TopRestaurantState> emit,
  ) async {
    emit(state.copyWith(apiResponse: ApiResponse.loading()));
    Map<String, dynamic> data = {
      "lat": 31.55088860, //event.lat ,
      "lng": 74.29005210, // event.lng,
      "radius": 10, //event.radius
    };
    try {
      final response = await restaurantApiRepository.topRestaurant(data);
      if (response != null) {
        if (response['success'] == true && response['restaurants'] != null) {
        } else {
          emit(
            state.copyWith(
              apiResponse: ApiResponse.error(
                response['error'] ?? "error while fetching top restaurant data",
              ),
            ),
          );
          print(
            "${response['error'] ?? "error while fetching top restaurant data"}",
          );
        }
      } else {
        print("no response from server");
      }
    } catch (e) {
      print('error: $e');
    }
  }
}
