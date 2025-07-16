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
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  imagePath,
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 8,
                bottom: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 16,
                  child: Icon(Icons.favorite, size: 18, color: Colors.pink),
                ),
              ),
              if (isAd)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Ad',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: AppWeights.extraBold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 12,
                      // fontWeight: AppWeights.bold,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '$rating',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(' ($reviewsCount+)', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Text(
              '$duration • $priceLevel • $cuisine',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '🚴‍♂️Rs.$deliveryFee ',
              style: TextStyle(color: Colors.grey[700], fontSize: 12),
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
