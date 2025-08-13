import 'vendor_repository_exports.dart';

class VendorHttpApiRepository implements VendorApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();
  @override
  Future<dynamic> deleteMenuCategory() async {}

  @override
  Future<dynamic> deleteMenuItem() async {}

  @override
  Future<dynamic> fetchMenuCategory() async {
    final response = await _apiServices.getApi(AppUrl.getMenuCategory);
    return response;
  }

  @override
  Future<dynamic> fetchMenuItem(String restaurantId, String categoryId) async {
    final response = await _apiServices.getApi("${AppUrl.getMenuItem + restaurantId}&category_id=$categoryId");
    return response;
  }

  @override
  Future<dynamic> updateMenuCategory(data) async {}

  @override
  Future<dynamic> updateMenuItem(dynamic data) async {}

  @override
  Future<dynamic> addMenuCategory(dynamic data) async {}

  @override
  Future addMenuItem(dynamic data) async {}
}
