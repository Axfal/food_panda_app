import 'package:excellent_trade_app/repository/location/location_api_response.dart';
import 'package:excellent_trade_app/repository/order/order_api_repository.dart';
import 'package:excellent_trade_app/repository/order/order_http_api_repository.dart';
import 'package:excellent_trade_app/repository/search/search_api_response.dart';
import 'package:excellent_trade_app/repository/search/search_http_api_response.dart';
import 'package:excellent_trade_app/repository/wish_list/wish_list_api_repository.dart';
import 'package:excellent_trade_app/repository/wish_list/wish_list_http_api_repository.dart';
import '../repository/location/location_https_api_response.dart';
import '../service/web_socket_service/web_socket_service.dart';
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
    getIt.registerLazySingleton<SearchApiRepository>(
      () => SearchHttpApiRepository(),
    );
    getIt.registerLazySingleton<WishListApiRepository>(
      () => WishListHttpApiRepository(),
    );
    getIt.registerLazySingleton<OrderApiRepository>(
      () => OrderHttpApiRepository(),
    );
    getIt.registerLazySingleton<WebSocketService>(
          () => WebSocketService(url: "wss://itgenesis.space/ws/")..connect(),
    );
  }
}
