import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Utils/constants/appWeight.dart';
import '../../../../Utils/constants/app_colors.dart';
import '../cards/large_foodCard.dart';

class FullCardListPage extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> cardsData;

  const FullCardListPage({
    super.key,
    required this.title,
    required this.cardsData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(36),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.5),
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(100),

                    child: const Icon(Icons.arrow_back, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: AppWeights.semiBold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: cardsData.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final card = cardsData[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: LargeFoodCard(
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
    );
  }
}
