part of 'restaurant_bloc.dart';

class RestaurantStates extends Equatable {
  final String? ownerId;
  final String? placeId;
  final String? lat;
  final String? lng;
  final File? logo;
  final String restaurantName;
  final String phone;
  final String address;
  final String hours;
  final String description;
  final List<Restaurant>? restaurants;
  final List<int>? selectedCategoryIds;
  final ApiResponse<String> registerRestaurantApi;

  const RestaurantStates({
    this.logo,
    this.ownerId = '',
    this.restaurantName = '',
    this.phone = '',
    this.hours = '',
    this.placeId = '',
    this.lat = '',
    this.lng = '',
    this.address = '',
    this.description = '',
    this.restaurants = const [],
    this.selectedCategoryIds = const [],
    this.registerRestaurantApi = const ApiResponse.completed(''),
  });

  RestaurantStates copyWith({
    final File? logo,
    final String? ownerId,
    final String? placeId,
    final String? lat,
    final String? lng,
    final String? restaurantName,
    final String? phone,
    final String? hours,
    final String? address,
    final List<int>? selectedCategoryIds,
    final String? description,
    final List<Restaurant>? restaurants,
    final ApiResponse<String>? registerRestaurantApi,
  }) {
    return RestaurantStates(
      restaurantName: restaurantName ?? this.restaurantName,
      logo: logo ?? this.logo,
      ownerId: ownerId ?? this.ownerId,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      placeId: placeId ?? this.placeId,
      phone: phone ?? this.phone,
      hours: hours ?? this.hours,
      selectedCategoryIds: selectedCategoryIds ?? this.selectedCategoryIds,
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
    lng,
    lat,
    placeId,
    restaurants,
    hours,
    phone,
    address,
    description,
    selectedCategoryIds,
    registerRestaurantApi,
  ];
}
