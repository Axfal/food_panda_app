// ignore_for_file: avoid_print

import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/dependency_injection/dependency_injection.dart';
import '../../model/restaurant_menu/restaurant_menu_model.dart';

part 'restaurant_menu_event.dart';
part 'restaurant_menu_state.dart';

class RestaurantMenuBloc
    extends Bloc<RestaurantMenuEvent, RestaurantMenuState> {
  final RestaurantApiRepository restaurantApiRepository;

  RestaurantMenuBloc({required this.restaurantApiRepository})
    : super(const RestaurantMenuState()) {
    on<FetchRestaurantMenuEvent>(_onFetchRestaurantMenu);
  }

  Future<void> _onFetchRestaurantMenu(
    FetchRestaurantMenuEvent event,
    Emitter<RestaurantMenuState> emit,
  ) async {
    final restaurantId = event.restaurantId;

    if (state.menus.containsKey(restaurantId)) {
      print(
        "Cache hit → Menu already available for restaurantId: $restaurantId",
      );
      return;
    }

    emit(state.copyWith(apiResponse: const ApiResponse.loading()));
    try {
      final response = await restaurantApiRepository.restaurantMenu(
       "6"
      );

      if (response != null &&
          response['success'] == true &&
          response['restaurant'] != null) {
        final menu = RestaurantMenuModel.fromJson(response);

        final updatedMenus = Map<int, RestaurantMenuModel>.from(state.menus)
          ..[restaurantId] = menu;

        emit(
          state.copyWith(
            menus: updatedMenus,
            apiResponse: const ApiResponse.completed('Success'),
          ),
        );
      } else {
        emit(
          state.copyWith(
            apiResponse: const ApiResponse.error(
              'Invalid response from server',
            ),
          ),
        );
      }
    } catch (e) {
      print("Error fetching menu: $e");
      emit(state.copyWith(apiResponse: ApiResponse.error(e.toString())));
    }
  }
}
