import 'dart:convert';
import 'package:excellent_trade_app/config/routes/route_export.dart';
import 'package:flutter/material.dart';
import '../../model/login/login_model.dart';
import '../storage/local_storage.dart';

class SessionController {
  final LocalStorage sharedPreferenceClass = LocalStorage();

  /// Singleton instance of [SessionController].
  static final SessionController _session = SessionController._internal();

  static bool? isLogin;

  static UserModel user = UserModel();

  SessionController._internal() {
    isLogin = false;
  }

  factory SessionController() {
    return _session;
  }

  Future<void> saveUserInPreference(dynamic user) async {
    sharedPreferenceClass.setValue('token', jsonEncode(user));
    sharedPreferenceClass.setValue('isLogin', 'true');
  }

  Future<void> getUserFromPreference() async {
    try {
      String userData = await sharedPreferenceClass.readValue('token');
      var isLogin = await sharedPreferenceClass.readValue('isLogin');

      if (userData.isNotEmpty) {
        SessionController.user = UserModel.fromJson(jsonDecode(userData));
      }
      SessionController.isLogin = isLogin == 'true' ? true : false;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Clears user session and navigates to login screen.
  Future<void> logoutUser(BuildContext context) async {
    try {
      await sharedPreferenceClass.clearValue('token');
      await sharedPreferenceClass.clearValue('isLogin');
      SessionController.isLogin = false;
      SessionController.user = UserModel(); // Reset user model

      // Navigate to login or onboarding screen
      Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false);
    } catch (e) {
      debugPrint("Logout error: ${e.toString()}");
    }
  }
}
