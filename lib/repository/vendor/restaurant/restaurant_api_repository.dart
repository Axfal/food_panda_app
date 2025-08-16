abstract class RestaurantApiRepository{
  Future<dynamic> fetchRestaurant(String ownerId);
  Future<dynamic> addRestaurant(dynamic data);
  Future<dynamic> updateRestaurant(dynamic data);
  Future<dynamic> deleteRestaurant(dynamic data);
}