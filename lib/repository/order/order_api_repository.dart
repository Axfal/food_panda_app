
abstract class OrderApiRepository {
  Future<dynamic> checkout(dynamic data);
  Future<dynamic> getOrders(dynamic data);
}
