import 'dart:async';
import '../../restaurant_owner_exports.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> newOrders = [
    {
      'id': 'ORD123',
      'customer': 'Ali Khan',
      'items': [
        {'name': 'Burger', 'qty': 2},
        {'name': 'Fries', 'qty': 1},
      ],
      'total': 15.99,
      'type': 'Delivery',
      'eta': 20,
    },
  {
      'id': 'ORD123',
      'customer': 'Ali Khan',
      'items': [
        {'name': 'Burger', 'qty': 2},
        {'name': 'Fries', 'qty': 1},
      ],
      'total': 15.99,
      'type': 'Delivery',
      'eta': 20,
    },
  {
      'id': 'ORD123',
      'customer': 'Ali Khan',
      'items': [
        {'name': 'Burger', 'qty': 2},
        {'name': 'Fries', 'qty': 1},
      ],
      'total': 15.99,
      'type': 'Delivery',
      'eta': 20,
    },
  {
      'id': 'ORD123',
      'customer': 'Ali Khan',
      'items': [
        {'name': 'Burger', 'qty': 2},
        {'name': 'Fries', 'qty': 1},
      ],
      'total': 15.99,
      'type': 'Delivery',
      'eta': 20,
    },
  ];

  final List<Map<String, dynamic>> preparingOrders = [
    {
      'id': 'ORD124',
      'customer': 'Sara Ahmed',
      'items': [
        {'name': 'Pizza', 'qty': 1},
        {'name': 'Coke', 'qty': 2},
      ],
      'total': 25.50,
      'type': 'Pickup',
      'eta': 15,
    },
  {
      'id': 'ORD124',
      'customer': 'Sara Ahmed',
      'items': [
        {'name': 'Pizza', 'qty': 1},
        {'name': 'Coke', 'qty': 2},
      ],
      'total': 25.50,
      'type': 'Pickup',
      'eta': 15,
    },
  {
      'id': 'ORD124',
      'customer': 'Sara Ahmed',
      'items': [
        {'name': 'Pizza', 'qty': 1},
        {'name': 'Coke', 'qty': 2},
      ],
      'total': 25.50,
      'type': 'Pickup',
      'eta': 15,
    },
  {
      'id': 'ORD124',
      'customer': 'Sara Ahmed',
      'items': [
        {'name': 'Pizza', 'qty': 1},
        {'name': 'Coke', 'qty': 2},
      ],
      'total': 25.50,
      'type': 'Pickup',
      'eta': 15,
    },
  ];

  final List<Map<String, dynamic>> readyOrders = [
    {
      'id': 'ORD125',
      'customer': 'Usman Riaz',
      'items': [
        {'name': 'Sushi', 'qty': 3},
      ],
      'total': 30.00,
      'type': 'Delivery',
      'eta': 0,
    },
   {
      'id': 'ORD125',
      'customer': 'Usman Riaz',
      'items': [
        {'name': 'Sushi', 'qty': 3},
      ],
      'total': 30.00,
      'type': 'Delivery',
      'eta': 0,
    },
   {
      'id': 'ORD125',
      'customer': 'Usman Riaz',
      'items': [
        {'name': 'Sushi', 'qty': 3},
      ],
      'total': 30.00,
      'type': 'Delivery',
      'eta': 0,
    },
   {
      'id': 'ORD125',
      'customer': 'Usman Riaz',
      'items': [
        {'name': 'Sushi', 'qty': 3},
      ],
      'total': 30.00,
      'type': 'Delivery',
      'eta': 0,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void showOrderDetails(Map<String, dynamic> order) {
    int eta = order['eta'];
    Timer? timer;
    int secondsLeft = eta * 60;

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
                    // Order header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order #${order['id']}",
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

                    // Customer + type
                    Text(
                      "${order['customer']} • ${order['type']}",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),

                    const Divider(height: 20),

                    // Items
                    ...order['items'].map<Widget>((item) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item['name'],
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: AppColors.black,
                              ),
                            ),
                            Text(
                              "x${item['qty']}",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),

                    const Divider(height: 20),

                    // Total
                    Text(
                      "Total: \$${order['total']}",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Action buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (_tabController.index == 0) ...[
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "Reject",
                              style: GoogleFonts.poppins(
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "Accept",
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          ),
                        ],
                        if (_tabController.index == 1) ...[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "Mark Ready",
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          ),
                        ],
                        if (_tabController.index == 2) ...[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "Complete",
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ).then((_) {
      timer?.cancel();
    });
  }

  Widget buildOrderList(List<Map<String, dynamic>> orders) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: orders.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final order = orders[index];

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.099),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),

          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => showOrderDetails(order),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Header Row ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                          "Order ${order['id']}",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // --- Customer + Order Type ---
                  Row(
                    children: [
                      Icon(Icons.person, size: 18, color: Colors.grey[600]),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          order['customer'],
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: order['type'] == "Delivery"
                              ? Colors.green.withOpacity(0.1)
                              : Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          order['type'],
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: order['type'] == "Delivery"
                                ? Colors.green
                                : Colors.orange,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // --- Items Preview ---
                  Text(
                    "${order['items'].length} items • \$${order['total']}",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.grey[700],
                    ),
                  ),

                  const SizedBox(height: 8),

                  // --- ETA Timer (if exists) ---
                  if (order['eta'] > 0)
                    Row(
                      children: [
                        const Icon(
                          Icons.timer,
                          size: 16,
                          color: Colors.redAccent,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "ETA: ${order['eta']} min",
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.redAccent,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: 'My Orders',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelStyle: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          indicatorColor: AppColors.white,
          labelColor: AppColors.white,
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelColor: Colors.white,
          tabs: const [
            Tab(text: 'New Orders'),
            Tab(text: 'Preparing'),
            Tab(text: 'Ready'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildOrderList(newOrders),
          buildOrderList(preparingOrders),
          buildOrderList(readyOrders),
        ],
      ),
    );
  }
}
