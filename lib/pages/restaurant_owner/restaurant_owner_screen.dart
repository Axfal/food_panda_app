import 'package:badges/badges.dart' as badges;
import 'package:excellent_trade_app/pages/restaurant_owner/widgets/featured_card.dart';
import 'package:excellent_trade_app/pages/restaurant_owner/widgets/logout_dialog_box.dart';
import 'package:excellent_trade_app/pages/restaurant_owner/widgets/summary_itme.dart';
import '../../bloc/order/order_bloc.dart';
import '../../service/web_socket_service/web_socket_service.dart';
import '../auth/forgot_password/forget_password_export.dart';
import 'restaurant_owner_exports.dart';

class RestaurantOwnerScreen extends StatefulWidget {
  const RestaurantOwnerScreen({super.key});

  @override
  State<RestaurantOwnerScreen> createState() => _RestaurantOwnerScreenState();
}

class _RestaurantOwnerScreenState extends State<RestaurantOwnerScreen> {
  late String userId;
  late List<Map<String, dynamic>> features;
  late WebSocketService _webSocketService;
  int unreadNotifications = 3;

  @override
  void initState() {
    super.initState();
    userId = SessionController.user.id.toString();

    // Connect WebSocket for vendor
    _webSocketService = WebSocketService(url: "wss://itgenesis.space/ws/");
    _webSocketService.connect();

    features = [
      {"title": "Profile", "icon": Icons.person, "route": RoutesName.profile},
      {
        "title": "My Restaurants",
        "icon": Icons.store,
        "route": RoutesName.myRestaurant,
      },
      {
        "title": "New Restaurant",
        "icon": Icons.store_mall_directory,
        "route": RoutesName.registerRestaurant,
        'arg': {'user_id': userId},
      },
      {
        "title": "Menu Items",
        "icon": Icons.fastfood,
        "route": RoutesName.selectRestaurant,
        // 'arg': {'restaurant_id': "6"},
      },
      {"title": "Orders", "icon": Icons.shopping_bag, "route": RoutesName.orderScreen},
      {"title": "Order History", "icon": Icons.history, "route": RoutesName.orderHistory},
      {
        "title": "Performance",
        "icon": Icons.bar_chart,
        "route": RoutesName.performanceScreen,
      },
      {
        "title": "Logout",
        "icon": Icons.logout,
        "action": (context) => showLogoutDialog(context),
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: MyAppBar(
        title: 'Vendor Dashboard',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: BlocBuilder<OrderBloc, OrderState>(
              builder: (context, state) {
                return InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    context.read<OrderBloc>().emit(
                      state.copyWith(unreadOrders: 0),
                    );
                    Navigator.pushNamed(context, RoutesName.orderNotification);
                  },
                  child: badges.Badge(
                    position: badges.BadgePosition.topEnd(top: -5, end: -4),
                    badgeContent: Text(
                      state.unreadOrders.toString(),
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    showBadge: state.unreadOrders > 0,
                    badgeStyle: badges.BadgeStyle(
                      badgeColor: Colors.redAccent,
                      padding: const EdgeInsets.all(5),
                      elevation: 0,
                      borderSide: const BorderSide(color: Colors.white, width: 1),
                    ),
                    child: const Icon(
                      Icons.notifications_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [
            // Sales Summary Card
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: 0.95),
                    AppColors.primary.withValues(alpha: 0.75),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black54.withValues(alpha: 0.3),
                    blurRadius: 6,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  SummaryItem(title: "Today", value: "\$250"),
                  SummaryItem(title: "This Week", value: "\$1,250"),
                  SummaryItem(title: "This Month", value: "\$5,400"),
                ],
              ),
            ),

            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: features.length,
                itemBuilder: (context, index) {
                  final feature = features[index];
                  return FeatureCard(
                    title: feature["title"],
                    icon: feature["icon"],
                    onTap: () {
                      if (feature.containsKey("route")) {
                        if (feature.containsKey('arg')) {
                          Navigator.pushNamed(
                            context,
                            feature["route"],
                            arguments: feature['arg'],
                          );
                        } else {
                          Navigator.pushNamed(context, feature["route"]);
                        }
                      } else if (feature.containsKey("action")) {
                        feature["action"](context);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
