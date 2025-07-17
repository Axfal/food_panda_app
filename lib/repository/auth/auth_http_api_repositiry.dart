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
  Future<dynamic> signupApi(data) {
    // TODO: implement signupApi
    throw UnimplementedError();
  }

  @override
  Future logoutApi(data) {
    // TODO: implement logoutApi
    throw UnimplementedError();
  }

  @override
  Future sigInOTP(data) {
    // TODO: implement sigInOTP
    throw UnimplementedError();
  }

  @override
  Future signUp(data) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future verifyOTP(data) {
    // TODO: implement verifyOTP
    throw UnimplementedError();
  }
}
