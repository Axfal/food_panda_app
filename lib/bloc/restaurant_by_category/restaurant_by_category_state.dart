part of 'restaurant_by_category_bloc.dart';

class RestaurantByCategoryState extends Equatable {
  final Map<int, List<RestaurantData>> restaurantDataByCategory;
  final ApiResponse<String> apiResponse;

  const RestaurantByCategoryState({
    this.apiResponse = const ApiResponse.completed(''),
    this.restaurantDataByCategory = const {},
  });

  RestaurantByCategoryState copyWith({
    ApiResponse<String>? apiResponse,
    Map<int, List<RestaurantData>>? restaurantDataByCategory,
  }) {
    return RestaurantByCategoryState(
      apiResponse: apiResponse ?? this.apiResponse,
      restaurantDataByCategory:
      restaurantDataByCategory ?? this.restaurantDataByCategory,
    );
  }

  @override
  List<Object?> get props => [restaurantDataByCategory, apiResponse];
}
