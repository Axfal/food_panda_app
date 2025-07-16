import 'auth_repository.dart';

/// Implementation of [AuthApiRepository] for making HTTP requests to the authentication API.
class AuthHttpApiRepository implements AuthApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future<UserModel> loginApi(dynamic data) async {
    dynamic response = await _apiServices.postApi(AppUrl.signIn, data);
    return UserModel.fromJson(response);
  }
}
