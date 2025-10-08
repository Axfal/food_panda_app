import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../bloc/order/order_bloc.dart';
import '../../../../data/response/status.dart';
import '../../../../model/vender/order/order_model.dart';
import '../../restaurant_owner_exports.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    final restaurantId = SessionController.restaurantId.toString();

    /// Trigger API fetch here
    context.read<OrderBloc>().add(
      FetchOrderEvent(restaurantId: restaurantId, limit: "1000", offset: "0"),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void showOrderDetails(OrderData order) {
    Timer? timer;
    int secondsLeft = 20 * 60;

    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setState) {
            // Countdown Timer
            if (secondsLeft > 0) {
              timer ??= Timer.periodic(const Duration(seconds: 1), (_) {
                setState(() {
                  if (secondsLeft > 0) secondsLeft--;
                });
              });
            } else {
              timer?.cancel();
            }

            String formatTime(int sec) {
              int m = sec ~/ 60;
              int s = sec % 60;
              return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
            }

            Widget buildInfoRow(
              String label,
              String value, {
              bool highlight = false,
            }) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "$label:",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        value.isEmpty ? "-" : value,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: highlight ? Colors.green : Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            return Dialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              insetPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 24.h,
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Header
                    Text(
                      "Order #${order.orderNumber}",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),

                    /// Auto Close Timer
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Auto close in:",
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                        Text(
                          formatTime(secondsLeft),
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    /// Order Info
                    buildInfoRow("Status", order.status),
                    buildInfoRow("Tracking", order.trackingStatus),
                    buildInfoRow(
                      "Payment",
                      "${order.paymentMethod} (${order.paymentStatus})",
                    ),
                    buildInfoRow(
                      "Total",
                      "Rs. ${order.totalAmount}",
                      highlight: true,
                    ),
                    buildInfoRow(
                      "Final Amount",
                      "Rs. ${order.finalAmount}",
                      highlight: true,
                    ),

                    const Divider(height: 20),

                    /// Customer & Delivery Info
                    // buildInfoRow("Customer ID", order.customerId.toString()),
                    // buildInfoRow("Restaurant ID", order.restaurantId.toString()),
                    // if (order.deliveryBoyId != null)
                    //   buildInfoRow("Delivery Boy ID", order.deliveryBoyId.toString()),
                    //
                    //
                    // const Divider(height: 20),

                    // /// Timestamps
                    // buildInfoRow("Created At", order.createdAt),
                    // if (order.acceptedAt != null &&
                    //     order.acceptedAt!.isNotEmpty)
                    //   buildInfoRow("Accepted At", order.acceptedAt!),
                    // if (order.preparingAt.isNotEmpty)
                    //   buildInfoRow("Preparing At", order.preparingAt),
                    // if (order.readyAt.isNotEmpty)
                    //   buildInfoRow("Ready At", order.readyAt),
                    // if (order.pickedUpAt.isNotEmpty)
                    //   buildInfoRow("Picked Up At", order.pickedUpAt),
                    // if (order.deliveredAt != null &&
                    //     order.deliveredAt!.isNotEmpty)
                    //   buildInfoRow("Delivered At", order.deliveredAt!),
                    // if (order.canceledAt.isNotEmpty)
                    //   buildInfoRow("Canceled At", order.canceledAt),
                    //
                    // const Divider(height: 20),

                    /// Special Instructions
                    if (order.specialInstructions.isNotEmpty)
                      buildInfoRow("Special Note", order.specialInstructions),
                    buildInfoRow(
                      "Address",
                      "${order.houseNo}, ${order.street}, ${order.city}",
                    ),
                    const Divider(height: 20),

                    /// Items Section
                    Text(
                      "Items:",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),

                    ...order.items.map((item) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.itemName,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            buildInfoRow("Qty", "x${item.quantity}"),
                            buildInfoRow("Price", "Rs. ${item.price}"),
                            buildInfoRow(
                              "Discount",
                              "Rs. ${item.discountAmount}",
                            ),
                            buildInfoRow(
                              "Final Price",
                              "Rs. ${item.finalPrice}",
                            ),
                            buildInfoRow(
                              "Total",
                              "Rs. ${item.totalPrice}",
                              highlight: true,
                            ),
                            if (item.variationName.isNotEmpty)
                              buildInfoRow("Variation", item.variationName),
                          ],
                        ),
                      );
                    }).toList(),

                    const SizedBox(height: 16),

                    /// Action Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              final restaurantId = SessionController
                                  .restaurantId
                                  .toString();
                              context.read<OrderBloc>().add(
                                StatusUpdateEvent(
                                  restaurantId: restaurantId,
                                  orderNumber: order.orderNumber.toString(),
                                  status: "canceled",
                                ),
                              );
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: Text(
                              "Cancel",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              final restaurantId = SessionController
                                  .restaurantId
                                  .toString();
                              String nextStatus = order.status == "pending"
                                  ? "preparing"
                                  : order.status == "preparing"
                                  ? "ready_for_pickup"
                                  : "picked_up";

                              context.read<OrderBloc>().add(
                                StatusUpdateEvent(
                                  restaurantId: restaurantId,
                                  orderNumber: order.orderNumber.toString(),
                                  status: nextStatus,
                                ),
                              );
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: order.status == 'pending'
                                  ? Colors.orange
                                  : order.status == 'preparing'
                                  ? Colors.blue
                                  : Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: Text(
                              order.status == 'pending'
                                  ? 'Accept'
                                  : order.status == 'preparing'
                                  ? 'Ready'
                                  : 'Ready to Deliver',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ).then((_) => timer?.cancel());
  }

  Widget buildOrderList(
    List<OrderData> orders,
    Function(OrderData) showOrderDetails,
  ) {
    if (orders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.receipt_long, size: 60.sp, color: Colors.black26),
            SizedBox(height: 12.h),
            Text(
              "No orders found",
              style: GoogleFonts.poppins(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: orders.length,
      padding: EdgeInsets.all(12.w),
      itemBuilder: (context, index) {
        final reverseIndex = orders.length - 1 - index;
        final order = orders[reverseIndex];

        Color statusColor;
        switch (order.status.toLowerCase()) {
          case "pending":
            statusColor = Colors.orange;
            break;
          case "preparing":
            statusColor = Colors.blue;
            break;
          case "ready_for_pickup":
            statusColor = Colors.green;
            break;
          default:
            statusColor = Colors.grey;
        }

        return Container(
          margin: EdgeInsets.only(bottom: 16.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(20.r),
            onTap: () => showOrderDetails(order),
            child: Row(
              children: [
                // Status strip
                Container(
                  width: 6.w,
                  height: 110.h,
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      bottomLeft: Radius.circular(20.r),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),

                // Order Details
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 14.h,
                      horizontal: 8.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order #${order.orderNumber}",
                          style: GoogleFonts.poppins(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Rs. ${order.finalAmount}",
                          style: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Icon(
                              Icons.payment,
                              size: 14.sp,
                              color: Colors.black45,
                            ),
                            SizedBox(width: 6.w),
                            Expanded(
                              child: Text(
                                /* 'Cash on Delivery',*/ "${order.paymentMethod} (${order.paymentStatus})",
                                style: GoogleFonts.poppins(
                                  fontSize: 13.sp,
                                  color: Colors.black54,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 14.sp,
                              color: Colors.black38,
                            ),
                            SizedBox(width: 6.w),
                            Expanded(
                              child: Text(
                                order.createdAt,
                                style: GoogleFonts.poppins(
                                  fontSize: 13.sp,
                                  color: Colors.black45,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Status label
                Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      order.status,
                      style: GoogleFonts.poppins(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: statusColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: 'Orders',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.white,
          labelStyle: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelColor: Colors.white,
          tabs: const [
            Tab(text: "Pending"),
            Tab(text: "Preparing"),
            Tab(text: "Ready"),
          ],
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            if (state.apiResponse.status == Status.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.apiResponse.status == Status.error) {
              return Center(
                child: Text(
                  state.apiResponse.message ?? "Error",
                  style: TextStyle(color: Colors.black),
                ),
              );
            }

            final allOrders = state.orders;
            final pending = allOrders
                .where((o) => o.status == "pending")
                .toList();
            final preparing = allOrders
                .where((o) => o.status == "preparing")
                .toList();
            final ready = allOrders
                .where((o) => o.status == "ready_for_pickup")
                .toList();

            return TabBarView(
              controller: _tabController,
              children: [
                buildOrderList(pending, showOrderDetails),
                buildOrderList(preparing, showOrderDetails),
                buildOrderList(ready, showOrderDetails),
              ],
            );
          },
        ),
      ),
    );
  }
}
