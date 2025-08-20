import 'package:excellent_trade_app/repository/category/category_api_repository.dart';
import 'package:excellent_trade_app/repository/category/category_http_api_repository.dart';
import 'package:excellent_trade_app/repository/vendor/restaurant/restaurant_api_repository.dart';
import 'package:excellent_trade_app/repository/vendor/restaurant/restaurant_http_api_repository.dart';
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
  }
}
