import 'package:excellent_trade_app/pages/checkout/widgets/google_map.dart';
import 'package:excellent_trade_app/pages/home/home_exports.dart';
import 'package:excellent_trade_app/pages/order_now.dart';
import 'package:excellent_trade_app/pages/restaurant_owner/sub_screens/order_notifications_screen/order_notification_screen.dart';
import 'package:excellent_trade_app/pages/restuarant_item_screen.dart';
import '../../pages/auth/forgot_password/forget_password_export.dart';
import 'package:excellent_trade_app/model/restaurant_menu/restaurant_menu_model.dart'
    as menu_model;

import '../../pages/base_screen.dart';

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
        final args = settings.arguments as ForgotPasswordBloc?;
        if (args == null) {
          return MaterialPageRoute(
            builder: (_) {
              return const Scaffold(
                body: Center(child: Text('No route defined')),
              );
            },
          );
        } else {
          return MaterialPageRoute(
            builder: (BuildContext context) =>
                BlocProvider.value(value: args, child: const VerifyOtpScreen()),
          );
        }
      case RoutesName.baseScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const BaseScreen(),
        );
      case RoutesName.productDetails:
        final args = settings.arguments as Map<String, dynamic>?;
        final int restaurantId = args?['restaurant_id'] ?? 0;
        final menu_model.MenuItem menuItem =
            args?['menu_item'] ??
            menu_model.MenuItem(
              itemDescription: '',
              itemId: 0,
              itemName: '',
              itemPrice: '0',
              itemStatus: '',
              itemPhoto: '',
            );
        if (menuItem.itemName == '' &&
            menuItem.itemId == 0 &&
            restaurantId == 0) {
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              body: Center(
                child: Text(
                  'Menu item not found',
                  style: GoogleFonts.poppins(fontSize: 22),
                ),
              ),
            ),
          );
        }
        return MaterialPageRoute(
          builder: (BuildContext context) => ProductDetailsScreen(
            menuItem: menuItem,
            restaurantId: restaurantId,
          ),
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
        final args = settings.arguments as Map<String, dynamic>?;
        final RestaurantData restaurantData =
            args?['restaurant_data'] ??
            RestaurantData(restaurantId: 0, restaurantName: "Unknown");

        if (restaurantData.restaurantId == 0 &&
            restaurantData.restaurantName == "Unknown") {
          return MaterialPageRoute(
            builder: (BuildContext context) =>
                Scaffold(body: Center(child: Text('No Restaurant data found'))),
          );
        }

        return MaterialPageRoute(
          builder: (BuildContext context) =>
              MenuScreen(restaurantData: restaurantData),
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
      case RoutesName.restaurantOwner:
        return MaterialPageRoute(
          builder: (BuildContext context) => const RestaurantOwnerScreen(),
        );

      case RoutesName.restaurantsByCategory:
        final args = settings.arguments;

        if (args is Map<String, dynamic> && args['category_id'] is String) {
          final String categoryId = args['category_id'] as String;
          return MaterialPageRoute(
            builder: (BuildContext context) =>
                RestaurantsByCategory(categoryId: categoryId),
          );
        }
        return MaterialPageRoute(
          builder: (BuildContext context) => const Scaffold(
            body: Center(child: Text('Category ID is required')),
          ),
        );

      case RoutesName.restaurantMenu:
        final args = settings.arguments;

        if (args is Map<String, dynamic> && args['restaurant_id'] is String) {
          final String restaurantId = args['restaurant_id'] as String;
          return MaterialPageRoute(
            builder: (BuildContext context) =>
                RestaurantMenu(restaurantId: restaurantId),
          );
        }
        return MaterialPageRoute(
          builder: (BuildContext context) => const Scaffold(
            body: Center(child: Text('Restaurant ID is required')),
          ),
        );

      case RoutesName.selectRestaurant:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SelectRestaurant(),
        );

      case RoutesName.myRestaurant:
        return MaterialPageRoute(builder: (context) => MyRestaurantScreen());

      case RoutesName.menuManagement:
        final args = settings.arguments;
        final restaurantId = (args is Map<String, dynamic>)
            ? args['restaurant_id']
            : null;
        return MaterialPageRoute(
          builder: (context) => MenuManagement(restaurantId: restaurantId),
        );

      case RoutesName.registerRestaurant:
        final args = settings.arguments;
        final userIdSession = SessionController.user.id;

        String userId = userIdSession.toString();
        Restaurant? restaurant;

        if (args is Map<String, dynamic>) {
          userId = args['user_id'] ?? userIdSession;
          restaurant = args['restaurant'];
        }

        return MaterialPageRoute(
          builder: (context) =>
              RegisterRestaurant(userId: userId, restaurant: restaurant),
        );

      case RoutesName.locationScreen:
        return MaterialPageRoute(builder: (context) => LocationScreen());
      case RoutesName.googleMap:
        return MaterialPageRoute(builder: (context) => GoogleMapScreen());
      case RoutesName.orderScreen:
        return MaterialPageRoute(builder: (context) => OrderScreen());

      case RoutesName.orderNotification:
        return MaterialPageRoute(
          builder: (context) => OrderNotificationScreen(),
        );

      case RoutesName.orderHistory:
        return MaterialPageRoute(builder: (context) => OrderHistory());
      case RoutesName.performanceScreen:
        return MaterialPageRoute(builder: (context) => PerformanceScreen());

      case RoutesName.searchScreen:
        return MaterialPageRoute(builder: (context) => SearchPage());

      case RoutesName.wishList:
        return MaterialPageRoute(builder: (context) => FavouriteScreen());
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
