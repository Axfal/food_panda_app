part of 'restaurant_bloc.dart';

class RestaurantStates extends Equatable {
  final String? ownerId;
  final File? logo;
  final String restaurantName;
  final String phone;
  final String address;
  final String hours;
  final String description;
  final List<Restaurant>? restaurants;
  final ApiResponse<String> registerRestaurantApi;

  const RestaurantStates({
    this.logo,
    this.ownerId = '',
    this.restaurantName = '',
    this.phone = '',
    this.hours = '',
    this.address = '',
    this.description = '',
    this.restaurants = const [],
    this.registerRestaurantApi = const ApiResponse.completed(''),
  });

  RestaurantStates copyWith({
    final File? logo,
    final String? ownerId,
    final String? restaurantName,
    final String? phone,
    final String? hours,
    final String? address,
    final String? description,
    final List<Restaurant>? restaurants,
    final ApiResponse<String>? registerRestaurantApi,
  }) {
    return RestaurantStates(
      restaurantName: restaurantName ?? this.restaurantName,
      logo: logo ?? this.logo,
      ownerId: ownerId ?? this.ownerId,
      phone: phone ?? this.phone,
      hours: hours ?? this.hours,
      restaurants: restaurants ?? this.restaurants,
      address: address ?? this.address,
      description: description ?? this.description,
      registerRestaurantApi:
          registerRestaurantApi ?? this.registerRestaurantApi,
    );
  }

  @override
  List<Object?> get props => [
    logo,
    restaurantName,
    ownerId,
    restaurants,
    hours,
    phone,
    address,
    description,
    registerRestaurantApi,
  ];
}
