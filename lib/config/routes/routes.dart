import 'package:excellent_trade_app/config/routes/route_export.dart';
import 'package:excellent_trade_app/pages/order_now.dart';
import 'package:excellent_trade_app/pages/profile/subPages/invite_friends_screen.dart';
import 'package:excellent_trade_app/pages/restuarant_item_screen.dart';

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
          builder: (BuildContext context) => const VerifyOtpScreen(),
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomePage(),
        );
      case RoutesName.productDetails:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ProductDetailsScreen(),
        );
      case RoutesName.cartSection:
        return MaterialPageRoute(
          builder: (BuildContext context) => const CartSection(),
        );
      case RoutesName.checkout:
        return MaterialPageRoute(
          builder: (BuildContext context) => const CheckoutScreen(),
        );
      case RoutesName.menu:
        return MaterialPageRoute(
          builder: (BuildContext context) => const MenuScreen(),
        );
      case RoutesName.restaurantItems:
        return MaterialPageRoute(
          builder: (BuildContext context) => const RestaurantItemScreen(),
        );
      case RoutesName.orderNow:
        return MaterialPageRoute(
          builder: (BuildContext context) => const OrderNow(),
        );
      case RoutesName.applyForVoucher:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ApplyVoucher(),
        );
      case RoutesName.setting:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SettingsPage(),
        );
      case RoutesName.profile:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ProfileScreen(),
        );
      case RoutesName.inviteFriends:
        return MaterialPageRoute(
          builder: (BuildContext context) => const InviteFriendsScreen(),
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
