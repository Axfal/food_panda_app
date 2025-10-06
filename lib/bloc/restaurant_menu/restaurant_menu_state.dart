part of 'restaurant_menu_bloc.dart';

class RestaurantMenuState extends Equatable {
  final Map<int, RestaurantMenuModel> menus;
  final Map<int, RestaurantMenuItemModel> menuItem; /// categoryId + MenuItems
  final ApiResponse<String> apiResponse;

  const RestaurantMenuState({
    this.menus = const {},
    this.menuItem = const {},
    this.apiResponse = const ApiResponse.completed(''),
  });

  RestaurantMenuState copyWith({
    Map<int, RestaurantMenuModel>? menus,
    Map<int, RestaurantMenuItemModel>? menuItem,
    ApiResponse<String>? apiResponse,
  }) {
    return RestaurantMenuState(
      menus: menus ?? this.menus,
      menuItem: menuItem ?? this.menuItem,
      apiResponse: apiResponse ?? this.apiResponse,
    );
  }

  @override
  List<Object?> get props => [menus, apiResponse, menuItem];
}
