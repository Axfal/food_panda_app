part of 'restaurant_menu_bloc.dart';

class RestaurantMenuState extends Equatable {
  final Map<int, RestaurantMenuModel> menus;
  final ApiResponse<String> apiResponse;

  const RestaurantMenuState({
    this.menus = const {},
    this.apiResponse = const ApiResponse.completed(''),
  });

  RestaurantMenuState copyWith({
    Map<int, RestaurantMenuModel>? menus,
    ApiResponse<String>? apiResponse,
  }) {
    return RestaurantMenuState(
      menus: menus ?? this.menus,
      apiResponse: apiResponse ?? this.apiResponse,
    );
  }

  @override
  List<Object?> get props => [menus, apiResponse];
}
