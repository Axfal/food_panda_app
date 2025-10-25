import 'package:badges/badges.dart' as badges;
import 'package:excellent_trade_app/bloc/income/income_bloc.dart';
import 'package:excellent_trade_app/pages/restaurant_owner/widgets/featured_card.dart';
import 'package:excellent_trade_app/pages/restaurant_owner/widgets/logout_dialog_box.dart';
import 'package:excellent_trade_app/pages/restaurant_owner/widgets/summary_itme.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../bloc/account/profile/profile_bloc.dart';
import '../../bloc/order/order_bloc.dart';
import '../../bloc/vendor/restaurant/restaurant_bloc.dart';
import '../../model/web_socket_order/web_socket_order_model.dart';
import '../../service/sound_service/notification_sound_service.dart';
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
  late String restaurantId;
  late List<Map<String, dynamic>> features;
  late WebSocketService _webSocketService;
  int unreadNotifications = 3;

  @override
  void initState() {
    super.initState();
    userId = SessionController.user.id.toString();
    restaurantId = SessionController.user.restaurantId.toString();
    _webSocketService = WebSocketService(url: "wss://itgenesis.space/ws/");
    _webSocketService.connect();
    context.read<RestaurantBloc>().add(FetchRestaurantEvent());
    context.read<ProfileBloc>().add(FetchProfileEvent(id: userId));
    context.read<IncomeBloc>().add(
      FetchTodayIncomeEvent(restaurantId: restaurantId, type: "today"),
    );
    context.read<IncomeBloc>().add(
      FetchWeeklyIncomeEvent(restaurantId: restaurantId, type: "week"),
    );
    context.read<IncomeBloc>().add(
      FetchMonthlyIncomeEvent(restaurantId: restaurantId, type: "month"),
    );

    final bloc = context.read<RestaurantBloc>();
    final myRestaurantId =
        int.tryParse(SessionController.restaurantId.toString()) ?? 0;

    final restaurant = bloc.state.restaurants?.firstWhere(
      (r) => r.id == myRestaurantId,
      orElse: () => const Restaurant(
        name: '',
        id: 0,
        categories: [],
        description: "",
        status: '',
        ownerId: 0,
        hours: '',
        phone: '',
        createdAt: "",
        location: Location(
          restaurantId: 0,
          placeId: '0',
          address: "",
          lat: "",
          lng: "",
        ),
        rating: "",
        logo: '',
      ),
    );

    features = [
      {
        "title": "Profile",
        "icon": LucideIcons.user,
        "route": RoutesName.profile,
      },
      {
        "title": "My Restaurants",
        "icon": LucideIcons.store,
        "route": RoutesName.registerRestaurant,
        'arg': {'user_id': userId, "restaurant": restaurant},
      },
      // {
      //   "title": "New Restaurant",
      //   "icon": Icons.store_mall_directory,
      //   "route": RoutesName.registerRestaurant,
      //   'arg': {'user_id': userId},
      // },
      {
        "title": "Menu",

        /// menu management
        "icon": LucideIcons.utensilsCrossed,
        "route": RoutesName.menuManagement,
        'arg': {'restaurant_id': "5"},
      },
      {
        "title": "Orders",
        "icon": LucideIcons.shoppingBag,
        "route": RoutesName.orderScreen,
      },
      // {
      //   "title": "Order History",
      //   "icon": Icons.history,
      //   "route": RoutesName.orderHistory,
      // },
      {
        "title": "Performance",
        "icon": LucideIcons.pieChart,
        "route": RoutesName.performanceScreen,
      },
      {
        "title": "Logout",
        "icon": LucideIcons.logOut,
        "action": (context) => showLogoutDialog(context),
      },
    ];
  }

  void _showOrderDialog(BuildContext context, WebSocketOrder order) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.receipt_long,
                        color: AppColors.primary,
                        size: 28,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Order #${order.orderNumber}",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.green,
                              size: 18,
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                "${order.houseNo}, ${order.street}, ${order.city}",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (order.lat != 0 && order.lng != 0) ...[
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(
                                Icons.map,
                                color: Colors.blue,
                                size: 16,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "Lat: ${order.lat}, Lng: ${order.lng}",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "Items",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),

                  ...order.items.map(
                    (item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "${item.itemName} ×${item.quantity}",
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Rs ${item.totalPrice.toStringAsFixed(0)}",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              if (item.discountAmount > 0)
                                Text(
                                  "- Rs ${item.discountAmount.toStringAsFixed(0)}",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: AppColors.primary,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Divider(
                    height: 28,
                    thickness: 1,
                    color: Colors.black45,
                  ),

                  Column(
                    children: [
                      _buildAmountRow("Subtotal", order.totalAmount),
                      if (order.totalAmount != order.finalAmount)
                        _buildAmountRow(
                          "Discount",
                          order.totalAmount - order.finalAmount,
                          isDiscount: true,
                        ),
                      const Divider(
                        height: 28,
                        thickness: 1,
                        color: Colors.black45,
                      ),
                      _buildAmountRow(
                        "Final Total",
                        order.finalAmount,
                        isTotal: true,
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          // icon: const Icon(Icons.close, color: Colors.redAccent),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: AppColors.primary,
                              width: 1.3,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () {
                            NotificationSound.stopNotification();
                            Navigator.pop(context);
                          },
                          label: Text(
                            "Cancel",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: ElevatedButton.icon(
                          // icon: const Icon(Icons.check_circle, color: Colors.white),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            elevation: 3,
                          ),
                          onPressed: () {
                            NotificationSound.stopNotification();
                            Navigator.pop(context);
                            Navigator.pushNamed(
                              context,
                              RoutesName.orderScreen,
                            );
                          },
                          label: Text(
                            "Proceed",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAmountRow(
    String label,
    double amount, {
    bool isDiscount = false,
    bool isTotal = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
              color: isDiscount ? Colors.red : Colors.black87,
            ),
          ),
          Text(
            "Rs ${amount.toStringAsFixed(0)}",
            style: GoogleFonts.poppins(
              fontSize: isTotal ? 18 : 14,
              fontWeight: FontWeight.bold,
              color: isDiscount
                  ? Colors.red
                  : isTotal
                  ? Colors.green.shade700
                  : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderBloc, OrderState>(
      listenWhen: (previous, current) =>
          previous.webSocketOrder.orderId != current.webSocketOrder.orderId,
      listener: (context, state) {
        if (state.webSocketOrder.orderId.isNotEmpty) {
          _showOrderDialog(context, state.webSocketOrder);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: MyAppBar(
          title: 'Dashboard',
          actions: [

            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      context.read<OrderBloc>().emit(
                        state.copyWith(unreadOrders: 0),
                      );
                      Navigator.pushNamed(
                        context,
                        RoutesName.orderNotification,
                      );
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
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      child: const Icon(
                        Icons.notifications_rounded,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, RoutesName.conversationScreen),
              icon: const Icon(
                size: 25,
                LucideIcons.messageCircle,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 4,)
          ],
        ),

        body: SafeArea(
          child: Column(
            children: [
              // Sales Summary Card
              BlocBuilder<IncomeBloc, IncomeState>(
                buildWhen: (current, previous) =>
                    current.todayIncomeModel != previous.todayIncomeModel ||
                    current.weeklyIncomeModel != previous.weeklyIncomeModel ||
                    current.monthIncomeModel != previous.monthIncomeModel,
                builder: (context, incomeState) {
                  final today = incomeState.todayIncomeModel.todayIncome ?? 0;
                  final week = incomeState.weeklyIncomeModel.weekIncome ?? 0;
                  final month = incomeState.monthIncomeModel.monthIncome ?? 0;

                  return Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.099),
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SummaryItem(
                          title: "Today",
                          value: "Rs $today",
                          circleColor: Colors.white,
                          gradientColors: [
                            Colors.orange.shade400,
                            Colors.deepOrange.shade600,
                          ],
                        ),
                        SummaryItem(
                          title: "This Week",
                          value: "Rs $week",
                          circleColor: Colors.white,
                          gradientColors: [
                            Colors.blue.shade400,
                            Colors.blue.shade700,
                          ],
                        ),
                        SummaryItem(
                          title: "This Month",
                          value: "Rs $month",
                          circleColor: Colors.white,
                          gradientColors: [
                            Colors.green.shade400,
                            Colors.green.shade700,
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),

              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.09,
                  ),
                  itemCount: features.length,
                  itemBuilder: (context, index) {
                    final feature = features[index];
                    return InkWell(
                      borderRadius: BorderRadius.circular(12),
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
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.white, Colors.grey.shade50],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 6,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 16,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 42,
                              width: 42,
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(
                                  alpha: 0.08,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                feature["icon"],
                                size: 22,
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              feature["title"],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
