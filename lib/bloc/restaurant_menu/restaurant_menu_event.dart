part of 'restaurant_menu_bloc.dart';

sealed class RestaurantMenuEvent extends Equatable {
  const RestaurantMenuEvent();

  @override
  List<Object?> get props => [];
}

class FetchRestaurantMenuEvent extends RestaurantMenuEvent {
  final int restaurantId;

  const FetchRestaurantMenuEvent({required this.restaurantId});

  @override
  List<Object?> get props => [restaurantId];
}
