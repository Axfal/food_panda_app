import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/constants/appWeight.dart';
import '../../Utils/constants/app_colors.dart';
import '../../globalWidgets/filter/filter_bar.dart';
import '../Campaign/campain_page.dart';
import '../home/widgets/cardList/card_list.dart';
import '../data/card_data.dart';
import '../home/widgets/discountCardList/discount_card_list.dart';
import '../home/widgets/discountCardList/discount_data.dart';
import 'widgets/Row_card.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({super.key});

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  List<Map<String, dynamic>>? filteredCards;

  @override
  void initState() {
    super.initState();
    filteredCards = foodCards;
  }

  void updateFilteredCards(List<Map<String, dynamic>> newCards) {
    setState(() {
      filteredCards = newCards;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 5, 0, 0),
            width: double.infinity,
            color: const Color.fromARGB(255, 255, 233, 237),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 6, right: 12),
                          child: Icon(
                            Icons.arrow_back_outlined,
                            size: 26,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        'Offers',
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: AppWeights.extraBold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),

                Image.asset(
                  'assets/images/offers_panda.jpg',
                  // height: 150,
                  width: 180,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
          Container(
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CardList(
                title: 'Top offers for you',
                cardsData: foodCards,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Discover more deals",
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: AppWeights.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  DiscountCardList(
                    cards: discountCards,
                    onTapCard: (card) {
                      final data = card['DiscountData'];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CampaignPage(
                            campaignImage: data['campaignImage'],
                            sheetTitle: data['sheetTitle'],
                            sheetSubtitle: data['sheetSubtitle'],
                            cardsData: List<Map<String, dynamic>>.from(
                              data['cardsData'],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            color: AppColors.white,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                FilterBar(
                  originalData: foodCards,
                  onFiltered: updateFilteredCards,
                ),
                const SizedBox(height: 10),
                ...filteredCards!.map(
                  (card) => Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 12,
                    ),
                    child: RowCard(
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
