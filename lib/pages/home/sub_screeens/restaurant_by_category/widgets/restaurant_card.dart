import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:excellent_trade_app/Utils/constants/app_colors.dart';

class RestaurantCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final double rating;
  final int reviewsCount;
  final String duration;
  final String priceLevel;
  final String cuisine;
  final int deliveryFee;
  final String discountLabel;
  final bool isAd;
  final VoidCallback? onTap;
  final VoidCallback? onFavouriteTap;
  final bool inWishList;

  const RestaurantCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.reviewsCount,
    required this.duration,
    required this.priceLevel,
    required this.cuisine,
    required this.deliveryFee,
    required this.discountLabel,
    this.isAd = false,
    this.onTap,
    this.inWishList = false,
    this.onFavouriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(14),
                  ),
                  child: SizedBox(
                    height: 140,
                    width: double.infinity,
                    child: imagePath.isNotEmpty
                        ? Image.network(
                            imagePath,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                                  color: Colors.grey.shade200,
                                  child: const Center(
                                    child: Icon(
                                      Icons.fastfood,
                                      color: Colors.grey,
                                      size: 40,
                                    ),
                                  ),
                                ),
                          )
                        : Container(
                            color: Colors.grey.shade200,
                            child: const Center(
                              child: Icon(
                                Icons.fastfood,
                                color: Colors.grey,
                                size: 40,
                              ),
                            ),
                          ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: GestureDetector(
                    onTap: onFavouriteTap,
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withValues(alpha: 0.4),
                      radius: 18,
                      child: Icon(
                        inWishList ? Icons.favorite : Icons.favorite_border,
                        size: 18,
                        color: inWishList ? AppColors.primary : Colors.white,
                      ),
                    ),
                  ),
                ),
                if (isAd)
                  Positioned(
                    left: 10,
                    top: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
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

            // 🔶 Title & Rating Row
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        '$rating',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' ($reviewsCount+)',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 🔸 Duration, Cuisine, Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              child: Text(
                '$duration • $priceLevel • $cuisine',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ),

            // 🚴 Delivery Fee
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              child: Text(
                '🚴‍♂️ From Rs.$deliveryFee with Saver',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey[700],
                ),
              ),
            ),

            // 💰 Discount Label
            if (discountLabel.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.pink.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    discountLabel,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.pink.shade900,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
