import 'package:flutter/material.dart';

import '../../../globalWidgets/PrimeryWidgets/my_app_bar.dart';

class OrderProgressScreen extends StatelessWidget {
  const OrderProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Order Progress'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Orders Overview
            const Text(
              'Orders Overview',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              children: [
                statCard('Total Orders', 120, Colors.blue),
                statCard('Pending', 15, Colors.orange),
                statCard('Completed', 90, Colors.green),
                statCard('Cancelled', 5, Colors.red),
                statCard('In Process', 10, Colors.purple),
              ],
            ),
            const SizedBox(height: 16),

            // Discounts / Deals
            const Text(
              'Live Discounts & Deals',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            dealCard('Summer Special', '10% off on all orders', true),
            dealCard('Weekend Offer', 'Buy 1 Get 1 Free', false),

            const SizedBox(height: 16),
            // Vouchers
            const Text(
              'Vouchers Used',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            statCard('Used Vouchers', 25, Colors.teal),

            const SizedBox(height: 16),
            // Live Promotions
            const Text(
              'Live Promotions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            dealCard('Free Delivery Weekend', 'Valid till 31 Aug', true),
          ],
        ),
      ),
    );
  }

  Widget statCard(String title, int count, Color color) {
    return Card(
      color: color.withOpacity(0.1),
      child: Center(
        child: ListTile(
          title: Text(
            '$count',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          subtitle: Text(title, style: TextStyle(color: color)),
        ),
      ),
    );
  }

  Widget dealCard(String title, String description, bool isActive) {
    return Card(
      color: isActive
          ? Colors.green.withOpacity(0.1)
          : Colors.grey.withOpacity(0.1),
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: isActive
            ? const Icon(Icons.check_circle, color: Colors.green)
            : const Icon(Icons.cancel, color: Colors.red),
      ),
    );
  }
}
