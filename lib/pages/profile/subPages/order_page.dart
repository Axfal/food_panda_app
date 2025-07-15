import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Utils/constants/appWeight.dart';
import '../../../Utils/constants/app_colors.dart';
import 'widgets/order/order_card.dart';
import 'widgets/order/orders_data.dart';

class PastOrdersPage extends StatelessWidget {
  const PastOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          toolbarHeight: 50,
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, size: 20),
                ),
                const SizedBox(width: 10),
                Text(
                  "Orders",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: AppWeights.semiBold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              color: AppColors.textSecondary.withOpacity(0.25),
              height: 1,
            ),
          ),
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Past orders",
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: AppWeights.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: pastOrders.length,
                itemBuilder: (context, index) {
                  final order = pastOrders[index];
                  return OrderCard(
                    restaurantName: order['restaurantName'],
                    amount: order['amount'],
                    dateTime: order['dateTime'],
                    items: order['items'],
                    rating: order['rating'],
                    imagePath: order['imagePath'],
                    onReorder: () {
                      debugPrint(
                        "Reorder tapped for ${order['restaurantName']}",
                      );
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
