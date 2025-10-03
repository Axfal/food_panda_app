// ignore_for_file: avoid_print
import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/model/google_map_location_details_model/google_map_api_model.dart';
import 'package:excellent_trade_app/model/location/location_details/locations_details_model.dart';
import '../../config/routes/route_export.dart';
import '../../model/location/location_suggestion/location_suggestion_model.dart';
import '../../repository/location/location_api_response.dart';
import '../../service/location/location_storage.dart';
import 'package:geolocator/geolocator.dart';
part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationApiResponse locationApiResponse;

  LocationBloc({required this.locationApiResponse})
    : super(const LocationState()) {
    on<FetchLocationSuggestionEvent>(_onFetchLocationSuggestionEvent);
    on<FetchLocationDetailsEvent>(_onFetchLocationDetailsEvent);
    on<GetCurrentLocationEvent>(_onGetCurrentLocationEvent);
  }

  Future<void> _onGetCurrentLocationEvent(
    GetCurrentLocationEvent event,
    Emitter<LocationState> emit,
  ) async {
    emit(state.copyWith(apiResponse: const ApiResponse.loading()));

    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(
            state.copyWith(
              apiResponse: const ApiResponse.error(
                "Location permissions are denied",
              ),
            ),
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(
          state.copyWith(
            apiResponse: const ApiResponse.error(
              "Location permissions are permanently denied",
            ),
          ),
        );
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      print("lat: ${position.latitude}");
      print("lat: ${position.longitude}");

      final lat = position.latitude;
      final lng = position.longitude;
      final response = await locationApiResponse.googleMapLocationDetails(
        lat,
        lng,
      );

      if (response != null &&
          response['results'] != null &&
          (response['results'] as List).isNotEmpty) {
        final googleMapLocationDetails = GoogleMapApiModel.fromJson(response);

        final firstResult = googleMapLocationDetails.results!.first;
        final locationDetails = LocationDetailsModel(
          success: true,
          place: Place(
            placeId: firstResult.placeId ?? '',
            address: firstResult.formattedAddress ?? '',
            lat: firstResult.geometry?.location?.lat ?? 0.0,
            lng: firstResult.geometry?.location?.lng ?? 0.0,
            name: '', // Google API doesn't provide name directly
          ),
        );

        await LocationSessionController().saveLocation(locationDetails);
        await LocationSessionController().saveGoogleMapLocation(
          googleMapLocationDetails,
        );

        emit(
          state.copyWith(
            locationDetailsModel: locationDetails,
            apiResponse: const ApiResponse.completed(
              'Current location fetched',
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            apiResponse: ApiResponse.error(
              response?['error'] ?? 'Failed to fetch current location',
            ),
          ),
        );
      }
    } catch (e) {
      print('error: $e');
    }
  }

  Future<void> _onFetchLocationSuggestionEvent(
    FetchLocationSuggestionEvent event,
    Emitter<LocationState> emit,
  ) async {
    emit(state.copyWith(apiResponse: const ApiResponse.loading()));

    final Map<String, dynamic> data = {"query": event.query};

    try {
      final response = await locationApiResponse.locationSuggestion(data);

      if (response != null) {
        if (response['success'] == true && response['suggestions'] != null) {
          emit(
            state.copyWith(
              locationSuggestionModel: LocationSuggestionModel.fromJson(
                response,
              ),
              apiResponse: const ApiResponse.completed('Completed'),
            ),
          );
        } else {
          emit(
            state.copyWith(
              apiResponse: ApiResponse.error(
                response['error'] ?? 'Unknown error',
              ),
            ),
          );
        }
      } else {
        emit(
          state.copyWith(
            apiResponse: const ApiResponse.error('No response from server'),
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(apiResponse: ApiResponse.error(e.toString())));
      print('error: $e');
    }
  }

  Future<void> _onFetchLocationDetailsEvent(
    FetchLocationDetailsEvent event,
    Emitter<LocationState> emit,
  ) async {
    emit(state.copyWith(apiResponse: const ApiResponse.loading()));

    final Map<String, dynamic> data = {"place_id": event.placeId};

    try {
      final response = await locationApiResponse.locationDetails(data);

      if (response != null) {
        if (response['success'] == true && response['place'] != null) {
          final locationDetails = LocationDetailsModel.fromJson(response);

          await LocationSessionController().saveLocation(locationDetails);

          emit(
            state.copyWith(
              locationDetailsModel: locationDetails,
              apiResponse: const ApiResponse.completed('Successfully fetched'),
            ),
          );
        } else {
          final errorMsg = response['error'] ?? 'Unknown error';
          emit(state.copyWith(apiResponse: ApiResponse.error(errorMsg)));
        }
      } else {
        emit(
          state.copyWith(
            apiResponse: const ApiResponse.error('No response from server'),
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(apiResponse: ApiResponse.error(e.toString())));
      debugPrint('FetchLocationDetailsEvent error: $e');
    }
  }
}
