import 'category_exports.dart';

class CategoryHttpApiRepository implements CategoryApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();
  @override
  Future fetchCategories() async {
    final response = await _apiServices.getApi(AppUrl.getCategories);
    return response;
  }
}
