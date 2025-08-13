abstract class VendorApiRepository {
  /// Menu Management
  /// Menu Item
  Future<dynamic> fetchMenuItem(String restaurantId, String categoryId);
  Future<dynamic> addMenuItem(dynamic data);
  Future<dynamic> updateMenuItem(dynamic data);
  Future<dynamic> deleteMenuItem();

  /// Menu Category
  Future<dynamic> fetchMenuCategory();
  Future<dynamic> addMenuCategory(dynamic data);
  Future<dynamic> updateMenuCategory(dynamic data);
  Future<dynamic> deleteMenuCategory();
}
