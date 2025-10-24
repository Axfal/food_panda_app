// ignore_for_file: avoid_print

import 'package:excellent_trade_app/data/network/network.dart';
import 'package:excellent_trade_app/repository/chat/chat_api_repository.dart';

import '../../utils/constants/app_urls.dart';

class ChatHttpApiRepository extends ChatApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future getConservation(dynamic data) async {
    try {
      final uri = Uri.parse(AppUrl.chat).replace(queryParameters: data);
      final response = await _apiServices.getApi(uri.toString());
      return response;
    } catch (e) {
      print('error: $e');
      rethrow;
    }
  }

  @override
  Future message(data) async {
    try {
      final uri = Uri.parse(AppUrl.chat).replace(queryParameters: data);
      final response = await _apiServices.getApi(uri.toString());
      return response;
    } catch (e) {
      print('error: $e');
      rethrow;
    }
  }

  @override
  Future getMessage(data) async {
    try {
      final uri = Uri.parse(AppUrl.chat).replace(queryParameters: data);
      final response = await _apiServices.getApi(uri.toString());
      return response;
    } catch (e) {
      print('error: $e');
      rethrow;
    }
  }
}
