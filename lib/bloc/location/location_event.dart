part of 'location_bloc.dart';

sealed class LocationEvent extends Equatable {
  const LocationEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchLocationSuggestionEvent extends LocationEvent {
  final String query;
  const FetchLocationSuggestionEvent({required this.query});
  @override
  // TODO: implement props
  List<Object?> get props => [query];
}

class FetchLocationDetailsEvent extends LocationEvent {
  final String placeId;
  const FetchLocationDetailsEvent({required this.placeId});
  @override
  List<Object> get props => [placeId];
}
