part of 'register_restaurant_bloc.dart';

class RegisterRestaurantStates extends Equatable {
  final File? logo;
  final String restaurantName;
  final String phone;
  final String address;
  final String description;
  final ApiResponse<String> registerRestaurantApi;

  const RegisterRestaurantStates({
    this.logo,
    this.restaurantName = '',
    this.phone = '',
    this.address = '',
    this.description = '',
    this.registerRestaurantApi = const ApiResponse.completed(''),
  });

  @override
  List<Object?> get props => [
    logo,
    restaurantName,
    phone,
    address,
    description,
    registerRestaurantApi,
  ];
}
