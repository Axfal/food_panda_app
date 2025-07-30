import 'package:excellent_trade_app/config/routes/route_export.dart';
import 'package:excellent_trade_app/pages/product_detail/checkout_screen.dart';


class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashView(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        );
      case RoutesName.signup:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SignupScreen(),
        );
      case RoutesName.forgot:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ForgotScreen(),
        );
       case RoutesName.verifyOtp:
        return MaterialPageRoute(
            builder: (BuildContext context) => const VerifyOtpScreen()
        );
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomePage()
        );
      case RoutesName.productDetails:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ProductDetailsScreen()
        );
   case RoutesName.cartSection:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CartSection()
        );
   case RoutesName.checkout:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CheckoutScreen()
        );

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(child: Text('No route defined')),
            );
          },
        );
    }
  }
}
