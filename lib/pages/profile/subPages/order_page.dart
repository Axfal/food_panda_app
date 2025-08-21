import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
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
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MyAppBar(
        title: 'Orders',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),

      body: SafeArea(
        child: Column(
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
                      debugPrint("Reorder tapped for ${order['restaurantName']}");
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
