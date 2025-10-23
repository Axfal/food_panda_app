// ignore_for_file: avoid_print

import 'package:excellent_trade_app/repository/auth/auth_repository.dart';
import 'package:excellent_trade_app/repository/banner/banner_api_repository.dart';

class BannerHttpApiRepository extends BannerApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future getBannersResponse() async {
    try {
      final response = await _apiServices.getApi(AppUrl.banner);
      return response;
    } catch (e) {
      print('error: $e');
      rethrow;
    }
  }
}
