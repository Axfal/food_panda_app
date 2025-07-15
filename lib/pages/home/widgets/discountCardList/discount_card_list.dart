import 'package:flutter/material.dart';
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
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final card = cards[index];

          return GestureDetector(
            onTap: () => onTapCard(card),
            child: Container(
              width: 120,
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Image.asset(
                      card['image'],
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      card['title'],
                      style: const TextStyle(
                        fontWeight: AppWeights.semiBold,
                        fontSize: 14,
                        color: AppColors.textPrimary,
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
