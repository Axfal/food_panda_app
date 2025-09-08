import 'dart:convert';
import 'package:excellent_trade_app/config/routes/route_export.dart';
import '../../model/login/login_model.dart';
import '../storage/local_storage.dart';

class SessionController {
  final LocalStorage sharedPreferenceClass = LocalStorage();

  /// Singleton instance of [SessionController].
  static final SessionController _session = SessionController._internal();

  static bool isLogin = false;
  static UserModel user = const UserModel();
  static String userRole = '';
  static int restaurantId = 0;

  SessionController._internal();

  factory SessionController() => _session;

  /// Save user data in local storage
  Future<void> saveUserInPreference(UserModel user) async {
    final String userJson = jsonEncode(user.toJson());

    await sharedPreferenceClass.setValue('user', userJson);
    await sharedPreferenceClass.setValue('isLogin', 'true');
    await sharedPreferenceClass.setValue('role', user.role);
    await sharedPreferenceClass.setValue('restaurantId', user.restaurantId.toString());

    SessionController.user = user;
    SessionController.isLogin = true;
    SessionController.userRole = user.role;
    SessionController.restaurantId = user.restaurantId;
  }

  /// Get user data from local storage
  Future<void> getUserFromPreference() async {
    try {
      final String? userData = await sharedPreferenceClass.readValue('user');
      final String? isLoginStr = await sharedPreferenceClass.readValue('isLogin');
      final String? role = await sharedPreferenceClass.readValue('role');
      final String? restId = await sharedPreferenceClass.readValue('restaurantId');

      if (userData != null && userData.isNotEmpty) {
        SessionController.user = UserModel.fromJson(jsonDecode(userData));
      } else {
        SessionController.user = const UserModel();
      }

      SessionController.isLogin = (isLoginStr == 'true');
      SessionController.userRole = role ?? '';
      SessionController.restaurantId = int.tryParse(restId ?? '0') ?? 0;
    } catch (e) {
      debugPrint('Error loading user from preferences: $e');
      SessionController.isLogin = false;
      SessionController.user = const UserModel();
      SessionController.userRole = '';
      SessionController.restaurantId = 0;
    }
  }

  /// Clear user session (logout)
  Future<void> logoutUser(BuildContext context) async {
    try {
      await sharedPreferenceClass.clearValue('user');
      await sharedPreferenceClass.clearValue('isLogin');
      await sharedPreferenceClass.clearValue('role');
      await sharedPreferenceClass.clearValue('restaurantId');

      SessionController.isLogin = false;
      SessionController.user = const UserModel();
      SessionController.userRole = '';
      SessionController.restaurantId = 0;

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
