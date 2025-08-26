part of 'location_bloc.dart';

class LocationState extends Equatable {
  final LocationSuggestionModel locationSuggestionModel;
  final LocationDetailsModel locationDetailsModel;
  final ApiResponse apiResponse;

  const LocationState({
    this.locationDetailsModel = const LocationDetailsModel(),
    this.locationSuggestionModel = const LocationSuggestionModel(),
    this.apiResponse = const ApiResponse.completed(''),
  });

  LocationState copyWith({
    LocationSuggestionModel? locationSuggestionModel,
    LocationDetailsModel? locationDetailsModel,
    ApiResponse? apiResponse,
  }) {
    return LocationState(
      locationDetailsModel: locationDetailsModel ?? this.locationDetailsModel,
      locationSuggestionModel:
          locationSuggestionModel ?? this.locationSuggestionModel,
      apiResponse: apiResponse ?? this.apiResponse,
    );
  }

  @override
  List<Object> get props => [
    locationSuggestionModel,
    locationDetailsModel,
    apiResponse,
  ];
}
