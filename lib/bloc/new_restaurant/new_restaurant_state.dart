part of 'new_restaurant_bloc.dart';

class NewRestaurantState extends Equatable {
  final NewRestaurantModel newRestaurantModel;
  final ApiResponse apiResponse;
  const NewRestaurantState({
    this.newRestaurantModel = const NewRestaurantModel(),
    this.apiResponse = const ApiResponse.completed(''),
  });

  NewRestaurantState copyWith({
    final NewRestaurantModel? newRestaurantModel,
    final ApiResponse? apiResponse,
  }) {
    return NewRestaurantState(
      newRestaurantModel: newRestaurantModel ?? this.newRestaurantModel,
      apiResponse: apiResponse ?? this.apiResponse,
    );
  }

  @override
  List<Object> get props => [apiResponse, newRestaurantModel];
}
