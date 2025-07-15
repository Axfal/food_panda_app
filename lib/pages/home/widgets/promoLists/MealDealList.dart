import 'package:excellent_trade_app/Utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../cards/promo_deal_card.dart';
import '../../../data/meal_deals.dart';
import 'widgets/promoheader.dart';

class MealDealList extends StatelessWidget {
  const MealDealList({super.key});

  @override
  Widget build(BuildContext context) {
    // Filter meals with at least 30% discount
    final filteredDeals = mealDeals.where((meal) {
      final original = meal['originalPrice'] as double;
      final current = meal['price'] as double;
      final discount = (original - current) / original * 100;
      return discount >= 30;
    }).toList();

    if (filteredDeals.isEmpty) {
      return const SizedBox.shrink(); // No deals to show
    }

    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.lightPink, AppColors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PromoHeader(
            icon: Icons.local_dining,
            title: 'Meal for one',
            highlight: 'from Rs.299',
            subtitle: 'No minimum spend is required',
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filteredDeals.length,
              padding: const EdgeInsets.only(left: 12),
              itemBuilder: (context, index) {
                final meal = filteredDeals[index];
                return PromoDealCard(
                  image: meal['image'],
                  title: meal['title'],
                  price: meal['price'],
                  originalPrice: meal['originalPrice'],
                  delivery: meal['delivery'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
