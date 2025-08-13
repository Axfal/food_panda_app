import 'package:excellent_trade_app/repository/vendor/vendor_api_repository.dart';
import 'package:excellent_trade_app/repository/vendor/vendor_http_api_repository.dart';

import 'dependency_injection.dart';

// GetIt is a package used for service locator or to manage dependency injection
GetIt getIt = GetIt.instance;

class ServiceLocator {
  void servicesLocator() {
    getIt.registerLazySingleton<AuthApiRepository>(() => AuthHttpApiRepository());
    getIt.registerLazySingleton<VendorApiRepository>(() => VendorHttpApiRepository());
  }

}