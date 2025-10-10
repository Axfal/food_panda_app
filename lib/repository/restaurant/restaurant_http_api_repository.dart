import 'restaurant_exports.dart';

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
  Future restaurantByCategory(dynamic data) async {
    final uri = Uri.parse(
      AppUrl.restaurantByCategory,
    ).replace(queryParameters: data);
    final response = await _networkServices.getApi(uri.toString());
    return response;
  }

  @override
  Future restaurantMenu(String restaurantId) async {
    final response = await _networkServices.getApi(
      AppUrl.restaurantMenu + restaurantId,
    );
    return response;
  }

  @override
  Future newRestaurant(dynamic data) async {
    final uri = Uri.parse(AppUrl.newRestaurant).replace(queryParameters: data);
    final response = await _networkServices.getApi(uri.toString());
    return response;
  }

  @override
  Future nearByRestaurant(dynamic data) async {
    final uri = Uri.parse(
      AppUrl.nearByRestaurant,
    ).replace(queryParameters: data);
    final response = await _networkServices.getApi(uri.toString());
    return response;
  }

  @override
  Future topRestaurant(data) async {
    final response = await _networkServices.postApi(AppUrl.topRestaurant, data);
    return response;
  }

  @override
  Future restaurantMenuItem(data) async {
    final uri = Uri.parse(
      AppUrl.getRestaurantMenuItem,
    ).replace(queryParameters: data);
    try {
      final response = await _networkServices.getApi(uri.toString());
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
