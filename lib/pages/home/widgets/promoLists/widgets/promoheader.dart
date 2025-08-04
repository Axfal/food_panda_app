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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DishesOnDiscountPage(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, size: 26, color: AppColors.primary),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 🔸 Title with Highlight
                      Text.rich(
                        TextSpan(
                          text: '$title ',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: AppWeights.bold,
                            color: AppColors.textPrimary,
                          ),
                          children: [
                            TextSpan(
                              text: highlight,
                              style: GoogleFonts.poppins(
                                color: Colors.pinkAccent,
                                fontWeight: AppWeights.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 4),

                      // 🔹 Subtitle
                      Text(
                        subtitle,
                        style: GoogleFonts.poppins(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 8),
                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black45),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
