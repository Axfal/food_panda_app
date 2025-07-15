import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../Utils/constants/app_colors.dart';
import '../../../../../Utils/constants/appWeight.dart';
import '../promoPages/promo_page.dart';

class PromoHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String highlight;
  final String subtitle;

  const PromoHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.highlight,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.black87),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    text: '$title ',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: AppWeights.bold,
                      color: AppColors.textPrimary,
                    ),
                    children: [
                      TextSpan(
                        text: highlight,
                        style: const TextStyle(color: Colors.pink),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DishesOnDiscountPage(),
                ),
              );
            },
            child: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ],
      ),
    );
  }
}
