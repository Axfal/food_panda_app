import 'package:excellent_trade_app/config/routes/route_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../Utils/constants/appWeight.dart';
import '../../../../../Utils/constants/app_colors.dart';
import '../cards/large_foodCard.dart';
import 'full_card_list_page.dart';

class CardList extends StatelessWidget {
  final String title;

  final List<Map<String, dynamic>> cardsData;

  const CardList({super.key, required this.title, required this.cardsData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔥 Header title + button
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: AppWeights.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.chevron_right),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          FullCardListPage(title: title, cardsData: cardsData),
                    ),
                  );
                },
              ),
            ],
          ),
        ),

        // 🔥 Horizontal scrolling cards
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cardsData.length,
            padding: const EdgeInsets.only(left: 16),
            itemBuilder: (context, index) {
              final card = cardsData[index];
              return Container(
                width: 300,
                margin: EdgeInsets.only(right: 8),
                child: LargeFoodCard(
                  onTap: () => Navigator.pushNamed(context, RoutesName.productDetails),
                  imagePath: card['imagePath'],
                  title: card['title'],
                  rating: card['rating'],
                  reviewsCount: card['reviewsCount'],
                  duration: card['duration'],
                  priceLevel: card['priceLevel'],
                  cuisine: card['cuisine'],
                  deliveryFee: card['deliveryFee'],
                  discountLabel: card['discountLabel'],
                  isAd: card['isAd'],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
