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
  }
}
