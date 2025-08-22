import 'auth_repository.dart';

class AuthHttpApiRepository implements AuthApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future<dynamic> loginApi(dynamic data) async {
    final response = await _apiServices.postApi(AppUrl.signIn, data);
    return response;
  }

  @override
  Future<dynamic> signupApi(dynamic data) async {
    dynamic response = await _apiServices.postApi(AppUrl.signUp, data);
    return response;
  }

  @override
  Future logoutApi(dynamic data) async {
    dynamic response = await _apiServices.postApi(AppUrl.logout, data);
    return response;
  }

  @override
  Future sigInOTP(dynamic data) async {
    dynamic response = await _apiServices.postApi(AppUrl.sigInOTP, data);
    return response;
  }

  @override
  Future verifyOTP(dynamic data) async {
    dynamic response = await _apiServices.postApi(AppUrl.verifyOTP, data);
    return response;
  }
}
