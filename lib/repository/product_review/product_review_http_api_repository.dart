// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:excellent_trade_app/repository/auth/auth_repository.dart';
import 'package:excellent_trade_app/repository/product_review/product_review_api_repository.dart';

class ProductReviewHttpApiRepository extends ProductReviewApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future<dynamic> getProductReview(dynamic data) async {
    final uri = Uri.parse(AppUrl.getProductReview)
        .replace(queryParameters: data);

    final response = await _apiServices.getApi(uri.toString());
    return response;
  }

  @override
  Future<dynamic> addProductReview(dynamic data) async {
    try {
      final response =
      await _apiServices.postApi(AppUrl.addProductReview, data);
      return response;
    } catch (e) {
      debugPrint('Error adding product review: $e');
      rethrow;
    }
  }
}
