import 'package:excellent_trade_app/repository/location/location_api_response.dart';

import '../repository/location/location_https_api_response.dart';
import 'dependency_injection.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {
  void servicesLocator() {
    getIt.registerLazySingleton<AuthApiRepository>(
      () => AuthHttpApiRepository(),
    );
    getIt.registerLazySingleton<VendorApiRepository>(
      () => VendorHttpApiRepository(),
    );
    getIt.registerLazySingleton<RestaurantApiRepository>(
      () => RestaurantHttpApiRepository(),
    );
    getIt.registerLazySingleton<CategoryApiRepository>(
      () => CategoryHttpApiRepository(),
    );
    getIt.registerLazySingleton<ProfileApiRepository>(
      () => ProfileHttpApiResponse(),
    );
    getIt.registerLazySingleton<LocationApiResponse>(
      () => LocationHttpApiResponse(),
    );
  }
}
