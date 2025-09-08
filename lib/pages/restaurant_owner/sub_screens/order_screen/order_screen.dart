import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/order/order_bloc.dart';
import '../../../../data/response/status.dart';
import '../../../../model/vender/order/order_model.dart';
import '../../restaurant_owner_exports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

    /// Trigger API fetch here
    context.read<OrderBloc>().add(
      const FetchOrderEvent(
        restaurantId: "5", // TODO: Replace with logged-in vendor/restaurant ID
        limit: "20",
        offset: "0",
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void showOrderDetails(OrderData order) {
    Timer? timer;
    int secondsLeft = 20 * 60; // sample ETA

    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setState) {
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

            return Dialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order #${order.orderNumber}",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),
                        if (secondsLeft > 0)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              formatTime(secondsLeft),
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Status
                    Text(
                      "Status: ${order.status}",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const Divider(height: 20),

                    // Items
                    if (order.items.isNotEmpty)
                      ...order.items.map((item) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item.itemName,
                                style: GoogleFonts.poppins(fontSize: 14),
                              ),
                              Text(
                                "x${item.quantity}",
                                style: GoogleFonts.poppins(fontSize: 14),
                              ),
                            ],
                          ),
                        );
                      })
                    else
                      Text(
                        "No items found",
                        style: GoogleFonts.poppins(fontSize: 13),
                      ),

                    const Divider(height: 20),

                    // Total
                    Text(
                      "Total: Rs.${order.finalAmount}",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Special Instructions
                    if (order.specialInstructions.isNotEmpty)
                      Text(
                        "Note: ${order.specialInstructions}",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[700],
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget buildOrderList(List<OrderData> orders, Function(OrderData) showOrderDetails) {
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
        final order = orders[index];

        // Status Color + Icon
        Color statusColor;
        IconData statusIcon;
        switch (order.status.toLowerCase()) {
          case "pending":
            statusColor = Colors.orange;
            statusIcon = Icons.access_time;
            break;
          case "preparing":
            statusColor = Colors.blue;
            statusIcon = Icons.kitchen;
            break;
          case "ready":
            statusColor = Colors.green;
            statusIcon = Icons.check_circle;
            break;
          default:
            statusColor = Colors.grey;
            statusIcon = Icons.info_outline;
        }

        return Card(
          color: Colors.white,
          elevation: 3,

          shadowColor: Colors.black12,
          margin: EdgeInsets.only(bottom: 14.h),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black26),
            borderRadius: BorderRadius.circular(18.r),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(18.r),
            onTap: () => showOrderDetails(order),
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  // Status Icon
                  Container(
                    height: 44.h,
                    width: 44.w,
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(statusIcon, color: statusColor, size: 22.sp),
                  ),
                  SizedBox(width: 14.w),

                  // Order Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Order Number & Status
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Order #${order.orderNumber}",
                                style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: statusColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Text(
                                order.status,
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: statusColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6.h),

                        // Amount
                        Text(
                          "Rs. ${order.finalAmount}",
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 4.h),

                        // Payment
                        Row(
                          children: [
                            Icon(Icons.payment, size: 14.sp, color: Colors.black45),
                            SizedBox(width: 4.w),
                            Expanded(
                              child: Text(
                                "${order.paymentMethod} (${order.paymentStatus})",
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  color: Colors.black54,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),

                        // Date
                        Row(
                          children: [
                            Icon(Icons.calendar_today, size: 14.sp, color: Colors.black38),
                            SizedBox(width: 4.w),
                            Expanded(
                              child: Text(
                                order.createdAt,
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
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

                  Icon(Icons.arrow_forward_ios, size: 16.sp, color: Colors.black38),
                ],
              ),
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
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state.apiResponse.status == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.apiResponse.status == Status.error) {
            return Center(child: Text(state.apiResponse.message ?? "Error"));
          }

          final allOrders = state.orders;
          final pending = allOrders
              .where((o) => o.status == "pending")
              .toList();
          final preparing = allOrders
              .where((o) => o.status == "preparing")
              .toList();
          final ready = allOrders.where((o) => o.status == "ready").toList();

          return TabBarView(
            controller: _tabController,
            children: [
              buildOrderList(pending, (order) => showOrderDetails(order)),
              buildOrderList(preparing, (order) => showOrderDetails(order)),
              buildOrderList(ready, (order) => showOrderDetails(order)),
            ],
          );

        },
      ),
    );
  }
}
