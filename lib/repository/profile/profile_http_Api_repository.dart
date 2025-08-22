import 'profile_repository_exports.dart';

class ProfileHttpApiResponse implements ProfileApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();
  @override
  Future getProfile(String id) async {
    final response = _apiServices.getApi(AppUrl.getProfile + id);
    return response;
  }

  @override
  Future updateProfile(dynamic data) async {
    final response = _apiServices.postMultipartApi(AppUrl.updateProfile, data);
    return response;
  }
}
