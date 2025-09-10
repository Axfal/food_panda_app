// pages/order_notifications/order_notification_screen.dart
import 'package:excellent_trade_app/config/routes/route_export.dart';
import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../bloc/order/order_bloc.dart';
import '../../../../model/web_socket_order/web_socket_order_model.dart';

class OrderNotificationScreen extends StatelessWidget {
  const OrderNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: MyAppBar(
        title: 'Notifications',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          final orders = state.vendorOrders.reversed.toList();

          if (orders.isEmpty) {
            return Center(
              child: Text(
                'No new orders yet.',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return OrderNotificationTile(order: order);
            },
          );
        },
      ),
    );
  }
}

class OrderNotificationTile extends StatelessWidget {
  final WebSocketOrder order;
  const OrderNotificationTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, RoutesName.orderScreen);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.only(bottom: 4),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar style icon
            CircleAvatar(
              backgroundColor: Colors.deepOrange.shade100,
              radius: 22,
              child: const Icon(Icons.shopping_bag, color: Colors.deepOrange),
            ),
            const SizedBox(width: 12),

            // Notification details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Order number + label
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Order #${order.orderNumber}",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "New",
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Items summary (just first item + count)
                  Text(
                    order.items.isNotEmpty
                        ? "${order.items.first.quantity}x ${order.items.first.itemName} ${order.items.length > 1 ? " +${order.items.length - 1} more" : ""}"
                        : "No items",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),

                  // Total price
                  Text(
                    "Total: PKR ${order.finalAmount.toStringAsFixed(0)}",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Address
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          size: 14, color: Colors.deepOrange),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          "${order.houseNo}, ${order.street}, ${order.city}",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
