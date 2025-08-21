import 'package:excellent_trade_app/Utils/constants/appWeight.dart';
import 'package:excellent_trade_app/Utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class FavFoodCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final double rating;
  final int reviewsCount;
  final String duration;
  final String priceLevel;
  final String cuisine;
  final int deliveryFee;
  final bool isAd;

  const FavFoodCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.reviewsCount,
    required this.duration,
    required this.priceLevel,
    required this.cuisine,
    required this.deliveryFee,
    this.isAd = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image + Favorite + Ad Badge
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Container(
                  height: 170,
                  width: double.infinity,
                  color: AppColors.primary.withValues(alpha: .08),
                  child: const Icon(Icons.fastfood, size: 40, color: Colors.grey),
                ),
              ),
              // Favorite button
              Positioned(
                right: 12,
                bottom: 12,
                child: Material(
                  color: Colors.white,
                  shape: const CircleBorder(),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Icon(Icons.favorite, size: 18, color: AppColors.primary),
                  ),
                ),
              ),
              // Ad badge
              if (isAd)
                Positioned(
                  right: 12,
                  top: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Ad',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          // Title + Rating
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: AppWeights.extraBold,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 14),
                    const SizedBox(width: 3),
                    Text(
                      rating.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' ($reviewsCount+)',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Cuisine + Duration + Price Level
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            child: Text(
              '$duration • $priceLevel • $cuisine',
              style: TextStyle(color: Colors.grey[700], fontSize: 12),
            ),
          ),

          // Delivery fee
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Row(
              children: [
                const Icon(Icons.delivery_dining, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  'Rs. $deliveryFee',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
