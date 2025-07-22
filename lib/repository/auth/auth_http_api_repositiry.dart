import 'auth_repository.dart';

/// Implementation of [AuthApiRepository] for making HTTP requests to the authentication API.
class AuthHttpApiRepository implements AuthApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future<LoginModel> loginApi(dynamic data) async {
    dynamic response = await _apiServices.postApi(AppUrl.signIn, data);
    return LoginModel.fromJson(response);
  }

  @override
  Future<dynamic> signupApi(data) async {
    dynamic response = await _apiServices.postApi(AppUrl.signUp, data);
    return response;
  }

  @override
  Future logoutApi(data) async {
    dynamic response = await _apiServices.postApi(AppUrl.logout, data);
    return response;
  }

  @override
  Future sigInOTP(data) async {
    dynamic response = await _apiServices.postApi(AppUrl.sigInOTP, data);
    return response;
  }

  @override
  Future verifyOTP(data) async {
    dynamic response = await _apiServices.postApi(AppUrl.verifyOTP, data);
    return response;
  }
}
