import 'package:excellent_trade_app/repository/auth/auth_repository.dart';
import 'package:excellent_trade_app/repository/performance/performance_api_repo.dart';

class PerformanceHttpApiResponse extends PerformanceApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future getPerformance(dynamic data) async {
    final uri = Uri.parse(AppUrl.getPerformance).replace(queryParameters: data);
    final response = await _apiServices.getApi(uri.toString());
    return response;
  }
}
