import 'package:excellent_trade_app/model/login/login_model.dart';

/// Abstract class defining methods for authentication API repositories.
abstract class AuthApiRepository {
  Future<dynamic> loginApi(dynamic data);

  Future<dynamic> signupApi(dynamic data);

  Future<dynamic> logoutApi(dynamic data);

  Future<dynamic> verifyOTP(dynamic data);

  Future<dynamic> sigInOTP(dynamic data);
}
