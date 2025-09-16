import 'package:excellent_trade_app/config/routes/route_export.dart';
import 'package:excellent_trade_app/repository/auth/auth_repository.dart';
import 'package:excellent_trade_app/repository/recommendation/recommendation_api_repo.dart';

class RecommendationHttpApiRepository extends RecommendationApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();
  @override
  Future recommendedItem(dynamic data) async {
    final response = await _apiServices.postApi(AppUrl.recommendedItems, data);
    return response;
  }
}
