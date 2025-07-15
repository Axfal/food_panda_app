import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Utils/constants/appWeight.dart';
import '../../../../Utils/constants/app_colors.dart';
import '../cards/large_foodCard.dart';
import '../../../../globalWidgets/filter/filter_bar.dart';

class ExploreWidget extends StatefulWidget {
  final List<Map<String, dynamic>> cardsData;

  const ExploreWidget({super.key, required this.cardsData});

  @override
  State<ExploreWidget> createState() => _ExploreWidgetState();
}

class _ExploreWidgetState extends State<ExploreWidget> {
  List<Map<String, dynamic>>? filteredCards;

  @override
  void initState() {
    super.initState();
    filteredCards = widget.cardsData;
  }

  void updateFilteredCards(List<Map<String, dynamic>> newCards) {
    setState(() {
      filteredCards = newCards;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterBar(
          originalData: widget.cardsData,
          onFiltered: updateFilteredCards,
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Explore restaurants",
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: AppWeights.bold,
              color: AppColors.textPrimary,
            ),
          ),
        ),

        const SizedBox(height: 12),
        filteredCards == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredCards!.length,
                padding: const EdgeInsets.only(left: 16),
                itemBuilder: (context, index) {
                  final card = filteredCards![index];
                  return Container(
                    // width: 300,
                    margin: EdgeInsets.only(right: 8),
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
      ],
    );
  }
}
