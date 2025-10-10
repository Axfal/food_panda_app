// ignore_for_file: avoid_print

import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/model/restaurant_by_category/restaurant_by_category_model.dart';
import 'package:excellent_trade_app/pages/home/home_exports.dart';
import '../../repository/restaurant/restaurant_api_repository.dart';

part 'restaurant_by_category_event.dart';
part 'restaurant_by_category_state.dart';

class RestaurantByCategoryBloc
    extends Bloc<RestaurantByCategoryEvent, RestaurantByCategoryState> {
  final RestaurantApiRepository restaurantApiRepository;

  RestaurantByCategoryBloc({required this.restaurantApiRepository})
      : super(const RestaurantByCategoryState()) {
    on<FetchRestaurantsByCategoryEvent>(_onFetchRestaurantByCategory);
  }

  Future<void> _onFetchRestaurantByCategory(
      FetchRestaurantsByCategoryEvent event,
      Emitter<RestaurantByCategoryState> emit,
      ) async {
    // Check cache
    if (state.restaurantDataByCategory.containsKey(event.categoryId)) {
      print("Data already exists for categoryId ${event.categoryId}, skipping API call.");
      emit(
        state.copyWith(
          apiResponse: const ApiResponse.completed('Data loaded from cache'),
        ),
      );
      return;
    }

    emit(state.copyWith(apiResponse: const ApiResponse.loading()));

    final locationController = LocationSessionController();
    final lat = locationController.currentPlace?.lat.toString() ?? "";
    final lng = locationController.currentPlace?.lng.toString() ?? "";

    final data = {
      "category_id": event.categoryId.toString(),
      "lat": lat,
      "lng": lng,
      "radius": "5",
    };

    try {
      final response = await restaurantApiRepository.restaurantByCategory(data);

      if (response != null) {
        final model = RestaurantByCategory.fromJson(response);

        if (model.success) {
          final updatedMap = Map<int, List<RestaurantData>>.from(
            state.restaurantDataByCategory,
          );
          updatedMap[event.categoryId] = model.restaurants;

          emit(
            state.copyWith(
              restaurantDataByCategory: updatedMap,
              apiResponse: const ApiResponse.completed('Data loaded'),
            ),
          );
        } else {
          emit(state.copyWith(
            apiResponse: const ApiResponse.error('Invalid data received'),
          ));
        }
      } else {
        print("No response from server");
        emit(state.copyWith(
          apiResponse: const ApiResponse.error('No response from server'),
        ));
      }
    } catch (e, st) {
      print('Error fetching restaurants: $e');
      print(st);
      emit(state.copyWith(apiResponse: ApiResponse.error(e.toString())));
    }
  }
}
