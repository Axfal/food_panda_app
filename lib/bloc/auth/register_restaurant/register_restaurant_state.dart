part of 'register_restaurant_bloc.dart';

class RegisterRestaurantStates extends Equatable {
  final String? ownerId;
  final File? logo;
  final String restaurantName;
  final String phone;
  final String address;
  final String description;
  final ApiResponse<String> registerRestaurantApi;

  const RegisterRestaurantStates({
    this.logo,
    this.ownerId = '',
    this.restaurantName = '',
    this.phone = '',
    this.address = '',
    this.description = '',
    this.registerRestaurantApi = const ApiResponse.completed(''),
  });

  RegisterRestaurantStates copyWith({
    final File? logo,
    final String? ownerId,
    final String? restaurantName,
    final String? phone,
    final String? address,
    final String? description,
    final ApiResponse<String>? registerRestaurantApi,
  }) {
    return RegisterRestaurantStates(
      restaurantName: restaurantName ?? this.restaurantName,
      logo: logo ?? this.logo,
      ownerId: ownerId ?? this.ownerId,
      phone: phone ?? this.phone,
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
    phone,
    address,
    description,
    registerRestaurantApi,
  ];
}
