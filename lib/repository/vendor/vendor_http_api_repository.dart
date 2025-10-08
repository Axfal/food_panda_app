import 'vendor_repository_exports.dart';

class VendorHttpApiRepository implements VendorApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();
  @override
  Future<dynamic> deleteMenuCategory(dynamic data) async {
    final response = await _apiServices.deleteApi(
      AppUrl.deleteMenuCategory,
      data,
    );
    return response;
  }

  @override
  Future<dynamic> deleteMenuItem(dynamic data) async {
    final response = await _apiServices.deleteApi(AppUrl.deleteMenuItem, data);
    return response;
  }

  @override
  Future<dynamic> fetchMenuCategory(dynamic data) async {
    final uri = Uri.parse(AppUrl.getMenuCategory).replace(queryParameters: data);
    final response = await _apiServices.getApi(uri.toString());
    return response;
  }

  @override
  Future<dynamic> fetchMenuItem(String restaurantId, String categoryId) async {
    final response = await _apiServices.getApi(
      "${AppUrl.getMenuItem + restaurantId}&category_id=$categoryId",
    );
    return response;
  }

  @override
  Future<dynamic> updateMenuCategory(data) async {
    final response = await _apiServices.postMultipartApi(
      AppUrl.updateMenuCategory,
      data,
    );
    return response;
  }

  @override
  Future<dynamic> updateMenuItem(dynamic data) async {
    final response = await _apiServices.postMultipartApi(
      AppUrl.updateMenuItem,
      data,
    );
    return response;
  }

  @override
  Future<dynamic> addMenuCategory(dynamic data) async {
    final response = await _apiServices.postMultipartApi(
      AppUrl.addMenuCategory,
      data,
    );
    return response;
  }

  @override
  Future addMenuItem(dynamic data) async {
    final response = await _apiServices.postMultipartApi(
      AppUrl.addMenuItem,
      data,
    );
    return response;
  }

}
