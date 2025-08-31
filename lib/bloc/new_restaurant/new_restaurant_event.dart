part of 'new_restaurant_bloc.dart';

sealed class NewRestaurantEvent extends Equatable {
  const NewRestaurantEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchNewRestaurantEvent extends NewRestaurantEvent {
  final String lat;
  final String lng;
  const FetchNewRestaurantEvent({required this.lng, required this.lat});
  @override
  // TODO: implement props
  List<Object?> get props => [lat, lng];
}
