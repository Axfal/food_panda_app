part of 'top_restaurant_bloc.dart';

sealed class TopRestaurantEvent extends Equatable {
  const TopRestaurantEvent();
  @override
  List<Object?> get props => [];
}

class FetchTopRestaurantEvent extends TopRestaurantEvent {
  final String lat;
  final String lng;
  final String radius;
  const FetchTopRestaurantEvent({
    required this.lng,
    required this.lat,
    required this.radius,
  });
  @override
  List<Object> get props => [lat, lng, radius];
}
