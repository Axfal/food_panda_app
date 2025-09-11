import 'package:excellent_trade_app/repository/auth/auth_repository.dart';
import 'package:excellent_trade_app/repository/income/income_api_repository.dart';

class IncomeHttpApiResponse extends IncomeApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future<dynamic> getIncome(dynamic data) async {
    try {
      final uri = Uri.parse(AppUrl.getIncome).replace(queryParameters: data);
      final response = await _apiServices.getApi(uri.toString());
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
