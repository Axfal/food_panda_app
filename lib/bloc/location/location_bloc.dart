// ignore_for_file: avoid_print
import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
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
      // 🔹 Step 1: Request permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(state.copyWith(
            apiResponse: const ApiResponse.error("Location permissions are denied"),
          ));
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(state.copyWith(
          apiResponse: const ApiResponse.error(
            "Location permissions are permanently denied",
          ),
        ));
        return;
      }

      // 🔹 Step 2: Get current position
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // 🔹 Step 3: Call API with lat/lng
      final response = await locationApiResponse.locationDetails({
        "lat": position.latitude,
        "lng": position.longitude,
      });

      print("📍 API Response: $response");

      // 🔹 Step 4: Handle response
      if (response != null &&
          response['success'] == true &&
          response['place'] != null) {

        // 👇 FIX: use response['place'] instead of response
        final locationDetails = LocationDetailsModel.fromJson(response['place']);

        await LocationSessionController().saveLocation(locationDetails);

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
      emit(state.copyWith(apiResponse: ApiResponse.error(e.toString())));
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
          emit(
            state.copyWith(
              apiResponse: ApiResponse.error(errorMsg),
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
      emit(
        state.copyWith(apiResponse: ApiResponse.error(e.toString())),
      );
      debugPrint('FetchLocationDetailsEvent error: $e');
    }
  }

}
