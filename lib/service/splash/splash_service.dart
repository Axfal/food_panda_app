import 'dart:async';
import 'package:flutter/material.dart';
import '../../config/routes/routes_name.dart';
import '../session_manager/session_controller.dart';

/// A class containing services related to the splash screen.
class SplashServices {
  void checkAuthentication(BuildContext context) async {
    SessionController()
        .getUserFromPreference()
        .then((value) async {
          if (SessionController.isLogin ?? false) {
            Timer(
              const Duration(seconds: 2),
              () => Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesName.home,
                (route) => false,
              ),
            );
          } else {
            Timer(
              const Duration(seconds: 2),
              () => Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesName.login, // login
                (route) => false,
              ),
            );
          }
        })
        .onError((error, stackTrace) {
          Timer(
            const Duration(seconds: 2),
            () => Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesName.login,
              (route) => false,
            ),
          );
        });
  }
}
