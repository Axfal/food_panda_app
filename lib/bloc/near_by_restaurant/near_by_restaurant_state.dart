part of 'near_by_restaurant_bloc.dart';

class NearByRestaurantState extends Equatable {
  final NearByRestaurant nearByRestaurantModel;
  final ApiResponse apiResponse;

  const NearByRestaurantState({
    this.nearByRestaurantModel = const NearByRestaurant(),
    this.apiResponse = const ApiResponse.completed(''),
  });

  NearByRestaurantState copyWith({
    final NearByRestaurant? nearByRestaurantModel,
    final ApiResponse? apiResponse,
  }) {
    return NearByRestaurantState(
      nearByRestaurantModel: nearByRestaurantModel ?? this.nearByRestaurantModel,
      apiResponse: apiResponse ?? this.apiResponse,
    );
  }

  @override
  List<Object> get props => [apiResponse, nearByRestaurantModel];
}
