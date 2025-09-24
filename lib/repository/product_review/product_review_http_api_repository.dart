import 'package:excellent_trade_app/repository/auth/auth_repository.dart';
import 'package:excellent_trade_app/repository/product_review/product_review_api_repository.dart';

class ProductReviewHttpApiRepository extends ProductReviewApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();
  @override
  Future getProductReview(dynamic data) async {
    final uri = Uri.parse(
      AppUrl.getProductReview,
    ).replace(queryParameters: data);
    final response = await _apiServices.getApi(uri.toString());
    return response;
  }
}
