part of 'location_bloc.dart';

class LocationState extends Equatable {
  final LocationSuggestionModel locationSuggestionModel;
  final ApiResponse apiResponse;

  const LocationState({
    this.locationSuggestionModel = const LocationSuggestionModel(),
    this.apiResponse = const ApiResponse.completed(''),
  });

  LocationState copyWith({
    LocationSuggestionModel? locationSuggestionModel,
    ApiResponse? apiResponse,
  }) {
    return LocationState(
      locationSuggestionModel:
      locationSuggestionModel ?? this.locationSuggestionModel,
      apiResponse: apiResponse ?? this.apiResponse,
    );
  }

  @override
  List<Object> get props => [locationSuggestionModel, apiResponse];
}
