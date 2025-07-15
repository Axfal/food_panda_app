import 'package:flutter/material.dart';
import '../../../../../../Utils/constants/app_colors.dart';
import '../../../../../data/food_card_model.dart';

class DishDiscountCard extends StatelessWidget {
  final FoodCardModel dish;

  const DishDiscountCard({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double oldPrice = dish.price / (1 - dish.discountPercent / 100);

    return Card(
      color: AppColors.white,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔥 Header (full width, at top)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                const Icon(Icons.restaurant, size: 14, color: Colors.orange),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    dish.title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Icon(Icons.star, size: 14, color: Colors.amber),
                const SizedBox(width: 2),
                Text(
                  '${dish.rating} (${dish.reviewsCount}+)',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // 🔥 Main content: details + image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dish.dishName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        dish.servingInfo,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 6),

                      Row(
                        children: [
                          Text(
                            'Rs.${dish.price}',
                            style: const TextStyle(
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Rs.${oldPrice.toStringAsFixed(0)}',
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${dish.discountPercent}% off',
                            style: const TextStyle(
                              color: Colors.pink,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 10),

                // Right image
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    dish.imagePath,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),

          // 🔥 Divider before delivery
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(thickness: 1, color: Colors.grey),
          ),

          // 🔥 Delivery row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                const Icon(Icons.pedal_bike, size: 14, color: Colors.grey),
                const SizedBox(width: 3),
                Text(
                  'Rs.${dish.deliveryFee}',
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.access_time, size: 14, color: Colors.grey),
                const SizedBox(width: 3),
                Text(dish.duration, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // 🔥 See more offers with gradient
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withOpacity(0.15),
                  Colors.transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: AppColors.primary.withOpacity(0.15),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/icons/percentage.png',
                      height: 18,
                      width: 18,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(width: 4),
                Text(
                  'See more offers in restaurant',
                  style: TextStyle(color: AppColors.primary, fontSize: 12),
                ),
                const Spacer(),
                const Icon(Icons.chevron_right, size: 16, color: Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
