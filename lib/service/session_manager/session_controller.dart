import 'dart:convert';
import 'package:excellent_trade_app/config/routes/route_export.dart';
import '../../model/login/login_model.dart';
import '../storage/local_storage.dart';

class SessionController {
  final LocalStorage sharedPreferenceClass = LocalStorage();

  /// Singleton instance of [SessionController].
  static final SessionController _session = SessionController._internal();

  static bool isLogin = false;

  static UserModel user = UserModel();

  static String userRole = '';

  SessionController._internal();

  factory SessionController() => _session;

  Future<void> saveUserInPreference(UserModel user) async {
    final String userJson = jsonEncode(user.toJson());
    await sharedPreferenceClass.setValue('token', userJson);
    await sharedPreferenceClass.setValue('isLogin', 'true');

    await sharedPreferenceClass.setValue('role', user.role);
    userRole = user.role;
  }

  Future<void> getUserFromPreference() async {
    try {
      final String userData = await sharedPreferenceClass.readValue('token');
      final String? isLoginStr = await sharedPreferenceClass.readValue(
        'isLogin',
      );
      final String? role = await sharedPreferenceClass.readValue('role');

      if (userData.isNotEmpty) {
        SessionController.user = UserModel.fromJson(jsonDecode(userData));
      } else {
        SessionController.user = UserModel();
      }

      SessionController.isLogin = (isLoginStr == 'true');
      SessionController.userRole = role ?? '';
    } catch (e) {
      debugPrint('Error loading user from preferences: $e');
      SessionController.isLogin = false;
      SessionController.user = UserModel();
      SessionController.userRole = '';
    }
  }

  Future<void> logoutUser(BuildContext context) async {
    try {
      await sharedPreferenceClass.clearValue('token');
      await sharedPreferenceClass.clearValue('isLogin');
      await sharedPreferenceClass.clearValue('role');

      SessionController.isLogin = false;
      SessionController.user = UserModel();
      SessionController.userRole = '';

      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesName.login,
        (route) => false,
      );
    } catch (e) {
      debugPrint("Logout error: $e");
    }
  }
}
