import 'package:excellent_trade_app/data/network/network.dart';
import 'package:excellent_trade_app/repository/wish_list/wish_list_api_repository.dart';

import '../../utils/constants/app_urls.dart';

class WishListHttpApiRepository extends WishListApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();
  @override
  Future addWishList(dynamic data) async{
    final response = await _apiServices.postApi(AppUrl.wishList, data);
    return response;
  }

  @override
  Future fetchWishList(dynamic data) async {
    final uri = Uri.parse(AppUrl.wishList).replace(queryParameters: data);
    final response = await _apiServices.getApi(uri.toString());
    return response;
  }

  @override
  Future removeWishList(dynamic data) async{
    final response = await _apiServices.postApi(AppUrl.wishList, data);
    return response;
  }
}
