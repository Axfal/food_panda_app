// ignore_for_file: avoid_print
import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/model/location/location_details/locations_details_model.dart';
import '../../config/routes/route_export.dart';
import '../../model/location/location_suggestion/location_suggestion_model.dart';
import '../../repository/location/location_api_response.dart';
import '../../service/location/location_storage.dart';
part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationApiResponse locationApiResponse;

  LocationBloc({required this.locationApiResponse})
    : super(const LocationState()) {
    on<FetchLocationSuggestionEvent>(_onFetchLocationSuggestionEvent);
    on<FetchLocationDetailsEvent>(_onFetchLocationDetailsEvent);
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
