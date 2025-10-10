abstract class RestaurantApiRepository {
  Future<dynamic> fetchRestaurant(String ownerId);
  Future<dynamic> addRestaurant(dynamic data);
  Future<dynamic> updateRestaurant(dynamic data);
  Future<dynamic> deleteRestaurant(dynamic data);
  Future<dynamic> restaurantByCategory(dynamic data);
  Future<dynamic> restaurantMenu(String restaurantId);
  Future<dynamic> restaurantMenuItem(dynamic data);
  Future<dynamic> newRestaurant(dynamic data);
  Future<dynamic> nearByRestaurant(dynamic data);
  Future<dynamic> topRestaurant(dynamic data);
}
