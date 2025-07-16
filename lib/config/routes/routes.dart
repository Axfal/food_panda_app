

import 'package:excellent_trade_app/config/routes/routes_name.dart';
import 'package:excellent_trade_app/pages/pages_export.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const HomePage());
 case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomePage());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}