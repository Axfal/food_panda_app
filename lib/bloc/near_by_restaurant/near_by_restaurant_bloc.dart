// ignore_for_file: avoid_print

import 'package:excellent_trade_app/dependency_injection/dependency_injection.dart';
import '../../model/near_by_restaurant/near_by_restaurant.dart';
import '../../pages/auth/login/login_exports.dart';

part 'near_by_restaurant_event.dart';
part 'near_by_restaurant_state.dart';

class NearByRestaurantBloc
    extends Bloc<NearByRestaurantEvent, NearByRestaurantState> {
  final RestaurantApiRepository restaurantApiRepository;

  NearByRestaurantBloc({required this.restaurantApiRepository})
    : super(const NearByRestaurantState()) {
    on<FetchNearByRestaurantEvent>(_onFetchNearByRestaurant);
  }

  Future<void> _onFetchNearByRestaurant(
    FetchNearByRestaurantEvent event,
    Emitter<NearByRestaurantState> emit,
  ) async {
    emit(state.copyWith(apiResponse: ApiResponse.loading()));

    try {
      final Map<String, dynamic> data = {
        "lat": "31.15060600", // event.lat.toString(),
        "lng": "73.91907590", //event.lng.toString(),
        "radius": "5",
        "limit": "10",
        "offset": "0",
      };

      final response = await restaurantApiRepository.nearByRestaurant(data);
      final respo = {
        "success": true,
        "count": 3,
        "radius": 5,
        "limit": 10,
        "offset": 0,
        "restaurants": [
          {
            "id": 60,
            "owner_id": 10,
            "name": "anfal....",
            "description": "demo",
            "phone": "03418410597",
            "logo": null,
            "status": "closed",
            "hours": "Mon-Fri 10:00 AM - 9:00 PM",
            "rating": "0.0",
            "lat": "31.52088860",
            "lng": "74.27005210",
            "distance": 9.493529796600342e-5
          },
          {
            "id": 6,
            "owner_id": 10,
            "name": "anfal....",
            "description": "demo",
            "phone": "03418410597",
            "logo": "https://itgenesis.space/Panda_API/API/uploads/logos/logo_68a2f88b7af861.04042819.png",
            "status": "open",
            "hours": "Mon-Fri 10:00 AM - 9:00 PM",
            "rating": "0.0",
            "lat": "31.52088860",
            "lng": "74.27005210",
            "distance": 9.493529796600342e-5
          },
          {
            "id": 63,
            "owner_id": 10,
            "name": "NFC NEW demo",
            "description": "Best Fast food",
            "phone": "03418410597",
            "logo": null,
            "status": "open",
            "hours": "3",
            "rating": "0.0",
            "lat": "31.52088860",
            "lng": "74.27005210",
            "distance": 9.493529796600342e-5
          },
       {
            "id": 63,
            "owner_id": 10,
            "name": "NFC NEW demo",
            "description": "Best Fast food",
            "phone": "03418410597",
            "logo": null,
            "status": "open",
            "hours": "3",
            "rating": "0.0",
            "lat": "31.52088860",
            "lng": "74.27005210",
            "distance": 9.493529796600342e-5
          }
        ]
      };

      if (response != null) {
        final model = NearByRestaurant.fromJson(respo);

        print(model);

        if (model.success == true) {
          emit(
            state.copyWith(
              apiResponse: ApiResponse.completed('fetched successfully'),
              nearByRestaurantModel: model,
            ),
          );
        } else {
          emit(
            state.copyWith(
              apiResponse: ApiResponse.error(
                response['error'] ?? "Error while fetching nearby restaurant",
              ),
            ),
          );
        }
      } else {
        print('No response from server');
        emit(
          state.copyWith(
            apiResponse: ApiResponse.error("No response from server"),
          ),
        );
      }
    } catch (e, stack) {
      print('Error: $e');
      print(stack);
      emit(
        state.copyWith(
          apiResponse: ApiResponse.error("Something went wrong: $e"),
        ),
      );
    }
  }
}
