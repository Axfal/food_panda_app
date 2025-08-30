import 'package:excellent_trade_app/repository/auth/auth_repository.dart';
import 'package:excellent_trade_app/repository/search/search_api_response.dart';

class SearchHttpApiRepository extends SearchApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();
  @override
  Future<dynamic> search(dynamic data) async {
    final uri = Uri.parse(AppUrl.search).replace(queryParameters: data);
    final response = await _apiServices.getApi(uri.toString());
    return response;
  }
}
