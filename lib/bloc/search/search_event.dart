part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();
  @override
  List<Object?> get props => [];
}

class FetchSearchResult extends SearchEvent {
  final String query;
  final String lat;
  final String lng;
  const FetchSearchResult({
    required this.query,
    required this.lng,
    required this.lat,
  });
  @override
  List<Object> get props => [query, lat, lng];
}
