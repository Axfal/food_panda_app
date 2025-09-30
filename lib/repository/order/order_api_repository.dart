abstract class OrderApiRepository {
  Future<dynamic> checkout(dynamic data);
  Future<dynamic> getOrders(dynamic data);
  Future<dynamic> updateStatus(dynamic data);
  Future<dynamic> getCustomerOrderHistory(dynamic data);
}
