part of 'near_by_restaurant_bloc.dart';

sealed class NearByRestaurantEvent extends Equatable {
  const NearByRestaurantEvent();

  @override
  List<Object?> get props => [];
}

class FetchNearByRestaurantEvent extends NearByRestaurantEvent {
  final String lat;
  final String lng;

  const FetchNearByRestaurantEvent({
    required this.lat,
    required this.lng,
  });

  @override
  List<Object?> get props => [lat, lng];
}
