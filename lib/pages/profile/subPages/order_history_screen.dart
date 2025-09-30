import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/bloc/order_history/order_history_bloc.dart';
import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Utils/constants/app_colors.dart';
import '../../../data/response/status.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  void initState() {
    super.initState();
    _fetchOrders();
  }

  void _fetchOrders() {
    final customerId = SessionController.user.id.toString();
    final bloc = context.read<OrderHistoryBloc>();

    final model = bloc.state.orderHistoryModel;

    final shouldFetch =
        (model.success != true) ||
        (model.orders == null || model.orders!.isEmpty);

    if (shouldFetch) {
      bloc.add(FetchOrdersHistoryEvent(customerId: customerId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MyAppBar(
        title: 'Orders History',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: RefreshIndicator(
        backgroundColor: AppColors.primary,
        color: Colors.white,
        onRefresh: () async {
          final customerId = SessionController.user.id.toString();
          context.read<OrderHistoryBloc>().add(
            FetchOrdersHistoryEvent(customerId: customerId),
          );
        },

        child: SafeArea(
          child: BlocBuilder<OrderHistoryBloc, OrderHistoryState>(
            builder: (context, state) {
              switch (state.apiResponse.status) {
                case Status.loading:
                  return const Center(
                    child: CupertinoActivityIndicator(color: Colors.black54),
                  );

                case Status.error:
                  return _ErrorState(
                    message:
                        state.apiResponse.message ?? "Something went wrong",
                    onRetry: _fetchOrders,
                  );

                case Status.completed:
                  final orders = state.orderHistoryModel.orders ?? [];
                  if (orders.isEmpty) {
                    return const _EmptyState();
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: orders.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final order = orders[index];
                      final items = order.items ?? [];

                      return _OrderCard(
                        orderNumber: order.orderNumber ?? "",
                        status: order.status ?? "",
                        amount: order.finalAmount ?? "0.0",
                        createdAt: order.createdAt ?? "",
                        houseNo: order.houseNo ?? "",
                        street: order.street ?? "",
                        city: order.city ?? "",
                        items: items
                            .map(
                              (e) => {
                                "item_name": e.itemName ?? "",
                                "quantity": e.quantity ?? 0,
                              },
                            )
                            .toList(),
                      );
                    },
                  );

                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorState({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 48),
          const SizedBox(height: 12),
          Text(
            message,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "No orders found",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final String orderNumber;
  final String status;
  final String amount;
  final String createdAt;
  final String houseNo;
  final String street;
  final String city;
  final List<Map<String, dynamic>> items;

  const _OrderCard({
    required this.orderNumber,
    required this.status,
    required this.amount,
    required this.createdAt,
    required this.houseNo,
    required this.street,
    required this.city,
    required this.items,
  });

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'picked_up':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'delivered':
        return Colors.blue;
      case 'canceled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _statusColor(status);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.receipt_long, color: statusColor),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      orderNumber,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Placed on ${createdAt.split(" ").first}',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  status.toUpperCase(),
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          Row(
            children: [
              Icon(Icons.location_on, size: 14, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  'House $houseNo, Street $street, $city',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: items
                .map(
                  (e) => Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.grey[100],
                    label: Text(
                      '${e["item_name"]} x${e["quantity"]}',
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const Divider(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Paid',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                'Rs $amount',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
