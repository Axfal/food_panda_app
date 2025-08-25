import 'package:excellent_trade_app/repository/auth/auth_repository.dart';
import 'package:excellent_trade_app/repository/restaurant/restaurant_api_repository.dart';

class RestaurantHttpApiRepository implements RestaurantApiRepository {
  final BaseApiServices _networkServices = NetworkApiService();
  @override
  Future addRestaurant(dynamic data) async {
    final response = await _networkServices.postMultipartApi(
      AppUrl.registerRestaurant,
      data,
    );
    return response;
  }

  @override
  Future<dynamic> deleteRestaurant(dynamic data) async {
    final response = await _networkServices.deleteApi(
      AppUrl.deleteRestaurant,
      data,
    );
    return response;
  }

  @override
  Future fetchRestaurant(String ownerId) async {
    final response = await _networkServices.getApi(
      AppUrl.getRestaurant + ownerId,
    );
    return response;
  }

  @override
  Future updateRestaurant(dynamic data) async {
    final response = await _networkServices.postMultipartApi(
      AppUrl.updateRestaurant,
      data,
    );
    return response;
  }

  @override
  Future restaurantByCategory(String categoryId) async {
    final response = await _networkServices.getApi(AppUrl.restaurantByCategory + categoryId);
    return response;
  }

  @override
  Future restaurantMenu(String restaurantId) async{
    final response = await _networkServices.getApi(AppUrl.restaurantMenu + restaurantId);
    return response;
  }
}
