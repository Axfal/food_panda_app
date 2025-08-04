import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../Utils/constants/app_colors.dart';
import '../../../../../Utils/constants/appWeight.dart';

class DiscountCardList extends StatelessWidget {
  final List<Map<String, dynamic>> cards;
  final void Function(Map<String, dynamic>) onTapCard;

  const DiscountCardList({
    super.key,
    required this.cards,
    required this.onTapCard,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final card = cards[index];

          return GestureDetector(
            onTap: () => onTapCard(card),
            child: Container(
              width: 140,
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔸 Image/Icon
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      color: Colors.grey.shade100,
                      child: const Center(
                        child: Icon(
                          Icons.fastfood_rounded,
                          size: 40,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ),

                  // 🔹 Title
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 6),
                    child: Text(
                      card['title'] ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: AppWeights.semiBold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),

                  // 🔻 Optional Discount Badge
                  if (card.containsKey('discount') && card['discount'].toString().isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 12, bottom: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.red.shade100,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          card['discount'],
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Colors.red.shade800,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
