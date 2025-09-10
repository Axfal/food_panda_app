import 'package:excellent_trade_app/data/network/network.dart';
import 'package:excellent_trade_app/utils/constants/app_urls.dart';
import 'order_api_repository.dart';

class OrderHttpApiRepository extends OrderApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();
  @override
  Future checkout(dynamic data) async {
    final response = await _apiServices.postApi(AppUrl.checkout, data);
    return response;
  }

  @override
  Future getOrders(dynamic data) async {
    final uri = Uri.parse(AppUrl.getOrders).replace(queryParameters: data);
    final response = await _apiServices.getApi(uri.toString());
    return response;
  }

  @override
  Future updateStatus(dynamic data) async {
    final response = await _apiServices.postApi(AppUrl.updateStatus, data);
    return response;
  }
}
