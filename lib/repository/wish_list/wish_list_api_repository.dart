abstract class WishListApiRepository {
  Future<dynamic> fetchWishList(dynamic data);
  Future<dynamic> removeWishList(dynamic data);
  Future<dynamic> addWishList(dynamic data);
}
