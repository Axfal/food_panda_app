// ignore_for_file: avoid_print

import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/dependency_injection/dependency_injection.dart';
import 'package:excellent_trade_app/model/restaurant_menu_item/restaurant_menu_item_model.dart';
import '../../model/restaurant_menu/restaurant_menu_model.dart';

part 'restaurant_menu_event.dart';
part 'restaurant_menu_state.dart';

class RestaurantMenuBloc
    extends Bloc<RestaurantMenuEvent, RestaurantMenuState> {
  final RestaurantApiRepository restaurantApiRepository;

  RestaurantMenuBloc({required this.restaurantApiRepository})
    : super(const RestaurantMenuState()) {
    on<FetchRestaurantMenuEvent>(_onFetchRestaurantMenu);
    on<FetchRestaurantMenuItemEvent>(_onFetchRestaurantMenuItem);
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
        restaurantId.toString(),
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
            apiResponse: const ApiResponse.completed(
              'Restaurant menu fetched successfully',
            ),
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

  Future<void> _onFetchRestaurantMenuItem(
    FetchRestaurantMenuItemEvent event,
    Emitter<RestaurantMenuState> emit,
  ) async {
    if (state.menuItem.containsKey(event.categoryId)) {
      emit(
        state.copyWith(
          apiResponse: const ApiResponse.completed('Already loaded from cache'),
        ),
      );
      return;
    }

    emit(state.copyWith(apiResponse: ApiResponse.loading()));

    final Map<String, dynamic> data = {
      "restaurant_id": event.restaurantId.toString(),
      "category_id": event.categoryId.toString(),
    };

    try {
      final response = await restaurantApiRepository.restaurantMenuItem(data);

      if (response != null) {
        if (response['success'] == true && response['items'] != null) {
          final restaurantMenuItemModel = RestaurantMenuItemModel.fromJson(
            response,
          );

          final updatedMenuItems = Map<int, RestaurantMenuItemModel>.from(
            state.menuItem,
          )..[event.categoryId] = restaurantMenuItemModel;

          emit(
            state.copyWith(
              menuItem: updatedMenuItems,
              apiResponse: const ApiResponse.completed(
                'Menu items fetched successfully',
              ),
            ),
          );
        } else {
          emit(
            state.copyWith(
              apiResponse: ApiResponse.error(
                '${response['error'] ?? 'Error while fetching data'}',
              ),
            ),
          );
          print('${response['error'] ?? 'Error while fetching data'}');
        }
      } else {
        emit(
          state.copyWith(
            apiResponse: const ApiResponse.error('No response from server'),
          ),
        );
        print('No response from server');
      }
    } catch (e, st) {
      emit(state.copyWith(apiResponse: ApiResponse.error('Exception: $e')));
      print('Error: $e \nStack trace: $st');
    }
  }
}
