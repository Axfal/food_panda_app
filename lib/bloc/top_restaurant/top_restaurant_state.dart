part of 'top_restaurant_bloc.dart';

class TopRestaurantState extends Equatable {
  final ApiResponse<String> apiResponse;
  final TopRestaurantModel topRestaurantModel;

  const TopRestaurantState({
    this.apiResponse = const ApiResponse.completed(''),
    this.topRestaurantModel = const TopRestaurantModel(),
  });

  TopRestaurantState copyWith({
    final ApiResponse<String>? apiResponse,
    final TopRestaurantModel? topRestaurantModel,
  }) {
    return TopRestaurantState(
      apiResponse: apiResponse ?? this.apiResponse,
      topRestaurantModel: topRestaurantModel ?? this.topRestaurantModel,
    );
  }

  @override
  List<Object> get props => [topRestaurantModel, apiResponse];
}
